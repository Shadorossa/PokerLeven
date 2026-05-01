# Guía de Estilo y Arquitectura para PokerLeven

## 1. Orden de Localización (es_ES.lua)
Es CRÍTICO mantener el orden de los Jokers en el archivo de localización para facilitar el mantenimiento. El orden debe ser:

1. **Por Versión de Juego**: 
   - `IE1` (Inazuma Eleven 1)
   - `IE2_C` (Equipos Especiales IE2)
   - `IE2_K` (Academia Alius IE2)
   - `IE2_I` (Equipos de Mapa IE2 como Fauxshore)
   - `IE3` (Inazuma Eleven 3 - Incluye Ogre IE3_Q, Selecciones, Ángeles/Demonios)

2. **Por Equipo**: Dentro de cada categoría, agrupar por el archivo de equipo correspondiente.

3. **Por Jugador**: El orden de los jugadores en `es_ES.lua` **DEBE COINCIDIR EXACTAMENTE** con el orden en el que están definidos en su archivo `.lua` original.

## 2. Programación de Jugadores
- **Regla de Oro**: Al inicio de cada `calculate`, SIEMPRE comprobar que el Joker está en el área activa del jugador:
  `if card.area ~= G.jokers then return end`
  Esto evita que los efectos se disparen en la tienda o dentro de sobres.
- Solo añadir a la tabla `list = {}` final aquellos jugadores que tengan su lógica de `calculate` completada. 
- No dejar jugadores "vacíos" en la lista de retorno para evitar que aparezcan cartas sin efecto en el juego.

## 3. Estética y Diseño
- Mantener colores temáticos ( {C:wind}, {C:fire}, etc. ) consistentes con el elemento del jugador.
- Descripciones narrativas y directas.
