# AI_README - Estándares de Textos y Localización

Este documento establece las reglas específicas para la redacción de descripciones y textos de localización en el proyecto PokerLeven. Estas reglas deben seguirse estrictamente para mantener la consistencia en el mod.

## 1. Uso del término "puntuar"
Para cualquier efecto que implique registrar, anotar, contar o realizar un seguimiento de una acción (como cartas jugadas, manos ganadas, etc.), se debe utilizar el término **"puntuar"**.
- **Ejemplo:** "Gana +1 Mult por cada carta que consigas **puntuar**."

## 2. Indicadores de Estado (Trackers)
Cada vez que un Joker mida o almacene internamente una cantidad variable (fichas acumuladas, mult multiplicador, contadores de manos, etc.), se debe incluir obligatoriamente el valor **actual** al final de la descripción.

### Formato del Tracker:
1. Debe ir en una **línea nueva** al final del array de texto.
2. Debe utilizar el color **inactivo** (`{C:inactive}`).
3. Debe seguir la estructura: `{C:inactive}(Actual: {TIPO_VALOR}#X#{C:inactive}){}`.

### Ejemplos de Trackers:
- `{C:inactive}(Actual: {C:chips}+#1#{C:inactive}){}`
- `{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive}){}`
- `{C:inactive}(Actual: #3# #4#){}` (Donde #4# es el plural/singular de la unidad)

## 3. Reglas Generales de Estilo
- **Brevedad:** Máximo de 3 líneas para la mecánica principal.
- **Colores:** Usar siempre los tags de color adecuados (`{C:attention}`, `{C:mult}`, `{C:chips}`, etc.).
- **Localización:** Solo se deben realizar cambios en el archivo `es_ES.lua`.
