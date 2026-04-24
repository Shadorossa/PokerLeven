# Script de Reorganización de Jokers

Este script reorganiza automáticamente los jokers en el archivo `localization/es_ES.lua` según el orden en que aparecen en los archivos de equipo.

## ¿Qué hace?

El script:

1. **Lee todos los archivos de equipo** (`players/IE*.lua`) en orden alfanumérico
   - IE1_A, IE1_B, IE1_C ... IE1_K
   - IE2_A, IE2_B, IE2_C ... IE2_N
   - IE3_A, IE3_B ... IE3_T
   - IE4_A, IE4_B
   - IE5_B, IE5_C, IE5_D, IE5_E
   - IE6_A
   - IE7_A, IE7_B, IE7_G, IE7_I
   - IE8_A, IE8_B ... IE8_M
   - IE9_A, IE9_B, IE9_X, IE9_Y, IE9_Z

2. **Extrae los nombres de los jokers** en el orden exacto que aparecen en cada archivo

3. **Lee la localización** (`localization/es_ES.lua`)

4. **Identifica todas las variantes** de cada joker
   - Ejemplo: Kevin tiene variantes como `j_ina_Kevin`, `j_ina_Kevin_inf`, `j_ina_KevinDark`, `j_ina_Kevin_IJ`, etc.

5. **Reorganiza la sección Joker** del archivo de localización
   - Agrupa todas las variantes de cada joker juntas
   - Mantiene el orden según los archivos de equipo

6. **Guarda el archivo** actualizado

## Cómo usar

### Opción 1: Ejecutar directamente con Python

```bash
cd /ruta/a/PokerLeven-1
python3 scripts/reorganize_localization_jokers.py
```

### Opción 2: Usar el script bash

```bash
cd /ruta/a/PokerLeven-1
./reorganize_jokers.sh
```

## Salida del script

El script muestra un detalle paso a paso:

```
======================================================================
REORGANIZADOR DE JOKERS - PokerLeven Mod
======================================================================

[INFO] Directorio de equipos: ...
[INFO] Archivo de localizacion: ...

======================================================================
PASO 1: Extrayendo jokers de archivos de equipo...
======================================================================
[OK] IE1_A_raimon.lua: 10 jokers
[OK] IE1_B_occult.lua: 0 jokers
...

[OK] Total de jokers encontrados: 688
[OK] Jokers unicos: 672

======================================================================
PASO 2: Leyendo archivo de localizacion...
======================================================================
[OK] Archivo leido exitosamente

======================================================================
PASO 3: Extrayendo entradas de jokers del archivo de localizacion...
======================================================================
[OK] Entradas de jokers encontradas: 86

...

======================================================================
[SUCCESS] REORGANIZACION COMPLETADA!
======================================================================
```

## Requisitos

- Python 3.6 o superior
- El directorio `players/` con los archivos de equipo
- El archivo `localization/es_ES.lua`

## Notas importantes

- El script **modifica directamente** el archivo `es_ES.lua`
- Se recomienda hacer un commit antes de ejecutar el script para poder revertir si es necesario
- Si un joker existe en los archivos de equipo pero NO tiene entrada en la localización, se ignora en la reorganización
- Las variantes de un joker se agrupan automáticamente (ej: todas las versiones de Kevin juntas)

## Estructura del archivo Joker

Después de ejecutar el script, la estructura es:

```lua
Joker = {
    j_ina_Kevin = { ... },
    j_ina_Kevin_inf = { ... },
    j_ina_Kevin_Dark = { ... },
    j_ina_Kevin_IJ = { ... },
    j_ina_Mark = { ... },
    -- etc en orden de los archivos de equipo
},
```

## Solución de problemas

### El script dice "0 jokers encontrados"

Esto significa que el patrón de búsqueda no coincide con la estructura del archivo. Posibles causas:
- El formato del archivo de localización cambió
- Los jokers no están dentro del bloque `Joker = { }`

### El script no encuentra los archivos

Asegúrate de ejecutar el script desde la raíz del proyecto (PokerLeven-1):
```bash
cd c:/Users/Secun/AppData/Roaming/Balatro/Mods/PokerLeven-1
python3 scripts/reorganize_localization_jokers.py
```

## Automatización

Puedes añadir un hook de pre-commit para ejecutar el script automáticamente:

```bash
# En .git/hooks/pre-commit
#!/bin/bash
cd "$(git rev-parse --show-toplevel)"
python3 scripts/reorganize_localization_jokers.py
```

## Soporte

Si tienes problemas, verifica:
1. Que Python 3 esté instalado
2. Que estés en el directorio correcto
3. Que el archivo de localización tenga el formato esperado
