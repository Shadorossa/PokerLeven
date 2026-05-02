import os
import re

players_dir = r"c:\Users\Secun\AppData\Roaming\Balatro\Mods\PokerLeven-1\players"
COLS = 13

# Regex para encontrar el bloque J({...}) y su clave (nombre de la variable local)
# El editor usa: /local\s+(\w+)\s*=\s*J\s*\(\s*\{/g
player_start_regex = re.compile(r'local\s+(\w+)\s*=\s*J\s*\(\s*\{')

def get_block_content(text, start_idx):
    brace_count = 0
    found_first = False
    for i in range(start_idx, len(text)):
        if text[i] == '{':
            brace_count += 1
            found_first = True
        elif text[i] == '}':
            brace_count -= 1
        
        if found_first and brace_count == 0:
            return text[start_idx:i+1], i
    return None, -1

# Diccionario para llevar la cuenta de jugadores por atlas
atlas_counters = {}

# Lista de archivos ordenados
files = sorted([f for f in os.listdir(players_dir) if f.endswith('.lua')])

for filename in files:
    filepath = os.path.join(players_dir, filename)
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    new_content = content
    offset = 0
    
    # Buscamos todos los jugadores en el archivo
    for match in player_start_regex.finditer(content):
        key = match.group(1)
        start_pos = content.find('{', match.start())
        block_text, end_pos = get_block_content(content, start_pos)
        
        if block_text:
            # Extraer atlas
            atlas_match = re.search(r'atlas\s*=\s*["\'](.*?)["\']', block_text)
            if atlas_match:
                atlas_name = atlas_match.group(1)
                
                # Incrementar contador para este atlas
                if atlas_name not in atlas_counters:
                    atlas_counters[atlas_name] = 0
                
                # Check if it's ina_top
                is_ina_top = re.search(r'rarity\s*=\s*["\']ina_top["\']', block_text)
                is_top_atlas = atlas_name in ["top", "ina_top"]
                
                # Extraer el pos actual (por si se salta la reorganización)
                current_pos_match = re.search(r'pos\s*=\s*\{\s*x\s*=\s*(\d+),\s*y\s*=\s*(\d+)\s*\}', block_text)
                
                if is_ina_top or is_top_atlas:
                    # Incluso si se salta, sincronizamos soul_pos si existe basándonos en su pos actual
                    if current_pos_match and "soul_pos" in block_text:
                        curr_x, curr_y = current_pos_match.group(1), current_pos_match.group(2)
                        new_soul_pos_str = f"soul_pos = {{ x = {curr_x}, y = {int(curr_y) + 1} }},"
                        updated_block = re.sub(r'soul_pos\s*=\s*\{\s*x\s*=\s*\d+,\s*y\s*=\s*\d+\s*\},?', new_soul_pos_str, block_text)
                        if updated_block != block_text:
                            # Aplicar solo el cambio de soul_pos
                            before = new_content[:start_pos + offset]
                            after = new_content[start_pos + len(block_text) + offset:]
                            new_content = before + updated_block + after
                            offset += (len(updated_block) - len(block_text))

                    atlas_counters[atlas_name] += 1
                    continue

                current_index = atlas_counters[atlas_name]
                new_x = current_index % COLS
                new_y = current_index // COLS

                # Reemplazar el pos = { x = ..., y = ... }
                new_pos_str = f"pos = {{ x = {new_x}, y = {new_y} }},"
                
                # Intentamos encontrar el pos y reemplazarlo
                updated_block = re.sub(r'pos\s*=\s*\{\s*x\s*=\s*\d+,\s*y\s*=\s*\d+\s*\},?', new_pos_str, block_text)
                
                # Sincronizar soul_pos (y + 1)
                if "soul_pos" in updated_block:
                    new_soul_pos_str = f"soul_pos = {{ x = {new_x}, y = {new_y + 1} }},"
                    updated_block = re.sub(r'soul_pos\s*=\s*\{\s*x\s*=\s*\d+,\s*y\s*=\s*\d+\s*\},?', new_soul_pos_str, updated_block)

                # Si no lo encuentra con esa regex, intentamos una que acepte placeholders o comentarios
                if updated_block == block_text:
                     updated_block = re.sub(r'pos\s*=\s*\{\s*x\s*=\s*\d+,\s*y\s*=\s*\d+\s*\}.*?--', new_pos_str + " --", block_text)

                if updated_block != block_text:
                    # Aplicar el cambio al contenido total
                    # Tenemos que tener cuidado con el offset si el bloque cambia de tamaño
                    before = new_content[:start_pos + offset]
                    after = new_content[start_pos + len(block_text) + offset:]
                    new_content = before + updated_block + after
                    offset += (len(updated_block) - len(block_text))
                
                atlas_counters[atlas_name] += 1

    # Guardar el archivo actualizado
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

print("¡Reorganización completada!")
for atlas, count in atlas_counters.items():
    print(f"- {atlas}: {count} jugadores.")
