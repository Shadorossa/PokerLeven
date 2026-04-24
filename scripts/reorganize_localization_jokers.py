#!/usr/bin/env python3
"""
Script para reorganizar los jokers en localization/es_ES.lua
según el orden de los archivos de equipo (IE*_*_*.lua)

Uso:
    python3 reorganize_localization_jokers.py

El script:
1. Lee todos los archivos de equipo en orden (IE1_A, IE1_B, ..., IE9_Z)
2. Extrae los nombres de los jokers en el orden que aparecen
3. Reorganiza la sección Joker en localization/es_ES.lua
4. Agrupa todas las variantes de cada joker (sufijos: _inf, Dark, _IJ, etc.)
5. Preserva todos los jokers que no tienen match en los archivos de equipo
"""

import re
import os
from pathlib import Path

def extract_jokers_from_file(filepath):
    """Extrae los nombres de jokers de un archivo de equipo en orden."""
    jokers = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Patrón: local NombreJoker = J({
    pattern = r'local\s+(\w+)\s*=\s*J\s*\('
    for match in re.finditer(pattern, content):
        jokers.append(match.group(1))

    return jokers

def get_sorted_team_files(players_dir):
    """Obtiene los archivos de equipo ordenados por versión, letra y nombre."""
    files = []
    for filename in sorted(os.listdir(players_dir)):
        if filename.startswith('IE') and filename.endswith('.lua'):
            filepath = os.path.join(players_dir, filename)
            files.append(filepath)
    return files

def build_joker_order(players_dir):
    """
    Construye el orden de jokers a partir de los archivos de equipo.

    Returns:
        list: Nombres de jokers en el orden exacto que aparecen en los archivos
    """
    joker_order = []
    team_files = get_sorted_team_files(players_dir)

    for team_file in team_files:
        team_name = os.path.basename(team_file)
        jokers = extract_jokers_from_file(team_file)
        joker_order.extend(jokers)
        print("[OK] {}: {} jokers".format(team_name, len(jokers)))

    return joker_order

def find_joker_section_boundaries(localization_content):
    """
    Encuentra el inicio y fin de la sección Joker = { } usando conteo de llaves.

    Returns:
        tuple: (start_pos, end_pos)
    """
    joker_start = localization_content.find("Joker = {")
    if joker_start == -1:
        return -1, -1

    # Contar llaves para encontrar el cierre correcto
    pos = joker_start + len("Joker = {")
    brace_count = 1

    while pos < len(localization_content) and brace_count > 0:
        char = localization_content[pos]
        if char == '{':
            brace_count += 1
        elif char == '}':
            brace_count -= 1
        pos += 1

    # pos ahora está justo después del }, así que retornamos pos como end
    return joker_start, pos

def extract_joker_entries(localization_content):
    """
    Extrae todas las entradas de jokers del archivo de localización.

    Returns:
        tuple: (dict: {j_ina_key: full_entry_string}, start_pos, end_pos, list: order_of_keys)
    """
    joker_entries = {}
    joker_order_in_file = []  # Preservar el orden original
    lines = localization_content.split('\n')

    i = 0
    while i < len(lines):
        line = lines[i]

        # Detectar inicio de entrada de joker
        if 'j_ina_' in line and '= {' in line:
            # Extraer el nombre de la clave
            match = re.search(r'(j_ina_\w+)\s*=\s*\{', line)
            if match:
                key = match.group(1)
                entry_lines = [line]

                # Recolectar todas las líneas hasta encontrar el cierre }
                i += 1
                brace_count = 1  # Ya tenemos una { en la línea actual

                while i < len(lines) and brace_count > 0:
                    current_line = lines[i]
                    entry_lines.append(current_line)

                    # Contar llaves para detectar el cierre correcto
                    brace_count += current_line.count('{') - current_line.count('}')
                    i += 1

                # Reconstruir la entrada (SIN el comma final, ya que lo agregamos al unir)
                full_entry = '\n'.join(entry_lines)
                # Remover la coma final si existe
                if full_entry.rstrip().endswith(','):
                    full_entry = full_entry.rstrip()[:-1]
                joker_entries[key] = full_entry.rstrip()
                joker_order_in_file.append(key)
                continue

        i += 1

    # Encontrar los límites de la sección Joker usando conteo correcto
    joker_block_start, joker_block_end = find_joker_section_boundaries(localization_content)

    return joker_entries, joker_block_start, joker_block_end, joker_order_in_file

def map_joker_variants(joker_entries):
    """
    Mapea nombres base de jokers a todas sus variantes.

    Por ejemplo: Kevin -> [j_ina_Kevin, j_ina_Kevin_inf, j_ina_KevinDark, ...]

    Returns:
        dict: {base_name: [j_ina_variant1, j_ina_variant2, ...]}
    """
    joker_variants = {}

    for key in joker_entries.keys():
        # Extrae el nombre base (antes del primer guion bajo o al final)
        match = re.match(r'j_ina_(\w+?)(?:_|$)', key)
        if match:
            base = match.group(1)
            if base not in joker_variants:
                joker_variants[base] = []
            joker_variants[base].append(key)

    return joker_variants

def reorganize_joker_section(joker_order, joker_entries, joker_variants, joker_order_in_file):
    """
    Reorganiza los jokers en el orden correcto.
    Agrupa todas las variantes de cada joker juntas.
    Preserva los jokers que no están en los archivos de equipo.
    """
    new_entries = []
    processed = set()
    processed_keys = set()

    # Primero, agregar los jokers que tienen match en los archivos de equipo
    for base_name in joker_order:
        if base_name in joker_variants and base_name not in processed:
            # Procesa todas las variantes del joker en orden alfabético
            for variant_key in sorted(joker_variants[base_name]):
                if variant_key in joker_entries:
                    new_entries.append(joker_entries[variant_key])
                    processed_keys.add(variant_key)
            processed.add(base_name)

    # Luego, agregar los jokers que no tienen match en los archivos de equipo
    # en el orden original que tenían en la localización
    for key in joker_order_in_file:
        if key not in processed_keys:
            new_entries.append(joker_entries[key])
            processed_keys.add(key)

    return new_entries

def main():
    """Función principal del script."""
    print("=" * 70)
    print("REORGANIZADOR DE JOKERS - PokerLeven Mod")
    print("=" * 70)

    # Obtener directorios
    script_dir = Path(__file__).parent.parent
    players_dir = script_dir / "players"
    localization_file = script_dir / "localization" / "es_ES.lua"

    print("\n[INFO] Directorio de equipos: {}".format(players_dir))
    print("[INFO] Archivo de localizacion: {}".format(localization_file))

    if not players_dir.exists():
        print("[ERROR] No se encontro {}".format(players_dir))
        return False

    if not localization_file.exists():
        print("[ERROR] No se encontro {}".format(localization_file))
        return False

    # Paso 1: Extraer orden de jokers de los archivos de equipo
    print("\n" + "=" * 70)
    print("PASO 1: Extrayendo jokers de archivos de equipo...")
    print("=" * 70)

    joker_order = build_joker_order(str(players_dir))
    print("\n[OK] Total de jokers encontrados: {}".format(len(joker_order)))
    print("[OK] Jokers unicos: {}".format(len(set(joker_order))))

    # Paso 2: Leer el archivo de localización
    print("\n" + "=" * 70)
    print("PASO 2: Leyendo archivo de localizacion...")
    print("=" * 70)

    with open(localization_file, 'r', encoding='utf-8') as f:
        localization_content = f.read()

    print("[OK] Archivo leido exitosamente")

    # Paso 3: Extraer entradas de jokers
    print("\n" + "=" * 70)
    print("PASO 3: Extrayendo entradas de jokers del archivo de localizacion...")
    print("=" * 70)

    joker_entries, joker_start, joker_end, joker_order_in_file = extract_joker_entries(localization_content)
    print("[OK] Entradas de jokers encontradas: {}".format(len(joker_entries)))

    if not joker_entries:
        print("[ERROR] No se encontraron entradas de jokers en la localizacion")
        return False

    # Paso 4: Mapear variantes
    print("\n" + "=" * 70)
    print("PASO 4: Mapeando variantes de jokers...")
    print("=" * 70)

    joker_variants = map_joker_variants(joker_entries)
    print("[OK] Nombres base unicos: {}".format(len(joker_variants)))

    # Paso 5: Reorganizar
    print("\n" + "=" * 70)
    print("PASO 5: Reorganizando jokers...")
    print("=" * 70)

    new_joker_entries = reorganize_joker_section(joker_order, joker_entries, joker_variants, joker_order_in_file)
    print("[OK] Total de jokers en salida: {}".format(len(new_joker_entries)))

    if not new_joker_entries:
        print("[ERROR] No hay jokers para procesar")
        return False

    # Paso 6: Reconstruir la sección
    print("\n" + "=" * 70)
    print("PASO 6: Reconstruyendo seccion de Joker...")
    print("=" * 70)

    # Unir con comas y crear la sección
    entries_joined = ',\n'.join(new_joker_entries)
    new_joker_section = "Joker = {\n" + entries_joined + ",\n        }"
    new_content = localization_content[:joker_start] + new_joker_section + localization_content[joker_end:]

    print("[OK] Seccion reconstruida")

    # Paso 7: Guardar el archivo
    print("\n" + "=" * 70)
    print("PASO 7: Guardando archivo...")
    print("=" * 70)

    with open(localization_file, 'w', encoding='utf-8') as f:
        f.write(new_content)

    print("[OK] Archivo guardado exitosamente")

    print("\n" + "=" * 70)
    print("[SUCCESS] REORGANIZACION COMPLETADA!")
    print("=" * 70)
    print("\nLos {} jokers en {} han sido".format(len(new_joker_entries), localization_file.name))
    print("reorganizados segun el orden de los archivos de equipo.")

    return True

if __name__ == "__main__":
    success = main()
    exit(0 if success else 1)
