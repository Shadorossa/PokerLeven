# Pokerleven - AI Coding Instructions

Este documento define el estándar de código (*Clean Code*) y las reglas de compresión y optimización que la IA debe seguir estrictamente al generar o refactorizar código Lua en el mod de Pokerleven.

## 1. Asignaciones Múltiples y Nomenclatura Corta
Para reducir la expansión vertical del código, agrupa declaraciones y variables locales afines en una sola línea mediante asignación múltiple. Utiliza abreviaturas estandarizadas para las variables de uso masivo:
- `context` se abrevia como `ctx`
- `card.ability.extra` se abrevia como `ex`
- `context.other_card` se abrevia como `other` (si se guarda localmente)
**Ejemplo:** `local ex, r_joker = card.ability.extra, card:get_right_joker()`

## 2. Condicionales Inline y Operadores Lógicos
Siempre que no se sacrifique la lógica matemática, usa operadores lógicos (`and` / `or`) a modo de ternarios para evitar bloques `if/else` largos.
- **Ternarios:** `local msg = (cond and "A" or "B")`
- **Colapso de ifs:** Los bloques `if` que contengan una sola instrucción pequeña deben declararse en una sola línea continua, separando instrucciones con punto y coma (`;`) si es estrictamente necesario, aunque preferiblemente usando concatenación lógica.
**Ejemplo:** `if ctx.setting_blind and not ctx.blueprint then ex.val = ex.val + 1; card:juice_up() end`

## 3. Eliminación de Funciones Auxiliares Redundantes
Evita crear múltiples funciones auxiliares locales (`local function do_something()`) encima del joker si dichas funciones solo se van a llamar desde una única rama del `calculate`. 
En su lugar, integra esa lógica directamente dentro del condicional correspondiente en `calculate` utilizando variables locales compactas.
*Nota:* Si una mecánica compleja se va a repetir en **múltiples** comodines distintos (ej. el drenaje de los Emperadores Oscuros), debe extraerse a un archivo helper bajo el namespace global (`Pokerleven.nombre_funcion`).

## 4. Optimización de Rendimiento y Memoria en Bucles
En Balatro, las funciones como `calculate` o `update` se ejecutan constantemente. **NUNCA** crees tablas nuevas (`{}`) dentro de bucles `for` o `while`.
- **Incorrecto:** `for _, s in ipairs(hand) do Pokerleven.simulates_trigger(joker, {other_card = s, ...}) end`
- **Correcto:** Crea la tabla simulada o las variables intermedias fuera del bucle, y simplemente reasigna su valor dentro del mismo:
  ```lua
  local sim_ctx = {cardarea=G.play, individual=true}
  for _, s in ipairs(ctx.scoring_hand) do 
      sim_ctx.other_card = s
      -- evaluación...
  end
  ```

## 5. Compresión extrema de funciones genéricas (`loc_vars`)
Las funciones estandarizadas de pura lectura de datos deben colapsarse a una sola línea.
**Ejemplo de loc_vars óptimo:**
`loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.val1, ex.val2}} end,`

## 6. Utilización de Extensiones de Clase (Context Helpers)
No reescribas bucles de búsqueda para encontrar posiciones de cartas en la zona de juego. Utiliza siempre los métodos nativos inyectados en la clase `Card`:
- `card:get_left_joker()`
- `card:get_right_joker()`
- `card:is_leftmost_joker()`
- `card:is_rightmost_joker()`

*Directriz final:* Cuando se pida refactorizar o programar un Joker, el objetivo es dejar el `calculate` en menos de 15-20 líneas, con una lectura horizontal fluida y sin anidamientos (`if` dentro de `if` dentro de `for`) profundos.

## 7. Localización y Textos
- **Archivos de Idioma:** NUNCA escribas ni modifiques los textos en `es_419.lua` ni en `en-us.lua`. Las traducciones y descripciones se deben añadir **únicamente** en el archivo `es_ES.lua`.
- **Formato de las Descripciones (Jokers):** Las descripciones deben ser consistentes y concisas, siguiendo esta estructura exacta:
  1. **Primera línea:** Nombre de la supertécnica coloreada según su elemento (ej. `{C:fire}Tornado de Fuego{}`).
  2. **Cuerpo:** La descripción del efecto mecánico, condensada en un **máximo de 3 líneas**.
  3. **Estado Actual:** Si el Joker tiene estadísticas que escalan o cambian, la información de su estado en tiempo real debe ir siempre en una nueva línea al final del todo, usando el color inactivo. (Ejemplo: `{C:inactive}(Actual: {X:mult,C:white}X#1#{C:inactive} Mult){}`).
  4. **Sinergias:** NUNCA añadas texto del tipo "Sinergia: ..." al final de la descripción. Si un Joker tiene una sinergia, crea una entrada en el bloque `Other` del archivo de localización y vincúlala mediante el `info_queue` en la función `loc_vars` del Joker.

## 8. Orden en las Listas de Retorno (`list = {}`)
Tanto en la declaración de variables locales en los archivos `.lua` como en la tabla de retorno `list = { ... }`, los Jokers **siempre** deben ordenarse estrictamente por sus coordenadas `x` e `y` (primero por **Y** de menor a mayor, luego por **X** de menor a mayor). Los comodines con rareza `ina_top` o aquellos extraídos de atlas diferentes deben intercalarse respetando su valor de `y` y `x` como si estuvieran en la misma cuadrícula.

## 9. Realidades Alternativas (Universe Helper)
Cualquier nuevo equipo que se añada perteneciente a las sagas de Ares u Orion (cuyos archivos empiecen por `IE7_` o `IE8_`) debe ser registrado siempre dentro de la realidad "Ares" en la tabla `Pokerleven.Universe.realities` del archivo `helpers/universe_helper.lua`.
