local generate_planet_text = function()
    return {
        "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
        "{C:attention}#2#",
        "{C:mult}+#3#{} Mult and",
        "{C:chips}+#4#{} chips",
    }
end

return {
    descriptions = {
        Back = {
            b_ina_hillman = {
                name = "Hillman",
                text = {
                    "{C:pink}#1# Managers{}",
                    "A partir de {C:attention}ante #2#{} genera",
                    "{C:pink}#3# Strat{} cada ronda",
                    "{C:inactive}Ha de haber espacio{}"
                }
            },
            b_ina_ray_dark = {
                name = "Ray Dark",
                text = {
                    "{C:pink}#1# Managers{}",
                    "Las cartas {C:spectral}espectrales{}",
                    "pueden salir en la tienda"
                },
                unlock = {
                    "Usa un {C:dark_edition}Néctar de los Dioses{}"
                }
            },
            b_ina_newton_thomas = {
                name = "Newton Thomas",
                text = {
                    "{C:pink}#1# Managers{}",
                    "{C:chips}-1{} Mano",
                    "Puedes ver las próximas",
                    "{C:attention}3{} cartas a jugar"
                },
            },
            b_ina_wintersea = {
                name = "Wintersea",
                text = {
                    "{C:pink}#1# Managers{}",
                    "El primer joker",
                    "será {C:dark_edition}eterno{}, {C:attention}fijado{}",
                    "y {C:mult}policromático{}"
                },
            },
            b_ina_david_evans = {
                name = "Araya (David Evans)",
                text = {
                    "{C:pink}#1# Mánager{} | Entrenamientos {C:attention}x#2#{}",
                    "Empiezas con {C:blue}-2{} Manos y {C:red}-2{} Descartes.",
                    "En la {C:attention}Ante 6{}, los recuperas y ganas {C:attention}+3{}.",
                    "Desbloquea {C:dark_edition}Cap+{} y {C:dark_edition}Cap+ Max{}."
                }
            },
        },
        Blind = {
            -- Blinds pequeños
            bl_ina_benchers = {
                name = "ChupaBanquillos",
                text = { "Sam, al banquillo",
                    "(No hace nada)" }
            },
            bl_ina_baseball_all_stars = {
                name = "Grandes Bateadores",
                text = { "Gana con 4 manos" }
            },
            bl_ina_strange_guys = {
                name = "Sospechosos",
                text = { "La primera carta jugada",
                    "de la primera mano se",
                    "convierte en otra aleatoria" }
            },
            bl_ina_inazuma08 = {
                name = "Inazuma 08",
                text = { "Gana 8$!!" }
            },
            bl_ina_inazuma_town = {
                name = "Ciudad Inazuma",
                text = { "Si has jugado más",
                    "de 6 tipos de mano",
                    "-1 descarte" }
            },
            bl_ina_glasses = {
                name = "Gafitas",
                text = { "Reactiva las primeras dos cartas",
                    "de cristal que puntuen" }
            },
            -- Blinds grandes: Inazuma Eleven 1
            bl_ina_ff_regional_a = {
                name = "Selección FF A",
                text = { "Malardos A" }
            },
            bl_ina_ff_regional_b = {
                name = "Selección FF B",
                text = { "Malardos B" }
            },
            bl_ina_ff_national_a = {
                name = "Selección Nacional A",
                text = { "No tan Malardos A" }
            },
            bl_ina_ff_national_b = {
                name = "Selección Nacional B",
                text = { "No tan Malardos B" }
            },
            bl_ina_umbrella = {
                name = "Umbrella",
                text = { "Gana 1 descarte y pierde 1 mano" }
            },
            bl_ina_inazuma_kids = {
                name = "Inazuma Kids",
                text = {}
            },
            bl_ina_sallys = {
                name = "Sallys",
                text = {}
            },
            bl_ina_occult = {
                name = "Occult",
                text = { "Los 6 puntuan dos veces" }
            },
            bl_ina_inazuma_eleven = {
                name = "Inazuma Eleven",
                text = { "Cada corazon otorga 20 chips extra!" }
            },
            bl_ina_shun = {
                name = "Shun",
                text = { "Si pierdes en esta ciega",
                    "revives con 0 de oro" }
            },
            bl_ina_empress = {
                name = "Empress",
                text = { "Gana una carta emperador",
                    "al derrotar la ciega" }
            },
            bl_ina_old_kirkwood = {
                name = "Antiguo Kirkwood",
                text = { "{C:attention}+1{} Mano y Descarte.", "Usar manos o descartes", "cuesta {C:money}4 ${}." }
            },
            -- Blinds grandes: Inazuma Eleven 2

            bl_ina_spfixers = {
                name = "Servicio Secreto",
                text = { "" }
            },
            bl_ina_alpine = {
                name = "Instituto Alpino",
                text = { "" }
            },
            bl_ina_cloister = {
                name = "Claustro Sagrado",
                text = { "" }
            },
            bl_ina_osakaccc = {
                name = "Triple C",
                text = { "" }
            },
            bl_ina_fauxshore = {
                name = "Instituto Fauxshore",
                text = { "" }
            },
            bl_ina_marytimes = {
                name = "Mary Times",
                text = { "" }
            },
            bl_ina_robotsg = {
                name = "Robots Guardias",
                text = { "" }
            },

            -- Blinds jefes
            bl_ina_goalkeeper = {
                name = "GK",
                text = { "Los jugadores {X:gk,C:white}GK{}", "están debilitados", "tras cada mano jugada" }
            },
            bl_ina_forward = {
                name = "FW",
                text = { "Los jugadores {X:fw,C:white}FW{}", "están debilitados", "tras cada mano jugada" }
            },
            bl_ina_defense = {
                name = "DF",
                text = { "Los jugadores {X:df,C:white}DF{}", "están debilitados", "tras cada mano jugada" }
            },
            bl_ina_midfielder = {
                name = "MF",
                text = { "Los jugadores {X:mf,C:white}MF{}", "están debilitados", "tras cada mano jugada" }
            },
            bl_ina_fire = {
                name = "Jefe de Fuego",
                text = { "Debilita cartas de {X:fire,C:white}Fuego{}", "tras cada mano jugada.", "{X:mountain,C:white}Montaña{} obtiene {C:attention}+20%{} de stats." }
            },
            bl_ina_forest = {
                name = "Jefe de Bosque",
                text = { "Debilita cartas de {X:forest,C:white}Bosque{}", "tras cada mano jugada.", "{X:fire,C:white}Fuego{} obtiene {C:attention}+20%{} de stats." }
            },
            bl_ina_mountain = {
                name = "Jefe de Montaña",
                text = { "Debilita cartas de {X:mountain,C:white}Montaña{}", "tras cada mano jugada.", "{X:wind,C:white}Viento{} obtiene {C:attention}+20%{} de stats." }
            },
            bl_ina_wind = {
                name = "Jefe de Viento",
                text = { "Debilita cartas de {X:wind,C:white}Viento{}", "tras cada mano jugada.", "{X:forest,C:white}Bosque{} obtiene {C:attention}+20%{} de stats." }
            },
            bl_ina_raimon = {
                name = "Raimon",
                text = { "Tienes que jugar 5 cartas" }
            },
            bl_ina_royal_blind = {
                name = "Royal Academy",
                text = { "Juega una sola mano" }
            },
            bl_ina_wild = {
                name = "Wild",
                text = { "Debilita las cartas", "versátiles" }
            },
            bl_ina_brain = {
                name = "Brain",
                text = { "Las cartas se roban",
                    "boca abajo tras", "cada mano jugada" }
            },
            bl_ina_otaku = {
                name = "Otaku",
                text = { "Las figuras se debilitan" }
            },
            bl_ina_shuriken = {
                name = "Shuriken",
                text = { "Cada carta jugada",
                    "resta 1 moneda" }
            },
            bl_ina_farm = {
                name = "Farm",
                text = { "Ciega MUY grande" }
            },
            bl_ina_kirkwood = {
                name = "Kirkwood",
                text = { "1 de 7 cartas esta volteada" }
            },
            bl_ina_zeus = {
                name = "Zeus",
                text = { "Pone el nivel de la",
                    "mano de póker jugada a 1" }
            },
            bl_ina_raimon_1v1 = {
                name = "Partido: Raimon",
                text = {
                    "Juega un partido {C:attention}1 contra 1{}",
                    "El Raimon anota puntos junto a ti.",
                    "Gana quien más puntos tenga al finalizar."
                }
            },

            -- Inazuma Eleven 2
            bl_ina_gemini = {
                name = "Tormenta de Geminis",
                text = { "" }
            },

            bl_ina_epsilon = {
                name = "Épsilon",
                text = { "" }
            },

            bl_ina_epsilonplus = {
                name = "Épsilon Plus",
                text = { "" }
            },

            bl_ina_RRedux = {
                name = "Royal Academy Redux",
                text = { "" }
            },

            bl_ina_Genesis = {
                name = "Génesis",
                text = { "" }
            },

            bl_ina_Prominence = {
                name = "Prominence",
                text = { "" }
            },

            bl_ina_Diamond = {
                name = "Polvo de Diamantes",
                text = { "" }
            },

            bl_ina_YoungInazuma = {
                name = "Young Inazuma",
                text = {
                    "{C:attention}Debilita{} a los jokers mejorados",
                    "Anotar {C:attention}<25%{} requerido",
                    "aumenta la ciega {C:attention}+25%{}"
                }
            },
            bl_ina_ForestTeam = {
                name = "Mar de Árboles",
                text = { "" }
            },

            -- Final Boss Blinds
            bl_ina_zeus_caido = {
                name = "Ultra Zeus",
                text = { "Cada mano robada aumenta", "las fichas necesarias en un #1#%" }
            },
            bl_ina_ogre = {
                name = "Academia Ogro",
                text = { "Jokers inactivos durante 2", "manos se {C:red}destruyen{}.", "Cada descarte sube la ciega {C:attention}25%{}." }
            },
            bl_ina_ogre_8 = {
                name = "Academia Ogro",
                text = { "Jokers inactivos durante 2", "manos se {C:red}destruyen{}.", "Cada descarte sube la ciega {C:attention}25%{}." }
            },
            bl_ina_ogre_24 = {
                name = "Ogro Redux",
                text = { "Desactiva jokers {C:blue}Comunes{}, {C:green}Inusuales{}", "y sin nivel de {C:training}Técnica{}.", "Vende el Joker izquierdo cada 2 manos." }
            },
            bl_ina_destructores = {
                name = "Destructores",
                text = { "Degrada todos los jokers al Nvl. 1", "Tamaño de mano {C:red}-3{}", "Cada jugada consume {C:attention}4{} {X:mountain,C:white}Barreras{}.", "Crece un {C:attention}25%{} si no alcanzas", "el {C:attention}90%{} de los puntos necesarios." }
            }
        },
        Strat = {
            c_ina_tech_book = {
                name = "Libro Técnico",
                text = { "Aplica un {C:pink}Tipo{} aleatorio",
                    "al Joker más a la izquierda{}" }
            },
            c_ina_tactic_pos = {
                name = "Posición Táctica",
                text = { "Aplica una {C:pink}Posición{} aleatoria",
                    "al Joker más a la izquierda{}" }
            },
            c_ina_national_call = {
                name = "Llamamiento a la selección",
                text = { "Transforma a un {C:attention}Jugador{}",
                    "compatible en su versión",
                    "{C:attention}Internacional{}" }
            }
        },
        Training = {
            c_ina_upgrade_technique_Forest_GK = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:forest}Bosque{} y su posición es {X:gk,C:white}GK{}" }
            },
            c_ina_upgrade_technique_Forest_DF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:forest}Bosque{} y su posición es {X:df,C:white}DF{}" }
            },
            c_ina_upgrade_technique_Forest_MF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:forest}Bosque{} y su posición es {X:mf,C:white}MF{}" }
            },
            c_ina_upgrade_technique_Forest_FW = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:forest}Bosque{} y su posición es {X:fw,C:white}FW{}" }
            },
            c_ina_upgrade_technique_Fire_GK = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:fire}Fuego{} y su posición es {X:gk,C:white}GK{}" }
            },
            c_ina_upgrade_technique_Fire_DF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:fire}Fuego{} y su posición es {X:df,C:white}DF{}" }
            },
            c_ina_upgrade_technique_Fire_MF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:fire}Fuego{} y su posición es {X:mf,C:white}MF{}" }
            },
            c_ina_upgrade_technique_Fire_FW = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:fire}Fuego{} y su posición es {X:fw,C:white}FW{}" }
            },
            c_ina_upgrade_technique_Wind_GK = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:wind}Viento{} y su posición es {X:gk,C:white}GK{}" }
            },
            c_ina_upgrade_technique_Wind_DF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:wind}Viento{} y su posición es {X:df,C:white}DF{}" }
            },
            c_ina_upgrade_technique_Wind_MF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:wind}Viento{} y su posición es {X:mf,C:white}MF{}" }
            },
            c_ina_upgrade_technique_Wind_FW = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:wind}Viento{} y su posición es {X:fw,C:white}FW{}" }
            },
            c_ina_upgrade_technique_Mountain_GK = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:mountain}Montaña{} y su posición es {X:gk,C:white}GK{}" }
            },
            c_ina_upgrade_technique_Mountain_DF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:mountain}Montaña{} y su posición es {X:df,C:white}DF{}" }
            },
            c_ina_upgrade_technique_Mountain_MF = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:mountain}Montaña{} y su posición es {X:mf,C:white}MF{}" }
            },
            c_ina_upgrade_technique_Mountain_FW = {
                name = "Mejora de técnica",
                text = { "Mejora el nivel de técnica del",
                    "jugador seleccionado si este es del",
                    "tipo {C:mountain}Montaña{} y su posición es {X:fw,C:white}FW{}" }
            },
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_ina_Kevin = {
                name = "Kevin",
                text = { "{C:forest}Tornado Dragón{}",
                    "Reactiva el {C:attention}Joker{} {X:fw,C:white}FW{}",
                    "derecho cada {C:attention}#1# manos",
                    "{C:inactive}#2# restantes" }
            },
            j_ina_Kevin_inf = {
                name = "Kevin",
                text = { "{C:forest}Tornado Dragón{}", "Vuelve a activar el comodín {X:fw,C:white}FW{}",
                    "que está a su derecha{}" }
            },
            j_ina_Mark = {
                name = "Mark",
                text = { "{C:mountain}Mano Mágica{}",
                    "{C:attention}+#1#{} al tamaño de mano jugada y de {C:red}descarte{}",
                    "{C:chips}+#2#{} al tamaño de {C:chips}mano{}" }
            },
            j_ina_Nathan = {
                name = "Nathan",
                text = { "{C:wind}Entrada Huracán{}",
                    "Cada {C:attention}Joker{} del {X:ina_team_raimon,C:white}Raimon{}",
                    "otorga {X:mult,C:white}X#2#{}" }
            },
            j_ina_Jack = {
                name = "Jack",
                text = { "{C:mountain}El Muro{}",
                    "{C:attention}Las Piedras{} ganan {C:chips}+#1#{} fichas",
                    "permanentemente por cada {C:attention}Joker{} {X:df,C:white}DF{}"
                }
            },
            j_ina_Axel = {
                name = "Axel",
                text = { "{C:fire}Tornado de Fuego",
                    "La mano jugada obtiene {X:mult,C:white}X#1#{}",
                    "si contiene {C:attention}Color{} de {C:hearts}Corazones{}" }
            },
            j_ina_Shadow = {
                name = "Shadow",
                text = { "{C:forest}Tornado Oscuro{}",
                    "Si al seleccionar la ciega es",
                    "el único {C:attention}Joker{}, crea una copia",
                    "{C:dark_edition}negativa{} propia sin habilidades"
                }
            },
            j_ina_Shadow_clone = {
                name = "Shadow",
                text = { "Solo una {C:dark_edition}Sombra{}" }
            },
            j_ina_Willy = {
                name = "Willy",
                text = { "{C:forest}Remate gafas{}",
                    "{C:green}#1# entre #2#{} de convertir la mano",
                    "jugada en cartas {C:attention}policromáticas{},",
                    "de {C:attention}cristal{} y con {C:attention}sello rojo{}" }
            },
            j_ina_Max = {
                name = "Max",
                text = { "{C:wind}Remate Espiral{}",
                    "{C:chips}+#1#{} fichas por cada comodín de {X:wind,C:white}Viento{}",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{} {C:inactive}){}" }
            },
            j_ina_Peabody = {
                name = "Peabody",
                text = { "{C:mountain}Mano Celestial{}",
                    "Aumenta en {C:mult}+#2#{} por cada {C:attention}carta puntuada{}",
                    "en la última mano jugada",
                    "{C:inactive}(Actual:{} {C:mult}+#1#{} {C:inactive}multi en tu última mano){}"
                }
            },
            j_ina_Jude_Raimon = {
                name = "Jude",
                text = { "{C:wind}Espejismo de Balón{}",
                    "Gana {X:mult,C:white}X#2#{} cada vez que el {C:attention}Joker",
                    "a su {C:attention}izquierda{} se activa",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}"
                }
            },
            j_ina_Bobby = {
                name = "Bobby",
                text = { { "{C:forest}El Traidor{}",
                    "Al seleccionar la ciega, cambia",
                    "a tu equipo más numeroso", },
                    { "Los jugadores del equipo",
                        "de {C:attention}Bobby{} otorgan {C:chips}+#1# Chips{}", } }
            },
            j_ina_Erik = {
                name = "Erik",
                text = { "{C:forest}Tri-Pegaso{}",
                    "{C:tarot}El Mago{} cambia su efecto y",
                    "pasa a otorgar {C:attention}2 sellos{} al azar", }
            },
            j_ina_Steve = {
                name = "Steve",
                text = { "{C:wind}Disparo Rodante{}",
                    "Cada {C:attention}Joker{} del {X:ina_team_raimon,C:white}Raimon{} otorga {C:chips}+#1#{} y {C:mult}+#2#{}",
                    "Obtiene {C:money}+#3#${} al terminar la ronda",
                    "{C:inactive}(Actual: {C:chips}+#4#{} {C:inactive}y{} {C:mult}+#5#{}{C:inactive}){}",
                }
            },
            j_ina_Jim = {
                name = "Jim",
                text = { "{C:wind}Giro bobina{}",
                    "Gana {C:chips}+#1#{} fichas",
                }
            },
            j_ina_Tod = {
                name = "Tod",
                text = {
                    "{C:wind}Equilibrismo{}",
                    "Gana {C:chips}+#1#{} fichas por",
                    "cada {C:enhanced}Acero{}",
                    "en {C:attention}mano{} o {C:attention}jugada{}"
                }
            },
            -- Occult
            j_ina_Talisman = {
                name = "Talisman",
                text = { "{C:forest}Rapto Divino{}",
                    "Reactiva el {C:attention}Joker{} {X:ina_team_occult,C:white}Occult{}",
                    "a su derecha {C:attention}#1# veces{}",
                }
            },
            j_ina_Wolfy = {
                name = "Wolfy",
                text = { "{C:fire}Luna creciente{}",
                    "Gana {X:mult,C:white}X#2#{} por cada",
                    "{C:tarot}La Luna{} usada",
                    "{C:inactive}(Actual {X:mult,C:white}X#1#{}{C:inactive}){}",
                }
            },
            j_ina_Blood = {
                name = "Blood",
                text = { "{C:mountain}Niebla Venenosa{}",
                    "{C:attention}Drena{} {C:money}#1#${} de los {C:attention}Jokers{} adyacentes,",
                    "Cada {C:money}1${} en su valor de venta obtiene {C:chips}+#2#{} fichas",
                    "{C:inactive}(Actual{} {C:chips}+#3#{}{C:inactive}){}" }
            },
            j_ina_Grave = {
                name = "Grave",
                text = { "{C:fire}Maldición{}", "{C:green}#1# en #2#{} de crear una carta",
                    "{C:tarot}Muerte{} por cada {C:attention}6{} anotado" }
            },
            j_ina_Mask = {
                name = "Mask",
                text = { "{C:wind}Cuchilla Asesina{}",
                    "Al seleccionar la ciega se",
                    "sacrifica el {C:attention}Joker{} de su derecha",
                    "y gana {C:money}+#1#${} de valor de venta", }
            },
            j_ina_Styx = {
                name = "Styx",
                text = { "{C:forest}Tiro Fantasma{}",
                    "{C:chips}+#2#{} fichas por cada carta {C:tarot}Tarot{} usada",
                    "{C:inactive}(Actual:{} {C:chips}+#1#{}{C:inactive}){}",
                }
            },
            j_ina_Franky = {
                name = "Franky",
                text = { "{C:mountain}Mega Terremoto{}", "{C:attention}Carta alta{} otorga", "{C:mult}+#1#{} de multi" }
            },
            j_ina_Mummy = {
                name = "Mummy",
                text = { "{C:forest}Gravedad{}", "Cada {C:clubs}#3#{} otorga", "{C:mult}+#1#{} Mult y {C:chips}+#2#{} Chips" }
            },
            j_ina_King = {
                name = "King",
                text = { "{C:fire}Escudo de Fuerza{}",
                    "Copia el rey {C:attention}derecho{} al",
                    "jugar una mano que contenga",
                    "un {C:attention}Trío{} de {C:attention}Reyes{}", }
            },
            j_ina_Bloom = {
                name = "Bloom",
                text = { "{C:fire}Chut de los 100 toques{}",
                    "{X:mult,C:white}X#1#{} si juegas {C:attention}Escalera{} tras",
                    "haber jugado {C:attention}100{} cartas",
                    "{C:inactive}(Actual:{} {C:mult}#2#{} {C:inactive}jugadas){}" }
            },
            j_ina_Drent = {
                name = "Drent",
                text = { "{C:mountain}Terremoto{}",
                    "{C:green}#1# en #2#{} de crear {C:tarot}La Torre{}",
                    "después de cada {C:attention}mano{} jugada.",
                    "Cada {C:attention}Joker{} {X:mountain,C:white}Montaña{} lo mejora en {C:green}1{}" }
            },
            j_ina_Jude = {
                name = "Jude",
                text = { "{C:wind}Espejismo de Balón{}",
                    "Gana {X:mult,C:white}X#2#{} cada vez que el {C:attention}Joker",
                    "a su {C:attention}izquierda{} se activa",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}"
                }
            },
            j_ina_Martin = {
                name = "Martin",
                text = { "{C:forest}Barrido Defensivo{}", "Los comodines {C:blue}Comunes{} otorgan {C:mult}+#1#{} Mult",
                    "Los comodines {C:green}Inusuales{} otorgan {C:mult}+#2#{} Mult",
                    "Los comodines {C:red}Raros{} o {C:top}Destacados{} otorgan {X:mult,C:white}X#3#{} Mult",
                    "Los comodines {C:purple}Legendarios{} otorgan {X:dark_edition,C:white}^#4#{} Mult" }
            },
            j_ina_Master = {
                name = "Master",
                text = { "{C:wind}Coz{}",
                    "Si es el primer {C:attention}Joker{} a la izquierda,",
                    "gana {C:mult}+#1#{} de multi por cada {X:ina_team_royalacademy,C:white}Acad. Royal{}", }
            },
            j_ina_Samford = {
                name = "Samford",
                text = { "{C:forest}Pingüino Emperador N.º 2{}", "{X:mult,C:white}X#1#{} multi si hay",
                    "{C:attention}1{} {X:mf,C:white}MF{} y {C:attention}2{} {X:fw,C:white}FW{}" }
            },
            j_ina_Swing = {
                name = "Swing",
                text = { "{C:wind}Regate Multiple{}",
                    "Al jugar {C:attention}Trío{} gana {C:chips}+#1#{} fichas",
                    "por cada {C:attention}Joker{} de la {X:ina_team_royalacademy,C:white}Acad. Royal{}", }
            },
            j_ina_Chicken = {
                name = "Chicken",
                text = { "{C:fire}Huevo Dorado{}", "Las cartas {C:enhanced}Versátiles{} tienen",
                    "{C:green}#1# de #2#{} de ganar {C:money}#3#${} al puntuar" }
            },
            j_ina_Boar = {
                name = "Boar",
                text = { "{C:fire}Garra Salvaje{}", "Al jugar una {C:attention}pareja de 2s{} se",
                    "destruyen y genera una {C:attention}Etiqueta Wild{}" }
            },
            j_ina_Chamaleon = {
                name = "Chamaleon",
                text = { "{C:wind}Espejismo{}",
                    "Permite jugar {C:attention}Color{} con 4 cartas",
                    "Al jugarse otra, se transforma en {C:enhanced}Versátil", }
            },
            j_ina_Eagle = {
                name = "Eagle",
                text = { "{C:wind}Ataque de Cóndor{}",
                    "Adquiere {C:mult}+#1#{} de multi por cada carta",
                    "{C:enhanced}versátil{} puntuada en un {C:attention}Color",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}" }
            },
            j_ina_Monkey = {
                name = "Monkey",
                text = { "{C:wind}Giro del Mono{}",
                    "Obtén {X:mult,C:white}XMult{} por {C:enhanced}cartas versátiles{}",
                    "en el mazo, multiplicado por {X:ina_team_wild,C:white}Wild{} / 10",
                    "{C:inactive}(Actual: {X:mult,C:white}X#1#{}{C:inactive}){}" }
            },
            j_ina_Gorilla = {
                name = "Gorilla",
                text = { "{C:mountain}Remate Tarzán{}", "Crea una {C:attention}Etiqueta Wild{}",
                    "al derrotar a la {C:attention}Ciega Jefe{}" }
            },
            j_ina_Cheetah = {
                name = "Cheetah",
                text = { "{C:wind}Superaceleración{}",
                    "Al puntuar 5 cartas {C:enhanced}versátiles{} se",
                    "reactivan por cada {C:attention}Joker{} de {X:select_element,C:white}#1#{}",
                    "{C:inactive}El elemento cambia cada ronda{}" }
            },
            j_ina_Feldt = {
                name = "Feldt",
                text = { {
                    "{C:forest}Campo de Fuerza Defensivo{}",
                    "Genera {C:attention}#1#{} {X:mountain,C:white}Barrera{}",
                    "si la mano contiene {C:attention}3{} {C:spades}Picas{}"
                },
                    {
                        "En la {C:attention}última mano{} consume",
                        "todas las {X:mountain,C:white}Barreras{} para",
                        "dar {X:mult,C:white}X#2#{} por {C:attention}Joker de {X:forest,C:white}Bosque{}",
                        "{C:inactive}(Actual:{} {X:mult,C:white}X#3# {C:inactive}){}"
                    }
                }
            },
            j_ina_Feldt_n3 = {
                name = "Feldt",
                text = { {
                    "{C:forest}Campo de Fuerza Defensivo{}",
                    "Genera {C:attention}#1#{} {X:mountain,C:white}Barrera{}",
                    "si juegas al menos {C:attention}3{} {C:spades}Picas{}"
                },
                    {
                        "En la {C:attention}última mano{} consume",
                        "{C:attention}#4# {X:mountain,C:white}Barreras{} para dar {X:mult,C:white}X#2#{}",
                        "por cada {C:attention}Joker{} de {X:forest,C:white}Bosque{}",
                        "{C:inactive}Actualmente{} {X:mult,C:white}X#3#"
                    }
                }
            },

            j_ina_Marvel = {
                name = "Marvel",
                text = { "{C:mountain}Escaner Defensa", "Si el valor en {C:chips}fichas{}",
                    "de la carta que puntua",
                    "tiene {C:attention}exactamente 3 bits en 1{}",
                    "{C:mult}+#1#{} de multi" }
            },

            j_ina_Tell = {
                name = "Tell",
                text = { "{C:forest}Adivino{}", "{X:chips,C:white}XPI{} si tienes {C:attention}3 1 4{} en",
                    "la mano trasera al puntuar" }
            },

            j_ina_Seller = {
                name = "Seller",
                text = { "{C:wind}Psicorremate{}", "Tras cada ronda jugada",
                    "gana {C:money}+#2#$ de potencial de venta{}.", "Cuando se venda Seller, aumenta",
                    "el {C:money}valor de venta{} de otros jokers", "por su potencial de venta",
                    "{C:inactive}(Actual:{} {C:money}#1#${}{C:inactive}){}" }
            },

            j_ina_Kind = {
                name = "Kind",
                text = { "{C:forest}Escaner ataque{}", "Si la mano jugada es un {C:attention}palíndromo{},",
                    "reactiva la primera y la última carta." }
            },

            j_ina_Turner = {
                name = "Turner",
                text = { "{C:fire}Tornado de fuego{}",
                    "Si la mano contiene un {C:attention}póker{}, se crea una copia",
                    "de la primera carta puntuada por cada {X:ina_team_brain,C:white}Brain{}" }

            },

            j_ina_Under = {
                name = "Under",
                text = { "{C:forest}Calculo Dificil", "Obtiene {C:chips}#1# / log2(#2# + 1){} chips",
                    "por cada {X:gk,C:white}GK{}{}" }
            },

            -- Otaku
            j_ina_Idol = {
                name = "Idol",
                text = { "{C:mountain}Deslizamiento de Portería{}",
                    "Reactiva {C:attention}4s{}",
                    "{C:green}#1# de #2#{} veces" }
            },

            j_ina_Hero = {
                name = "Hero",
                text = { "{C:fire}Bola falsa{}", "Transforma cada carta",
                    "{C:attention}figura{} puntuada en un {C:attention}4{}" }
            },

            j_ina_Custom = {
                name = "Custom",
                text = { "{C:wind}Ciclón{}", "Los {C:attention}Jokers{} de {X:wind,C:white}Viento{} pueden", "aparecer múltiples veces" }
            },

            j_ina_Robot = {
                name = "Robot",
                text = { "{C:wind}Confusión{}",
                    "Reactiva las {C:gold}Cartas de la Suerte{} en",
                    "{C:attention}Escalera{} que coincidan en posición con ",
                    "cada {X:mf,C:white}MF{} empezando por la izquierda" }
            },

            j_ina_Gamer = {
                name = "Gamer",
                text = { "{C:fire}Bateo Total{}",
                    "Ganas {C:chips}fichas{} por tus {C:attention}FPS / 2{}",
                    "Pasa a ser {C:attention}FPS{} con 2 Jokers del ",
                    "{X:ina_team_otaku,C:white}Otaku{} y valor máximo de {C:attention}144 FPS{}",
                    "{C:inactive}(Actual:{} {C:chips}+#1#{}{C:inactive}){}" }
            },

            j_ina_Artist = {
                name = "Artista",
                text = { "{C:wind}Ludopatía Máxima{}", "Si la mano jugada puntúa un {C:attention}Rey{}",
                    " y {C:attention}Reina{} convierte toda la mano",
                    " puntuada en {C:gold}Cartas de la Suerte{}" }
            },

            j_ina_Arcade = {
                name = "Arcade",
                text = { "{C:forest}Tiro del Cometa{}",
                    "{C:green}#1# en 15{} de ganar {C:money}$20{}",
                    "en una {C:gold}Carta de la Suerte{}",
                    "{C:inactive}Jugarlas cuesta{} {C:money}#2#${}", }
            },

            j_ina_Vox = {
                name = "Vox",
                text = {
                    "{C:wind}Segundón Resonante{}",
                    "{C:attention}Diestro{}",
                    "Gana {C:chips}+#1#{} fichas por",
                    "cada {C:attention}Joker{} a su izquierda"
                }
            },

            -- Inazuma Eleven
            j_ina_Hillman = {
                name = "Hillman",
                text = { "{C:mountain}Restaurante Ray Ray{}",
                    "Gana {X:chips,C:white}X#1#{} fichas por",
                    "{C:pink}Strat{} usada esta partida",
                    "{C:inactive}(Actual:{} {X:chips,C:white}X#2#{}{C:inactive}){}" }
            },

            j_ina_Island = {
                name = "Island",
                text = { "{C:forest}Zig zag chispeante{}",
                    "Gana {C:chips}+#1#{} fichas si la mano",
                    "jugada contiene {C:attention}doble pareja{}",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{}{C:inactive}){}" }
            },

            j_ina_Sweet = {
                name = "Sweet",
                text = { "{C:mountain}Reclutamiento{}",
                    "Al seleccionar la ciega crea un {C:attention}Joker{}",
                    "{C:chips}Común{} o {C:green}Inusual{} del {X:ina_team_raimon,C:white}Raimon{} o {X:ina_team_inazumaeleven,C:white}I.Eleven{}",
                    "{C:inactive}Debe haber espacio{}" }
            },

            j_ina_Butler = {
                name = "Butler",
                text = { "{C:forest}Rentista{}",
                    "Adquiere hasta {C:money}-#1#${} de deuda",
                    "Cada carta que puntúe gana {C:chips}+#3#{} fichas",
                    "por cada {C:money}-#2#${} para el resto de partida", }
            },

            j_ina_Barista = {
                name = "Barista",
                text = { "{C:wind}Pase Cruzado{}",
                    "La última carta jugada da",
                    "{X:chips,C:white}X#1#{} chips a mayores" }
            },

            j_ina_Builder = {
                name = "Builder",
                text = { "{C:fire}Pájaro de Fuego{}",
                    "Si la mano contiene {C:attention}Full{},",
                    "transforma una carta al azar",
                    "en {C:enhanced}Acero{} y {C:red}destruye{} otra", }
            },

            -- Shuriken
            j_ina_Hood = {
                name = "Hood",
                text = {
                    "{C:forest}Torbellino{}",
                    "Gana {X:mult,C:white}X#1#{} por",
                    "cada Joker {X:gk,C:white}GK{}{}",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#2#{}{C:inactive}){}"
                }
            },

            j_ina_Hillfort = {
                name = "Hillfort",
                text = { "{C:wind}Ataque de las Sombras{}",
                    "Al seleccionar la ciega gana",
                    "{C:chips}+#1#{} fichas por cada {C:money}#2#${} de valor de",
                    "venta de los {C:attention}Jokers{} de {X:wind,C:white}Viento{}",
                    "{C:inactive}(Actual:{} {C:chips}+#3#{}{C:inactive}){}" }
            },

            j_ina_Code = {
                name = "Code",
                text = { "{C:mountain}Telaraña{}",
                    "Reactiva las cartas {C:attention}doradas{} al final de",
                    "la ronda por cada {C:attention}Joker{} del {X:ina_team_shuriken,C:white}Shuriken{}", }
            },

            j_ina_Star = {
                name = "Star",
                text = { "{C:wind}Regate Múltiple{}", "Por cada carta de {C:red}diamantes{}",
                    "gana {C:money}+#1#${} y {C:mult}+#2#{} de multi", }
            },

            j_ina_Cleats = {
                name = "Cleats",
                text = { "{C:wind}Luna creciente{}",
                    "Al seleccionar la ciega",
                    "{C:green}transforma{} el {C:attention}Joker derecho{}",
                    "en otro de la misma {C:green}rareza"
                }
            },

            j_ina_Hattori = {
                name = "Hattori",
                text = { "{C:forest}Remate Múltiple{}",
                    "Al seleccionar la ciega crea",
                    "{C:attention}#1#{} copias {C:dark_edition}negativas{} propias.",
                    "Se destruyen al finalizar la ronda" }
            },

            j_ina_Cloack = {
                name = "Cloack",
                text = { "{C:fire}Espejismo{}", "{C:attention}Frontal{}",
                    "Al seleccionar la ciega clona",
                    "un joker {C:dark_edition}negativo{} perecedero",
                    "({C:attention}#2#{} rondas) gastando {C:mountain}#1# Barreras{}" },
            },
            j_ina_Cloack_inf = {
                name = "Cloack",
                text = { "{C:fire}Espejismo{}", "{C:attention}Frontal{}",
                    "Al seleccionar la ciega",
                    "clona un joker {C:dark_edition}negativo{}",
                    "gastando {C:mountain}#1# Barreras{}" },
            },

            -- Farm
            j_ina_Greeny = {
                name = "Greeny",
                text = {
                    {
                        "{C:fire}Muralla infinita{}",
                        "Genera {C:attention}#1#{} {X:mountain,C:white}barrera{} si al ",
                        "entrar en la ciega tienes {C:attention}#2#{} {X:df,C:white}DF{}"
                    },
                    {
                        "{C:attention}Diestro{}",
                        "Crea una carta de {C:training}entrenamiento{} apta",
                        "a un {C:attention}Joker{} consumiendo {C:attention}#3#{} {X:mountain,C:white}barreras{}",
                    }
                }
            },

            j_ina_Hayseed = {
                name = "Hayseed",
                text = {
                    "{C:mountain}Siembra{}",
                    "Gana {C:mult}+#1#{} de multi por",
                    "cada {C:attention}Trío exacto{} jugado",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}"
                }
            },

            j_ina_Sherman = {
                name = "Sherman",
                text = { "{C:fire}Trama Trama{}",
                    "Gana {C:chips}+#1#{} fichas", "cuando se activa un",
                    "{C:attention}Joker{} del {X:ina_team_farm,C:white}Farm{}",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{}{C:inactive}){}" }
            },

            j_ina_Spray = {
                name = "Spray",
                text = { "{C:fire}Superbalón rodante{}",
                    "Al seleccionar una {C:attention}ciega{}",
                    "con {C:money}<#1#${} gana {X:mult,C:white}X#2#{}",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#3#{}{C:inactive}){}" }
            },

            j_ina_Dawson = {
                name = "Dawson",
                text = { "{C:wind}Regate topo{}",
                    "Al jugar {C:attention}carta alta{} con {C:money}<#1#${}",
                    "se duplica dicha carta" }
            },

            j_ina_Muffs = {
                name = "Muffs",
                text = { "{C:forest}Tiro Cegador{}",
                    "Tras jugar una mano {C:attention}Siembra{}.",
                    "{C:attention}Cosechador:{} Gana {C:mult}+#1#{} de multi",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}" }
            },

            j_ina_Hillvalley = {
                name = "Hillvalley",
                text = { "{C:mountain}Muralla infinita{}",
                    "Gana {C:chips}+X{} fichas permanentemente ",
                    "al anotar un {C:attention}8{}, {C:attention}9{} o {C:attention}10{} siendo {C:chips}X{} el",
                    "{C:attention}valor{} de esas cartas",
                    "{C:inactive}(Actual:{} {C:chips}+#1#{}{C:inactive}){}" }
            },

            -- Kirkwood
            j_ina_Neville = {
                name = "Neville",
                text = { "{C:fire}Bloque Dureza{}",
                    "Las cartas de {C:attention}Cristal{}",
                    "se rompen {C:green}#1# de #2#{} veces" }
            },

            j_ina_Night = {
                name = "Night",
                text = { "{C:fire}Corte Giratorio{}",
                    "Al elegir una ciega, genera un",
                    "{C:attention}Joker{} del {X:ina_team_kirkwood,C:white}Kirkwood{}: {C:chips}Común{} o {C:green}Inusual{}",
                    "{C:attention}Puede generar repetidos{}",
                    "{C:inactive}Requiere espacio{}" }
            },

            j_ina_Marvin = {
                name = "Marvin",
                text = { "{C:fire}Tornado Inverso{}",
                    "{X:attention,C:white}Trillizos{}",
                    "Las cartas {C:attention}impares{}",
                    "otorgan {C:mult}+#1#{} de multi" }
            },

            j_ina_Thomas = {
                name = "Thomas",
                text = { "{C:wind}Tornado Inverso{}",
                    "{X:attention,C:white}Trillizos{}",
                    "Las cartas {C:attention}impares{}",
                    "otorgan {C:chips}+#1#{} fichas" }
            },

            j_ina_Tyler = {
                name = "Tyler",
                text = {
                    "{C:mountain}Tornado Inverso{}",
                    "{X:attention,C:white}Trillizos{}",
                    "Las cartas {C:attention}impares{} generan",
                    "un {C:tarot}tarot{} {C:green}#1# de #2# veces{}" }
            },

            j_ina_Damian = {
                name = "Damian",
                text = {
                    "{C:wind}Luna Creciente{}",
                    "Al salir de la tienda, gana {C:chips}+#1# fichas{}",
                    " por cada {C:attention}Joker{} de {X:fire,C:white}Fuego{} en juego",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{}{C:inactive}){}" }
            },

            j_ina_Nashmith = {
                name = "Nashmith",
                text = {
                    "{C:forest}Potenciación{}",
                    "Cada {C:spades}Pica{} jugada otorga",
                    "{C:chips}+#1#{} fichas por cada",
                    "{C:attention}Joker{} de {X:forest,C:white}Bosque{}",
                }
            },

            j_ina_Z_Triangle = {
                name = "Triángulo Z",
                text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
            },

            -- Zeus

            j_ina_Poseidon = {
                name = "Poseidon",
                text = { { "{C:mountain}Muralla Tsunami{}",
                    "Genera {C:attention}#1#{} {X:mountain,C:white}barrera{} al puntuar",
                    "un mínimo de {C:attention}#2#{} de {C:attention}figuras{}" },
                    { "{C:attention}Muralla Gigante{}",
                        "{{C:mult}Consume{} todas las {X:mountain,C:white}barrera{}",
                        "y otorga {C:chips}+#3# Chips{} por cada una",
                        "{C:inactive}(Actual:{} {C:chips}+#4#{}{C:inactive}){}" } }
            },

            j_ina_Hephestus = {
                name = "Hephestus",
                text = {
                    "{C:fire}Entrada Tormenta{}",
                    "Al ganar la ciega convierte ",
                    "una {C:attention}Carta{} en {C:enhanced}Acero{} por",
                    "cada {C:attention}Joker{} {X:fire,C:white}Fuego{} {X:df,C:white}DF{}"
                }
            },

            j_ina_Apollo = {
                name = "Apollo",
                text = {
                    "{C:forest}Hora Celestial{}",
                    "Al jugar {C:attention}doble pareja{} gana {C:chips}+#2# fichas{}",
                    "{C:inactive}De 14:00 a 19:00h:{} gana {C:chips}+#1# fichas{} y {C:mult}+#4# multi{}",
                    "{C:inactive}(Actual:{} {C:chips}+#3#{} {C:inactive}y{} {C:mult}+#5#{}{C:instead}{C:inactive}){}"
                }
            },

            j_ina_Artemis = {
                name = "Artemis",
                text = { "{C:wind}Flecha Divina{}",
                    "Tras jugar una figura {C:attention}Siémbrala{}.",
                    "{C:attention}Cosechador:{} Gana {C:chips}+#1#{} fichas",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{}{C:inactive}){}" }
            },

            j_ina_Hermes = {
                name = "Hermes",
                text = { "{C:forest}Oro divino",
                    "Si la primera mano jugada es {C:attention}pareja{}",
                    "la convierte en {C:gold}cartas de oro{}" }
            },

            j_ina_Demeter = {
                name = "Demeter",
                text = {
                    "{C:fire}Disparo con Rebotes{}",
                    "Otorga {C:mult}+#1#{} de multi y {C:chips}+#2#{} fichas",
                    "por cada descarte restante",
                    "{C:inactive}(Actual:{} {C:mult}+#3#{} {C:inactive}y{} {C:chips}+#4#{}{C:inactive}){}"
                }
            },

            j_ina_Aphrodite = {
                name = "Aphrodite",
                text = { { "{C:forest}Sabiduría Divina{}",
                    "Al acabar una ronda",
                    "cambia entre {X:fw,C:white}FW{} y {X:mf,C:white}MF{}",
                    "según venga mejor" },
                    { "Si es {X:fw,C:white}FW{} {X:mult,C:white}X#1#{} por cada",
                        "{X:fw,C:white}FW{}, {X:ina_team_zeus,C:white}Zeus{} y multiplicado por {C:mult}descartes",
                        "Si es {X:mf,C:white}MF{} {X:mult,C:white}X#2#{} por cada",
                        "{X:mf,C:white}MF{}, {X:ina_team_zeus,C:white}Zeus{} y multiplicado por {C:chips}manos",
                        "{C:inactive}Actualmente{} {X:mult,C:white}X#3#{}" } },
                unlock = {
                    "Llega al ante {C:attention}9",
                },
            },

            -- Servicio Secreto
            j_ina_ironwall = {
                name = "Ironwall",
                text = {
                    "{C:mountain}Muralla de Escudos{}",
                    "Otorga {C:chips}+#1#{} fichas si tienes",
                    "al menos {C:attention}1{} {X:mountain,C:white}Barrera{}"
                }
            },

            j_ina_fielding = {
                name = "Marge Fielding",
                text = {
                    "{C:wind}Escáner de Ataque{}",
                    "Muestra {C:attention}+#1#{} cartas de la baraja.",
                    "Gana {C:money}#2# ${} si la mano",
                    "jugada contiene un {C:attention}As{}."
                }
            },

            -- Épsilon
            j_ina_Dvalin = {
                name = "Dvalin",
                text = {
                    "{C:fire}Destrozataladros{}",
                    "Otorga {C:chips}+#1#{} fichas y crea",
                    "{C:attention}#2#{} {X:mountain,C:white}Barrera{} al anotar."
                }
            },
            j_ina_Dvalin_Plus = {
                name = "Dvalin",
                text = {
                    "{C:wind}Lanza de Odín{}",
                    "Da {X:mult,C:white} X#3# {} por cada",
                    "{X:mountain,C:white}Barrera{} en juego (Consume {C:attention}#2#{}).",
                    "{C:inactive}(Actual: {X:mult,C:white} X#1# {C:inactive})"
                }
            },
            j_ina_Sworm = {
                name = "Sworm",
                text = {
                    "{C:forest}Agujero de Gusano{}",
                    "Cada carta jugada tiene {C:green}#1# en #2#{}",
                    "probabilidades de volver a la",
                    "{C:attention}baraja{} tras puntuar."
                }
            },
            j_ina_Mercury = {
                name = "Mercury",
                text = {
                    "{C:wind}Lluvia de Meteoros{}",
                    "Al {C:red}descartar{} exactamente una {C:attention}Pareja{},",
                    "las transforma en cartas de {C:attention}Piedra{}.",
                    "Las cartas de {C:attention}Piedra{} pueden formar {C:attention}Parejas{}.",
                    "Si puntúan al menos {C:attention}#1#{} cartas de Piedra,",
                    "crea una carta {C:planet}Mercurio{}."
                }
            },
            j_ina_Kenville = {
                name = "Kenville",
                text = {
                    "{C:fire}Taladradora{}",
                    "Tus {C:attention}2{}, {C:attention}3{} y {C:attention}4{} puntúan",
                    "como si fuesen {C:attention}Reyes{} o {C:attention}Ases{}",
                    "para los demás comodines."
                }
            },
            j_ina_Metron = {
                name = "Metron",
                text = {
                    "{C:wind}Remate de Gaia{}",
                    "Las {C:chips}fichas{} aumentan {C:dark_edition}^#1#{} cada vez",
                    "que juegues una carta del {C:attention}mismo rango{} a la anterior.",
                    "Si fallas, el efecto se {C:red}reinicia{}.",
                    "{C:inactive}(Actual: {C:dark_edition}^#2#{C:inactive} Fichas | Requiere: {C:attention}#3#{C:inactive})"
                }
            },
            j_ina_Fedora = {
                name = "Fedora",
                text = {
                    "{C:fire}Agujero Negro{}",
                    "Los {C:red}descartes{} van al {C:attention}vacío{} por {C:attention}1{} ciega.",
                    "Las {C:attention}Cartas Caóticas{} dan {C:mult}+#1#{} Mult",
                    "por carta enviada al vacío esta ciega.",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_ina_Zell = {
                name = "Zell",
                text = {
                    "{C:wind}Rayo de Ganímedes{}",
                    "Al jugar {C:attention}Carta alta{} teniendo al menos",
                    "{C:attention}#1#{} jugador/es más del {X:ina_team_epsilon,C:white}Épsilon{},",
                    "una carta {C:planet}Plutón{}."
                }
            },

            -- Royal Redux
            j_ina_KingR = {
                name = "Joseph King",
                text = {
                    "{C:fire}Colmillo de Pantera{}",
                    "Crea {C:attention}#1#{} {X:mountain,C:white}Barrera/s{} al inicio de ciega.",
                    "Da {C:chips}+#2#{} fichas por cada {C:attention}Mano máxima{}.",
                    "{C:red}Pierdes #3# mano máxima{} cada {C:attention}#5#{} ciegas superadas.",
                    "{C:inactive}(Actual: {C:chips}+#4#{C:inactive}, {C:attention}#6#{C:inactive}/#5#)"
                }
            },
            j_ina_Jamm = {
                name = "Jamm",
                text = {
                    "{C:forest}Coz{}",
                    "Otorga {X:mult,C:white} X#1# {} Mult a los {C:attention}Jokers{}",
                    "de {X:fire,C:white}Fuego{} y {X:forest,C:white}Bosque{}.",
                    "{C:red}Desactiva{} a los comodines",
                    "de {X:mountain,C:white}Montaña{} y {X:wind,C:white}Viento{}."
                }
            },
            j_ina_SamfordR = {
                name = "David Samford",
                text = {
                    "{C:forest}Pingüino Emperador N.º 1{}",
                    "Pierdes todos tus {C:red}descartes{} al elegir ciega.",
                    "Otorga {X:mult,C:white} X#1# {} de Mult por descarte perdido.",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive})"
                }
            },
            j_ina_CalebR = {
                name = "Caleb Stonewall",
                text = {
                    "Al elegir ciega {C:attention}destruye{} a los reservas",
                    "de la {X:ina_team_royalacademy,C:white}Royal{} para ganar {X:mult,C:white} X#2# {} de Mult.",
                    "Transforma a {C:attention}King{} y {C:attention}Samford{} en {C:dark_edition}Redux{}",
                    "si juegas con él durante {C:attention}#3#{} rondas.",
                    "{C:inactive}(Multi: {X:mult,C:white} X#1# {} | Rondas: {C:attention}#4#{C:inactive})"
                }
            },
            j_ina_Messer = {
                name = "Messer",
                text = {
                    "{C:forest}Técnica Prohibida{}",
                    "Muestra {C:tarot}+#1#{} cartas de la baraja.",
                    "{C:red}-#2#{} al tamaño máximo",
                    "de cartas jugables."
                }
            },
            j_ina_Sparrow = {
                name = "Sparrow",
                text = {
                    "{C:wind}Lealtad Tóxica{}",
                    "{C:red}Debilita{} a los comodines adyacentes.",
                    "Al finalizar la ronda, otorga {C:money}#1# ${} por",
                    "cada comodín debilitado de esta forma."
                }
            },

            -- Emperadores Oscuros
            j_ina_JimDark = {
                name = "Jim Wraith",
                text = {
                    "{C:wind}Giro bobina{}",
                    "Gana {X:chips,C:white} X#1# {} Fichas",
                    "cada vez que anota puntos.",
                    "{C:inactive}(Actual: {X:chips,C:white} X#2# {C:inactive})"
                }
            },
            j_ina_SamDark = {
                name = "Sam Kincaid",
                text = {
                    "{C:fire}Escudo Rencoroso{}",
                    "Desde el {C:bench}Banquillo{}, hace {C:attention}Eternos{} e",
                    "{C:attention}Inmunes{} a tus Jokers titulares,",
                    "excepto a los {C:dark_edition}Negativos{}.",
                    "A cambio, {C:red}-#1#{} al tamaño de mano."
                }
            },
            j_ina_NathanDark = {
                name = "Nathan Swift",
                text = {
                    {
                        "{C:forest}Fénix Oscuro{}",
                        "{C:attention}Absorbe{} {C:dark_edition}Policromía{} de las cartas",
                        "puntuadas para ganar {X:mult,C:white} X1.5 {} Mult",
                        "por cada carga acumulada."
                    },
                    {
                        "{C:attention}Asistencia{}",
                        "{C:attention}Despliega{} estas cargas sobre las",
                        "cartas que beneficien al {C:attention}Joker derecho{}.",
                        "{C:inactive}(Multi: {X:mult,C:white} X#3# {} | Cargas: {C:attention}#1#/#2#{C:inactive})"
                    }
                }
            },
            j_ina_KevinDark = {
                name = "Kevin Dragonfly",
                text = {
                    "{C:forest}Tornado Dragón Oscuro{}",
                    "Reactiva al {C:attention}Joker derecho{} {C:attention}#1#{} veces.",
                    "Al vencer a un {C:attention}Jefe{}, le {C:red}arranca{}",
                    "su {C:dark_edition}edición{} o {C:attention}nivel de técnica{}.",
                    "{C:inactive}(Si no tiene, lo destruye)"
                }
            },

            j_ina_DarkFeldt = {
                name = "Thomas Feldt",
                text = {
                    {
                        "{C:forest}Mano Diabólica{}",
                        "Consume {X:mountain,C:white}Barreras{} al seleccionar",
                        "una {C:attention}Ciega Jefe{} para anularla:"
                    },
                    {
                        "Si afecta al {C:attention}nivel de técnica{}: {C:attention}#1#",
                        "Si afecta a un {C:attention}tipo{} o {C:attention}posición{}: {C:attention}#2#",
                        "Cualquier otro efecto: {C:attention}#3#"
                    }
                }
            },

            j_ina_Firsthand = {
                name = "Firsthand",
                text = {
                    "{C:mountain}Información Clasificada{}",
                    "Multiplica un {C:attention}#1#%{} las estadísticas base",
                    "del resto de tus comodines.",
                    "{C:red}Te quedas con una única mano{}"
                }
            },
            j_ina_Western = {
                name = "Western",
                text = {
                    {
                        "{C:wind}Protocolo de Seguridad{}",
                        "Al {C:red}descartar{} cartas de {X:wind,C:white}Viento{},",
                        "la siguiente {C:attention}Pareja{} obtiene un",
                        "crecimiento de {C:attention}#1# niveles{} por carta."
                    },
                    {
                        "{C:inactive}(Acumulado: {C:attention}#2# {C:inactive}cartas)"
                    }
                }
            },
            j_ina_Firepool = {
                name = "Firepool",
                text = {
                    "{C:wind}Fuego de Cobertura{}",
                    "La {C:attention}primera{} carta puntuada",
                    "se reactiva {C:attention}#1#{} vez por cada carta",
                    "carta de {X:wind,C:white}Viento{} jugada que {C:red}no puntúe{}."
                }
            },
            j_ina_Tori = {
                name = "Victoria Vanguard",
                text = {
                    {
                        "{C:wind}La Torre{}",
                        "Gana un {C:attention}#1#%{} de acumulación por cada",
                        "carta de {C:attention}Piedra{} nueva en tu baraja."
                    },
                    {
                        "Al {C:attention}salir de la tienda{}, transfiere su",
                        "acumulación al {C:attention}Joker derecho{} mejorando",
                        "sus estadísticas de forma {C:attention}permanente{}."
                    },
                    {
                        "{C:inactive}(Acumulado: {C:attention}#2#%{C:inactive} | Piedras: {C:attention}#3#{C:inactive})"
                    }
                }
            },
            j_ina_Kennedy = {
                name = "Kennedy",
                text = {
                    "{C:forest}Tiro Limpio{}",
                    "Otorga {X:mult,C:white} X#1# {} Mult si juegas",
                    "{C:attention}exactamente 1{} carta.",
                    "Si la carta es un {C:attention}As{},",
                    "otorga {X:mult,C:white} X#2# {} Mult en su lugar."
                }
            },
            j_ina_Beray = {
                name = "Beray",
                text = {
                    "{C:wind}Plan de Evacuación{}",
                    "Al {C:red}vender{} esta carta durante una",
                    "ciega, restaura tus {C:blue}Manos{} y",
                    "{C:red}Descartes{} a su máximo y recupera",
                    "cartas en el {C:attention}vacío{}."
                }
            },
            -- Diamond Dust
            j_ina_Gazelle = {
                name = "Gazelle",
                text = {
                    {
                        "{C:wind}Balón Iceberg{}",
                        "{C:attention}Absorbe{} cargas de los {C:attention}Cristales{}",
                        "{C:red}rotos{} para ganar {X:mult,C:white} X#2# {} Mult por carga.",
                        "{C:attention}Despliega{} cargas en forma de",
                        "{C:attention}Cristal{} al jugar {C:attention}Póker{}."
                    },
                    {
                        "{C:attention}Ventisca de Fuego{}",
                        "Despliega {C:attention}Cartas Caóticas{} en su lugar.",
                        "{C:inactive}(Multi: {X:mult,C:white} X#1# {} | Cargas: {C:attention}#3#/#4#{C:inactive})"
                    }
                }
            },
            j_ina_Torch = {
                name = "Torch",
                text = {
                    {
                        "{C:fire}Llamarada Atómica{}",
                        "{C:red}Destruye{} cartas puntuadas de",
                        "{C:hearts}Corazones{} o {X:fire,C:white}Fuego{} para",
                        "ganar {X:mult,C:white} X#1# {} Mult por carta."
                    },
                    {
                        "{C:attention}Ventisca de Fuego{}",
                        "Las calcina a {C:attention}Cartas Caóticas{}.",
                        "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive})"
                    }
                }
            },
            j_ina_Clear = {
                name = "Clear",
                text = {
                    "{C:wind}Bloque de hielo{}",
                    "Cuando una carta de {C:attention}Cristal{} se {C:red}rompe{},",
                    "hay {C:green}#1# en #2#{} probabilidades de que regrese",
                    "a tu baraja como carta base"
                }
            },
            j_ina_Beluga = {
                name = "Beluga",
                text = {
                    "{C:wind}Bloque de Hielo{}",
                    "Las cartas de {C:attention}Cristal{}",
                    "se rompen {C:green}#1# de #2#{} veces"
                }
            },
            j_ina_Icer = {
                name = "Icer",
                text = {
                    "{C:fire}Robo de Hielo{}",
                    "Gana {C:money}#1# ${} por cada aliado del",
                    "{X:ina_team_polvodediamantes,C:white}Polvo de Diamantes{} cuando",
                    "una carta de {C:attention}Cristal{} se {C:red}rompe{}.",
                    "{C:inactive}(Actual: {C:money}#2# ${C:inactive})"
                }
            },
            j_ina_Frost = {
                name = "Frost",
                text = {
                    "{C:mountain}Pisada de Hielo{}",
                    "Las {C:attention}cartas{} jugadas ganan {C:chips}+#1#{} Fichas base al anotar.",
                    "{C:attention}Combinación incompatible{} afecta a las {C:attention}Cartas Caóticas{} ({C:chips}+#2#{}).",
                    "{C:inactive}(Modo: {C:attention}#3#{C:inactive} | Se pierde al vender)"
                }
            },
            j_ina_Axel_Kirkwood = {
                name = "Axel Blaze (Kirkwood)",
                text = {
                    "{C:fire}Tornado de Fuego (Prototipo){}",
                    "Da {X:mult,C:white} X#1# {} Mult si juegas un",
                    "{C:attention}Color{} de {C:hearts}Corazones{}. {C:red}Destruye{}",
                    "la carta puntuada de menor rango."
                }
            },
            j_ina_Maddox = {
                name = "Maddox",
                text = {
                    "{C:forest}Ataque de Cóndor{}",
                    "Tus cartas de {X:forest,C:white}Bosque{}",
                    "son inmunes a ser {C:attention}debilitadas{}."
                }
            },
            j_ina_Scotty = {
                name = "Scotty Banyan",
                text = {
                    "{C:forest}Campo Torbellino{}",
                    "Otorga {C:chips}+#1#{} Fichas.",
                    "{C:green}#2# en #3#{} de {C:red}enfadarse{}",
                    "al elegir la ciega."
                }
            },
            j_ina_Scotty_Angry = {
                name = "Scotty Banyan",
                text = {
                    "{C:forest}Campo Torbellino{}",
                    "Otorga {C:chips}+#1#{} Fichas.",
                    "{C:red}Destruye{} la carta puntuada",
                    "con el rango más bajo. Se calma al",
                    "terminar la ronda."
                }
            },

            --Inazuma Japón
            j_ina_Nathan_IJ = {
                name = "Nathan Swift",
                text = {
                    "{C:wind}Entrada Huracán{}",
                    "Cada {C:attention}Joker{} del {X:ina_team_raimon,C:white}Raimon{} / {X:ina_team_inazumajapon,C:white}Inazuma Japón{}",
                    "otorga {X:mult,C:white}X#2#{}"
                }
            },
            j_ina_Jack_IJ = {
                name = "Jack Wallside",
                text = { "{C:mountain}El Muro{}",
                    "{C:attention}Las Piedras{} ganan {C:chips}+#1#{} fichas",
                    "permanentemente por cada {C:attention}Joker{} {X:df,C:white}DF{}"
                }
            },
            j_ina_Tod_IJ = {
                name = "Tod Ironside",
                text = {
                    "{C:wind}Equilibrismo{}",
                    "Gana {C:chips}+#1#{} fichas por",
                    "cada {C:enhanced}Acero{}",
                    "en {C:attention}mano{} o {C:attention}jugada{}"
                }
            },
            j_ina_Caleb_IJ = {
                name = "Caleb Stonewall",
                text = {
                    "Al elegir ciega {C:attention}destruye{} a los reservas",
                    "de la {X:ina_team_royalacademy,C:white}Royal{} para ganar {X:mult,C:white}X#2#{} de Mult.",
                    "Transforma a {C:attention}King{} y {C:attention}Samford{} en {C:dark_edition}Redux{}",
                    "si son titulares con él durante {C:attention}#3#{} rondas",
                    "{C:inactive}(Multi: {X:mult,C:white}X#1#{C:inactive} | Rondas: {C:attention}#4#{C:inactive}){}"
                }
            },
            j_ina_Samford_IJ = {
                name = "David Samford",
                text = { "{C:forest}Pingüino Emperador N.º 2{}", "{X:mult,C:white}X#1#{} multi si hay",
                    "{C:attention}1{} {X:mf,C:white}MF{} y {C:attention}2{} {X:fw,C:white}FW{}" }
            },
            j_ina_Kevin_IJ = {
                name = "Kevin Dragonfly",
                text = { "{C:forest}Tornado Dragón{}",
                    "Reactiva el {C:attention}Joker{} {X:fw,C:white}FW{}",
                    "derecho cada {C:attention}#1# manos",
                    "{C:inactive}#2# restantes" }
            },
            j_ina_Kevin_inf_IJ = {
                name = "Kevin Dragonfly",
                text = { "{C:forest}Tornado Dragón{}", "Vuelve a activar el comodín {X:fw,C:white}FW{}",
                    "que está a su derecha{}" }
            },
            j_ina_Jude_IJ = {
                name = "Jude",
                text = { "{C:wind}Espejismo de Balón{}",
                    "Gana {X:mult,C:white}X#2#{} cada vez que el {C:attention}Joker",
                    "a su {C:attention}izquierda{} se activa",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}"
                }
            },
            j_ina_Axel_IJ = {
                name = "Axel",
                text = {
                    {
                        "{C:fire}Fuego Total{}",
                        "Si juegas exactamente un {C:attention}Trío{},",
                        "la primera carta se {C:attention}clona #1# veces{}",
                        "en la jugada y todas se",
                        "vuelven de tipo {X:fire,C:white}Fuego{}."
                    },
                    {
                        "Otorga {X:mult,C:white}X#2#{} de multi si todas",
                        "las cartas puntuadas son de",
                        "{C:hearts}Corazones{} o {X:fire,C:white}Fuego{}"
                    }
                }
            },

            -- Ogre
            j_ina_Malice = {
                name = "Escavan Malice",
                text = {
                    "{C:fire}Diluvio Letal{}",
                    "Las cartas {C:dark_edition}Letales{} tienen una",
                    "probabilidad de {C:green}#1# en #2#{} de",
                    "dar {X:dark_edition,C:white}^#3#{} mult. en vez de {X:dark_edition,C:white}^#4#{}",
                }
            },
            j_ina_Bash = {
                name = "Bash Lancer",
                text = {
                    "{C:forest}Lanza Destructiva{}",
                    "{C:attention}#1# en #2#{} de probabilidad:",
                    "Convierte una carta a {C:dark_edition}Letal{}",
                    "y destruye otra. Si {C:attention}todas{} son",
                    "{C:dark_edition}Letales{}, retrigger éstas."
                }
            },
            j_ina_Callous = {
                name = "Mystral Callous",
                text = {
                    "{C:mountain}Lanza Letal{}",
                    "Gana {X:mult,C:white}X#1#{} Wde mult. por cada",
                    "carta {C:dark_edition}Letal{} en tu mazo.",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} Mult){}"
                }
            },


            -- Ares - Zeus
            j_ina_Perseus = {
                name = "Perseus",
                text = {
                    {
                        "{C:fire}Sierra Celestial{}",
                        "Gana {C:mult}+#1#{} Multi por carta",
                        "puntuada de {C:hearts}Corazones{} o {X:fire,C:white}Fuego{}."
                    },
                    {
                        "Pierde {C:attention}#3#%{} del Multi si pasan",
                        "{C:attention}#2#{} manos sin activarse.",
                        "{C:inactive}(Multi: {C:mult}+#4#{C:inactive} | Inactivo: {C:attention}#5#/#2#{C:inactive})"
                    }
                }
            },
            j_ina_Hades = {
                name = "Hades",
                text = {
                    "{C:wind}Pisotón de Justicia{}",
                    "Al jugar una {C:attention}Pareja{} exacta junto a",
                    "cartas {C:attention}mayores{}, las {C:attention}aplasta{}",
                    "y las convierte a su categoría."
                }
            },

            j_ina_Majin_Pegasus = {
                name = "Pegaso Mágico",
                text = {
                    "{C:wind}Pegaso Mágico{}",
                    "Mejora un {C:attention}#1#%{} las estadísticas",
                    "de los comodines de {X:wind,C:white}Viento{}"
                }
            },
            j_ina_Surtur = {
                name = "Surtur",
                text = {
                    "{C:fire}Tormenta de Fuego{}",
                    "Jugar esta mano suma {C:attention}+#2#%{} a las",
                    "estadísticas de {X:fire,C:white}Fuego{} y sube su {C:attention}nivel{}",
                    "{C:inactive}(Actual: {C:attention}+#3#%{C:inactive} | Nvl: {C:attention}+#1#{C:inactive})"
                }
            },
            j_ina_Gigante = {
                name = "Gigante",
                text = {
                    "{C:mountain}Gigante{}",
                    "{C:red}Destruye{} 1 carta puntuada",
                    "de {X:mountain,C:white}Montaña{}. Rebaja un {C:attention}#1#%{} las",
                    "fichas de la próxima {C:attention}Ciega Jefe{}.",
                    "{C:inactive}(Acumulado: {C:attention}-#2#%{C:inactive})"
                }
            },
            j_ina_Eris = {
                name = "Eris",
                text = {
                    "{C:purple}Manzana de la Discordia{}",
                    "Mientras esté activa, {C:attention}fusiona{} las",
                    "{C:attention}Realidades{}. Activa Jokers {C:dark_edition}Corruptos{}",
                    "y permite a otros equipos aparecer.",
                    "{C:inactive}(Universo actual: {C:attention}#1#{C:inactive})"
                }
            },
            j_ina_Sombra_de_Plasma_TI = {
                name = "Sombra de Plasma TI",
                text = {
                    "{C:fire}Sombra de Plasma TI{}",
                    "Cada vez que un Joker {X:fw,C:white}FW{} otorga",
                    "puntuación, suma {C:mult}+#1#{} Multi.",
                    "{C:inactive}(Escala con nivel de técnica){}"
                }
            },
            j_ina_Sombra_de_Plasma_RE = {
                name = "Sombra de Plasma RE",
                text = {
                    "{C:wind}Sombra de Plasma RE{}",
                    "Al descartar, {C:red}destruye{} la carta",
                    "más baja. Suma {C:chips}+#1#{} Fichas a su",
                    "Aura pasiva por cada {X:mf,C:white}MF{}.",
                    "{C:inactive}(Aura actual: {C:chips}+#2#{C:inactive})"
                }
            },
            j_ina_Sombra_de_Plasma_DF = {
                name = "Sombra de Plasma DF",
                text = {
                    "{C:mountain}Sombra de Plasma DF{}",
                    "Otorga {C:chips}+#1#{} Fichas por cada",
                    "{X:mountain,C:white}Barrera{} al jugar una mano."
                }
            },
            j_ina_Sombra_de_Plasma_PO = {
                name = "Sombra de Plasma PO",
                text = {
                    "{C:forest}Sombra de Plasma PO{}",
                    "En tu {C:attention}última mano{}, si vas perdiendo,",
                    "otorga {X:mult,C:white} X#1# {} Mult por cada",
                    "Joker {X:gk,C:white}GK{}. {C:inactive}(Consume 2 Cargas){}"
                }
            },

            -- Eisei Gakuen (Ares)
            j_ina_Quagmire_Ares = {
                name = "Dave Quagmire (Ares)",
                text = {
                    "{C:fire}Espíritu Inquebrantable{}",
                    "Gana {C:chips}+#1#{} Fichas si juegas una",
                    "mano que anota menos del {C:attention}#2#%{}",
                    "de las fichas requeridas.",
                    "{C:inactive}(Actual: {C:chips}+#3#{C:inactive} Fichas){}"
                }
            },
            j_ina_Hunter_Ares = {
                name = "Hunter Foster (Ares)",
                text = {
                    "{C:fire}Cañón de Meteoritos{}",
                    "Da {C:mult}+#1#{} Mult y {C:chips}+#2#{} Fichas.",
                    "Si {C:attention}Xavier{} está a su lado, suma a todos",
                    "{C:money}#3#${} de valor a fin de ronda."
                }
            },
            j_ina_Xavier_Ares = {
                name = "Xavier Schiller (Ares)",
                text = {
                    "{C:forest}La Explosión{}",
                    "Al jugar, drena {C:money}#1#${} al resto de jokers",
                    "y gana {X:mult,C:white} X#2# {} Mult por cada {C:money}1${}.",
                    "{C:inactive}(Actual: {X:mult,C:white} X#3# {C:inactive} Mult){}"
                }
            },

            -- Inakuni Raimon
            j_ina_Sandra_Fischer = {
                name = "Sandra Fischer",
                text = {
                    "{C:wind}Mano Oceánica{}",
                    "Si anotas al menos el {C:attention}#1#%{} de las",
                    "fichas, devuelve {C:attention}#2#{} carta/s de",
                    "{X:wind,C:white}Viento{} jugada/s al mazo."
                }
            },
            j_ina_Adriano_Donati = {
                name = "Adriano Donati",
                text = {
                    "{C:fire}Limonada de Fuego{}",
                    "Da {C:chips}+#1#{} Fichas al superar ciegas",
                    "{C:blue}Pequeñas/Grandes{}, o {C:mult}+#2#{} Mult",
                    "al superar {C:red}Ciegas de Jefe{}.",
                    "{C:inactive}(Actual: {C:chips}+#3# {C:inactive}y {C:mult}+#4#{C:inactive}){}"
                }
            },
            j_ina_Sonny_Wright = {
                name = "Sonny Wright",
                text = {
                    "{C:fire}Pájaro Luminoso{}",
                    "Gana {X:mult,C:white} X#1# {} Mult al superar",
                    "una ciega en tu {C:attention}última mano{}.",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} Mult){}"
                }
            },
            j_ina_Trevor = {
                name = "Trevor Cook",
                text = {
                    "{C:wind}Danza del Destello{}",
                    "Tus {C:attention}2{}, {C:attention}4{}, {C:attention}6{} y {C:attention}8{} dan {C:mult}+#1#{} Mult por",
                    "cada Joker del {X:ina_team_inakuniraimon,C:white}I. Raimon{} al puntuar.",
                    "{C:inactive}(Actual: {C:mult}+#2#{C:inactive} Mult){}"
                }
            },
            j_ina_Basile = {
                name = "Basile Hardy",
                text = {
                    "{C:fire}Macarrones con Espaguetis{}",
                    "Si juegas {C:attention}Doble Pareja{}, convierte",
                    "las cartas puntuadas a {X:fire,C:white}Fuego{} y les",
                    "añade {C:mult}+#1#{} Mult permanente."
                }
            },
            j_ina_Valentin = {
                name = "Valentín Eisner",
                text = {
                    "{C:wind}Flecha de Hielo{}",
                    "Si juegas exactamente {C:attention}3{} cartas, da",
                    "{C:mult}+#1#{} Mult o {C:chips}+#2#{} Fichas al comodín",
                    "derecho (según la stat que use)."
                }
            },
            j_ina_Cesar = {
                name = "César Montalbán",
                text = {
                    "{C:forest}Técnica Ninja{}",
                    "{C:green}#1# en #2#{} probabilidades de",
                    "duplicar cada {C:attention}Etiqueta{} ganada."
                }
            },

            --Scouts
            j_ina_Ace_Server = {
                name = "Ace Server",
                text = { {
                    "{C:fire}Puño vengativo{}",
                    "{C:green}1 en #1# {}de aumentar el",
                    "nivel de la mano jugada",
                    "{C:attention}#2# nivel{} si {C:attention}#3# Ases{} puntúan."
                } }
            },

            j_ina_Blazer = {
                name = "Blazer",
                text = { {
                    "{C:purple}Carga elemental{}",
                    "Todos los {C:attention}Jokers{} son de {X:fire,C:white}Fuego{}",
                    "Solo funciona el elemental {C:attention}izquierdo",
                },
                    {
                        "Se revierte fuera del área de juego",
                        "{C:inactive}Funciona aún {C:mult}deshabilitado{}{}"
                    }
                }
            },

            j_ina_Weathervane = {
                name = "Weathervane",
                text = { {
                    "{C:purple}Carga elemental{}",
                    "Todos los {C:attention}Jokers{} son de {X:wind,C:white}Viento{}",
                    "Solo funciona el elemental {C:attention}izquierdo"
                },
                    {
                        "Se revierte fuera del área de juego",
                        "{C:inactive}Funciona aún {C:mult}deshabilitado{}{}"
                    }
                }
            },

            j_ina_Noggin = {
                name = "Noggin",
                text = { {
                    "{C:purple}Carga elemental{}",
                    "Todos los {C:attention}Jokers{} son de {X:forest,C:white}Bosque{}",
                    "Solo funciona el elemental {C:attention}izquierdo"
                },
                    {
                        "Se revierte fuera del área de juego",
                        "{C:inactive}Funciona aún {C:mult}deshabilitado{}{}"
                    }
                }
            },

            j_ina_Montayne = {
                name = "Montayne",
                text = { {
                    "{C:purple}Carga elemental{}",
                    "Todos los {C:attention}Jokers{} son de {X:mountain,C:white}Montaña{}",
                    "Solo funciona el elemental {C:attention}izquierdo"
                },
                    {
                        "Se revierte fuera del área de juego",
                        "{C:inactive}Funciona aún {C:mult}deshabilitado{}{}"
                    }
                }
            },

            j_ina_Dulce = {
                name = "Dulce",
                text = {
                    "{C:wind}Viento de cosecha{}",
                    "Siembra {C:attention}#1#{} carta/s al azar por cada",
                    "{C:attention}Joker {X:mf,C:white}MF{} ó {X:wind,C:white}Viento{} al elegir la ciega",
                }
            },

            j_ina_Ryoma = {
                name = "Ryoma",
                text = {
                    "{C:mountain}Parada Infinita{}",
                    "Gana {C:mult}+#1#{} de multi cada vez",
                    "que se activa un {X:gk,C:white}GK{}",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}"
                }
            },

            j_ina_Mach = {
                name = "Mach",
                text = {
                    "{C:fire}Chut Granada{}",
                    "Gana {X:mult,C:white}X#1#{} al vender",
                    "un {C:attention}Joker {}o {C:attention}Mánager{}",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#2#{}{C:inactive}){}"
                }
            },

            j_ina_Rex_George = {
                name = "Rex George",
                text = { {
                    "{C:wind}Hojarasca{}",
                    "Convierte los {C:attention}#1#{}",
                    "puntuados en {C:attention}#2#s{}",
                } }
            },

            j_ina_Heart = {
                name = "Corazón",
                text = {
                    "{C:fire}Marca de Fuego{}",
                    "Tus cartas de {C:hearts}Corazones{} cuentan",
                    "como cartas de {X:fire,C:white}Fuego{}"
                }
            },
            j_ina_Clover = {
                name = "Trébol",
                text = {
                    "{C:forest}Marca de Bosque{}",
                    "Tus cartas de {C:clubs}Tréboles{} cuentan",
                    "como cartas de {X:forest,C:white}Bosque{}"
                }
            },
            j_ina_Diamond = {
                name = "Diamante",
                text = {
                    "{C:mountain}Marca de Montaña{}",
                    "Tus cartas de {C:diamonds}Diamantes{} cuentan",
                    "como cartas de {X:mountain,C:white}Montaña{}"
                }
            },
            j_ina_Spade = {
                name = "Pica",
                text = {
                    "{C:wind}Marca de Viento{}",
                    "Tus cartas de {C:spades}Picas{} cuentan",
                    "como cartas de {X:wind,C:white}Viento{}"
                }
            },

            -- GANADORES DE TORNEO
            j_ina_Turi = {
                name = "Turiño",
                text = { { "{C:forest}Remate Rebotado{}",
                    "Gana {X:dark_edition,C:white}^X#2#{} por cada",
                    "{C:attention}#3#{} {C:tarot}Tarots{} de {C:suits}Palo{} usados",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}, {C:tarot}#4#{} {C:inactive}usados){}" }, }
            },

            -- GERENTES
            j_ina_Nelly = {
                name = "Nelly",
                text = { { "Por cada ronda se otorga entre {C:money}#1#${} a {C:money}#2#${},",
                    "si se {C:attention}pierde la partida{}, en vez de eso,",
                    "se {C:mult}destruyen{} todos los jokers",
                    "fuera del banquillo y esta carta." },
                    { "Si es más de ante {C:attention}#3#{}",
                        "al morir pone el dinero a {C:money}#4#${}" } }
            },

            j_ina_Celia = {
                name = "Celia",
                text = { {
                    "Si tienes un {C:attention}Jude{},",
                    "lo transforma a su forma del {X:ina_team_raimon,C:white}Raimon{}",
                    "al comienzo de la próxima tienda"
                },
                    { "Genera un {C:attention}Scout{} en el {C:bench}Banquillo{}",
                        "al seleccionar una ciega",
                        "{C:inactive}Debe haber espacio{}" } }
            },
            j_ina_Koudera = {
                name = "Koudera",
                text = {
                    "{C:tarot}+#1#{} espacio de {C:tarot}consumibles{}"
                }
            },
            j_ina_Aurelia = {
                name = "Aurelia",
                text = {
                    "{C:green}+#1#{} {C:attention}reroll{} gratis por tienda"
                }
            },
            j_ina_Silvia = {
                name = "Silvia",
                text = {
                    "{C:green}+#1#{} {C:attention}booster pack{} slot"
                }
            },
            j_ina_Chester = {
                name = "Chester",
                text = {
                    "Puedes ver las próximas {C:tarot}#1#{}",
                    "cartas que van a salir"
                }
            },
            j_ina_Akihiro = {
                name = "Akihiro Hino",
                text = {
                    "{C:dark_edition,E:1}Por favor espere un poco más{}"
                }
            }
        },

        Other = {
            Dios_rematador = {
                name = "Dios rematador",
                text = {
                    "Los {C:red}destruye{} si",
                    "valen {C:money}0${}."
                }
            },
            ina_training_seal = {
                name = "Sello de entrenamiento",
                text = {
                    "Crea una carta de {C:training}Entrenamiento{}",
                    "si puntúa en la {C:attention}última mano{}",
                    "{C:inactive}(Debe haber espacio){}",
                },
            },
            ina_tech_cap_plus_sticker = {
                name = "Superación (Cap+)",
                text = {
                    "Este comodín ha",
                    "roto sus límites"
                },
            },
            ina_tech_cap_plus_max_sticker = {
                name = "Superación Total (Cap+ Max)",
                text = {
                    "Este comodín ha alcanzado",
                    "el poder absoluto"
                },
            },
            card_emult = {
                text = {
                    "{C:dark_edition}^#1#{} Mult"
                }
            },
            card_extra_emult = {
                text = {
                    "{C:dark_edition}^#1#{} Mult"
                }
            },
            Mountain = {
                name = "Tipo",
                text = { "{X:mountain,C:white}Montaña{}" }
            },
            Fire = {
                name = "Tipo",
                text = { "{X:fire,C:white}Fuego{}" }
            },
            GK = {
                name = "Posición",
                text = { "{X:gk,C:white}GK{}" }
            },
            FW = {
                name = "Posición",
                text = { "{X:fw,C:white}FW{}" }
            },
            Forest = {
                name = "Tipo",
                text = { "{X:forest,C:white}Bosque{}" }
            },
            Wind = {
                name = "Tipo",
                text = { "{X:wind,C:white}Viento{}" }
            },
            DF = {
                name = "Posición",
                text = { "{X:df,C:white}DF{}" }
            },
            MF = {
                name = "Posición",
                text = { "{X:mf,C:white}MF{}" }
            },
            Harvester = {
                name = "Cosechador",
                text = { "Se activa al descartar",
                    "una carta {C:attention}Cosechable{}" }
            },
            Frontal = {
                name = "Frontal",
                text = { "Se activa si es el",
                    "joker de más a la {C:attention}Izquierda{}" }
            },
            Trillizos = {
                name = "Triángulo Z",
                text = { "Si tienes a {C:attention}Thomas{}",
                    "{C:attention}Tyler{} y {C:attention}Marvin{} reactiva",
                    "las cartas {C:attention}impares{}" }
            },
            Right_Footed = {
                name = "Diestro",
                text = { "Se activa si es el",
                    "joker de más a la {C:attention}Derecha{}" }
            },
            RolChange = {
                name = "Cambio de Rol",
                text = { "{C:attention}#1#{} más a la izquierda",
                    "{C:attention}#2#{} más a la derecha" }
            },
            ConsecutiveCards = {
                name = "Cartas consecutivas",
                text = {
                    "Se activa al jugar una carta",
                    "{C:attention}#1#{} a la carta",
                    "de referencia de la mano anterior"
                }
            },
            Chaotic = {
                name = "Combinación incompatible",
                text = { "Junta este jugador",
                    "con uno del equipo {C:attention}#1#{}" }
            },
            Fire_Blizzard = {
                name = "Ventisca de Fuego",
                text = { "Junta este jugador",
                    "con {C:attention}#1#{}" }
            },
            Combo_Cosmico = {
                name = "Combo Cósmico",
                text = { "Junta este jugador",
                    "con {C:attention}#1#{}" }
            },
            ina_spirit_charges = {
                name = "Poder de Espíritu",
                text = {
                    "{C:inactive}Cargas: {C:attention}#1#/#2#{}",
                    "{C:inactive}Evolución: {C:attention}#3#/#4# {C:inactive}usos{}",
                }
            },
            ina_spirit_charges_max = {
                name = "Poder de Espíritu",
                text = {
                    "{C:inactive}Cargas: {C:attention}#1#/#2#{}",
                    "{C:inactive}Evolución: {C:attention}Máx.{}"
                }
            },
            p_ina_growing_pack = {
                name = "Pack Creciente",
                text = { "Elige {C:attention}#1#{} entre {C:attention}#2#{}", "{C:attention}Jokers{} de tus equipos" }
            },
            p_ina_advanced_pack = {
                name = "Pack Avanzado",
                text = { "Elige {C:attention}#1#{} entre {C:attention}#2#{}", "{C:attention}Jokers{} de tus equipos" }
            },
            p_ina_item_pack_ina = {
                name = "Ina Pack",
                text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} Cartas del {C:tarot}Tarot{}",
                    "#3# {C:strat}Strats{} o #4# {C:training}Entrenamientos{}",
                    "compatible con uno de tus jugadores",
                    "para usar de inmediato" }
            },
            p_ina_manager_pack = {
                name = "Manager Pack",
                text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:pink}Managers{}" }
            },
            p_ina_training_pack = {
                name = "Training Pack",
                text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                    "para usar de inmediato" }
            },
            p_ina_jumbo_training_pack = {
                name = "Jumbo Training Pack",
                text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                    "para usar de inmediato", "Al menos uno será compatible",
                    "con tus {C:attention}Jokers{}" }
            },
            p_ina_mega_training_pack = {
                name = "Mega Training Pack",
                text = { "Elige {C:attention}#1#{} de {C:attention}#2#{} {C:training}Entrenamientos{}",
                    "para usar de inmediato", "Al menos dos serán compatibles",
                    "con tus {C:attention}Jokers{}" }
            },
            ina_harvest_sticker = {
                name = "Cosechable",
                text = {
                    "Esta carta puede ser",
                    "cosechada por jokers"
                },
            },
            ina_tech_plus1_sticker = {
                name = "Técnica +1",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_plus2_sticker = {
                name = "Técnica +2",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_plus3_sticker = {
                name = "Técnica +3",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_plus4_sticker = {
                name = "Técnica +4",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_plus5_sticker = {
                name = "Técnica +5",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_number2_sticker = {
                name = "Técnica número 2",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_number3_sticker = {
                name = "Técnica número 3",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_number4_sticker = {
                name = "Técnica número 4",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_numbera_sticker = {
                name = "Técnica A",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_numbers_sticker = {
                name = "Técnica S",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_numberz_sticker = {
                name = "Técnica Z",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_numberinf_sticker = {
                name = "Técnica infinito",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_grade2_sticker = {
                name = "Técnica grado 2",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_grade3_sticker = {
                name = "Técnica grado 3",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_grade4_sticker = {
                name = "Técnica grado 4",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_grade5_sticker = {
                name = "Técnica grado 5",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_grade0_sticker = {
                name = "Técnica grado 0",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_j_sticker = {
                name = "Técnica J",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_q_sticker = {
                name = "Técnica Q",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_k_sticker = {
                name = "Técnica K",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_a_sticker = {
                name = "Técnica A",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_joker_sticker = {
                name = "Técnica Joker",
                text = {
                    "Este comodín tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_spirit1_sticker = {
                name = "Evolución Nvl. II",
                text = {
                    "Este Espíritu tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_spirit2_sticker = {
                name = "Evolución Nvl. III",
                text = {
                    "Este Espíritu tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_spirit3_sticker = {
                name = "Evolución Nvl. IV",
                text = {
                    "Este Espíritu tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_spirit4_sticker = {
                name = "Evolución Nvl. V",
                text = {
                    "Este Espíritu tiene las",
                    "estadísticas aumentadas"
                },
            },
            ina_tech_spirit5_sticker = {
                name = "Evolución Nvl. Omega",
                text = {
                    "Este Espíritu tiene las",
                    "estadísticas aumentadas"
                },
            },
        },
        Planet = {
            c_ina_make = {
                name = "Make",
                text = generate_planet_text()
            },
            c_ina_haumer = {
                name = "Haumer",
                text = generate_planet_text()
            },
            c_ina_orcus = {
                name = "Orcus",
                text = generate_planet_text()
            }
        },
        Spectral = {
            c_ina_black_room = {
                name = "Black Room",
                text = { "Sube el {C:training}nivel de técnica{}",
                    "de una carta sin importar",
                    "su tipo o posición" }
            },
            c_ina_divine_water = {
                name = "Néctar de los Dioses",
                text = { "Sube el {C:training}nivel de técnica{}",
                    "de una carta {C:dark_edition,E:1}al máximo{}",
                    "pero lo vuelve {C:dark_edition}perecedero{}" }
            },
            c_ina_wait = {
                name = "Espere un poco más",
                text = { "Crea un {C:pink}manager{} {C:dark_edition}Legendario{}" }
            },
            c_ina_centella = {
                name = "Centro centella",
                text = { "Sube el {C:training}nivel de técnica{}",
                    "de todos tus {C:attention}titulares{}" }
            },
            c_ina_alius_stone = {
                name = "Piedra Alius",
                text = { "Transforma a un {C:attention}Jugador{}",
                    "compatible en su versión",
                    "de la {C:dark_edition}Academia Alius{}" }
            }
        },
        Stake = {},
        Tag = {
            tag_ina_wild_tag = {
                name = "Etiqueta Wild",
                text = { { "La tienda tiene un {C:attention}jugador gratuito{}",
                    "{C:uncommon}Poco Común{} de uno de tus equipos",
                },
                    { "Probabilidad aumentada de que",
                        "el comodín sea {C:dark_edition}negativo{}" } }
            },
            tag_ina_chain_tag = {
                name = "Etiqueta Cadena",
                text = { "Cambia la {C:attention}Ciega grande{}, Si estas en",
                    "una ciega grande, cambia la {C:attention}Ciega Jefe{}" }
            },
            tag_ina_bench_tag = {
                name = "Etiqueta Banquillo",
                text = { "Otorga gratis un {C:pink}Manager Pack{}" }
            },
            tag_ina_technique_tag = {
                name = "Etiqueta Técnica",
                text = { "Otorga gratis un {C:training}Mega Training Pack{}" }
            },
            tag_ina_coin_blue_tag = {
                name = "Moneda Azul",
                text = { "Otorga una {C:attention}Moneda Azul{}", "para usar en el {C:green}Gacha{}" }
            },
            tag_ina_coin_red_tag = {
                name = "Moneda Roja",
                text = { "Otorga una {C:attention}Moneda Roja{}", "para usar en el {C:green}Gacha{}" }
            },
            tag_ina_coin_silver_tag = {
                name = "Moneda Plateada",
                text = { "Otorga una {C:attention}Moneda Plateada{}", "para usar en el {C:green}Gacha{}" }
            },
            tag_ina_coin_purple_tag = {
                name = "Moneda Morada",
                text = { "Otorga una {C:attention}Moneda Morada{}", "para usar en el {C:green}Gacha{}" }
            },
            tag_ina_coin_gold_tag = {
                name = "Moneda Dorada",
                text = { "Otorga una {C:attention}Moneda Dorada{}", "para usar en el {C:green}Gacha{}" }
            }
        },
        Tarot = {},
        Voucher = {
            v_ina_ex_law = {
                name = "Ley del Ex",
                text = {
                    "Por cada jugador que",
                    "lleves del equipo al",
                    "que te enfrentas, reduce",
                    "en un {C:attention}#1#%{} las {C:chips}fichas{} necesarias"
                },
            },
            v_ina_ex_law_2 = {
                name = "Ley del Ex",
                text = {
                    "Por cada jugador que",
                    "lleves del equipo al",
                    "que te enfrentas, reduce",
                    "en un {C:attention}#1#%{} las {C:chips}fichas{} necesarias"
                },
                unlock = {
                    "{C:mult}Derrota{} a un equipo",
                    "con {C:attention}al menos{} un jugador",
                    "que pertenezca a dicho equipo"
                }
            },
            v_ina_training = {
                name = "Entrenamiento",
                text = {
                    "{C:attention}+1{} al {C:gold}nivel máximo{} de técnica"
                },
            },
            v_ina_training_2 = {
                name = "Súper Entrenamiento",
                text = {
                    "{C:attention}+1{} al {C:maxlvl}nivel máximo{} de técnica"
                },
                unlock = {
                    "Sube a {C:training}ASZ/+4/A/G5{}",
                    "la técnica de un jugador"
                }
            },
            v_ina_managers_1 = {
                name = "Nueva incorporación",
                text = {
                    "{C:attention}+1{} espacio de {C:enhanced}Mánager{}"
                },
            },
            v_ina_managers_2 = {
                name = "Nueva incorporación",
                text = {
                    "{C:attention}+1{} espacio de {C:enhanced}Mánager{}"
                },
                unlock = {
                    "Consigue espacio para {C:attention}3{} {C:pink}Managers{}"
                }
            },
            v_ina_growing_player = {
                name = "Jugador Creciente",
                text = {
                    "Permite que los jugadores de la",
                    "selección {C:attention}Internacional{}",
                    "aparezcan en la tienda y sobres"
                },
            },
            v_ina_modified_player = {
                name = "Jugador Modificado",
                text = {
                    "Permite que las versiones de la",
                    "{C:dark_edition}Academia Alius{} (como los",
                    "Emperadores Oscuros) aparezcan",
                    "en la tienda y sobres"
                },
                unlock = {
                    "Compra el vale",
                    "{C:attention}Jugador Creciente{}"
                }
            },
        }
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {
            c_ina_glasses_team = "Equipo Gafas",
            c_ina_love_pair = "La Pareja del Amor",
            c_ina_futbol_frontier = "Futbol Frontier",
            c_ina_elementals = "Los Elementales",
            c_ina_more_or_less = "Mas o Menos",
            c_ina_mark_challenge = "El portero legendario",
            c_ina_recruiter = "Fichatron",
        },
        collabs = {},
        dictionary = {
            ina_evolve_level = "¡Nivel subido!",
            ina_evolve_success = "¡Intercambio!",
            ina_val_down = "¡Drenado!",
            ina_training = "¡Cambio!",
            ina_next_match = "Siguiente",
            k_team_pack = "Pack de Equipo",
            k_item_pack = "Pack de Objetos",
            k_manager_pack = "Pack de Managers",
            ina_convert = "¡Convertido!",
            ina_potential_increased = "¡Potencial aumentado!",
            ina_sell_increased = "¡Jokers mejorados!",
            ina_divine = "¡Poder Divino!",
            ina_settings_custom_middle_blinds = "Ciegas personalizadas",
            ina_settings_middle_blinds_abilities = "Ciegas Pequeñas y Grandes con habilidades",
            ina_settings_winners_jokers = "Jokers Ganadores de Torneo",
            ina_settings_oc_jokers = "Jokers creados por la comunidad",
            ina_destroy = "¡Destruido!",
            ina_dribbling = "¡Regate!",
            ina_harvest = "Cosecha!",
            ina_seed = "Siembra!",
            ina_special_technique = "Super Técnicas",
            ina_technique_upgrade = "Técnica mejorada",
            ina_absorb = "¡Absorbido!",
            ina_deploy = "¡Desplegado!",
            ina_special_spirit = "Espíritus",
            ina_spirit_info = "Espíritu Guerrero",
            ina_special_manager = "Gerentes",
            ina_manager_info = "Gerente",
            ina_Fire = "Fuego",
            ina_Forest = "Bosque",
            ina_Wind = "Viento",
            ina_Mountain = "Montaña",
            ina_FW = "Delantero",
            ina_MF = "Mediocentro",
            ina_DF = "Defensa",
            ina_GK = "Portero",
            ina_Technique = "Fusión",
            ina_bench = "Banquillo",
            ina_unbench = "Titular",
            ina_generate_barriers = "Barrera!",
            ina_onfire = "On fire!",
            ina_onwind = "Riding the wind!",
            ina_onforest = "In the woods!",
            ina_onmountain = "Unshakable as stone!",
            ina_gafas = "GAFITAAAS",
            ina_saved = "Fuiste salvado",
            ina_ogre_discard = "¡Presión Militar!",
            ina_ogre_destroy = "¡Fuego Aliado!",
            ina_ogre_sell = "¡Alineación Rota!",
            ina_technique_card = "¡Técnica!",
            ina_gol = "¡Gol!",
            ina_mano = "¡Mano mejorada",
            ina_fuego_total = "¡Fuego Total!",
            ina_crush = "¡Aplastado!",
            ina_protocol = "¡Protocolo!",
            ina_caos = "Caos",
            ina_normal = "Normal",
            ina_destructores_protect = "¡Protección!",

            -- Rarities
            k_ina_top = "Destacado",
            k_ina_winner = "Ganador",
            k_ina_vestige = "Vestigio",

            -- Resources
            ina_resource_barriers = "Barreras",
            ina_training_upgrades = "Entrenamiento",
            ina_forms = "Formas",
            ina_team = "Equipo",

            -- Credits menu
            ina_credits = "Créditos",
            ina_thanks = "Gracias a",
            ina_lead_developer = "Desarrollador principal: ",
            ina_graphic_designers = "Diseñadores: ",
            ina_developers = "Desarrolladores: ",
            ina_akihiro = "Por favor, espere un poco más"
        },
        high_scores = {},
        labels = {
            ina_training_seal = "Sello Entrenamiento",
            ina_harvest_sticker = "Cosechable",
            ina_tech_plus1_sticker = "Técnica mejorada",
            ina_tech_plus2_sticker = "Técnica mejorada",
            ina_tech_plus3_sticker = "Técnica mejorada",
            ina_tech_plus4_sticker = "Técnica mejorada",
            ina_tech_plus5_sticker = "Técnica mejorada",
            ina_tech_number2_sticker = "Técnica mejorada",
            ina_tech_number3_sticker = "Técnica mejorada",
            ina_tech_number4_sticker = "Técnica mejorada",
            ina_tech_numbera_sticker = "Técnica mejorada",
            ina_tech_numbers_sticker = "Técnica mejorada",
            ina_tech_numberz_sticker = "Técnica mejorada",
            ina_tech_numberinf_sticker = "Técnica mejorada",
            ina_tech_grade2_sticker = "Técnica mejorada",
            ina_tech_grade3_sticker = "Técnica mejorada",
            ina_tech_grade4_sticker = "Técnica mejorada",
            ina_tech_grade5_sticker = "Técnica mejorada",
            ina_tech_grade0_sticker = "Técnica mejorada",
            ina_tech_j_sticker = "Técnica mejorada",
            ina_tech_q_sticker = "Técnica mejorada",
            ina_tech_k_sticker = "Técnica mejorada",
            ina_tech_a_sticker = "Técnica mejorada",
            ina_tech_joker_sticker = "Técnica mejorada",
            ina_tech_spirit1_sticker = "Evolución Nvl. II",
            ina_tech_spirit2_sticker = "Evolución Nvl. III",
            ina_tech_spirit3_sticker = "Evolución Nvl. IV",
            ina_tech_spirit4_sticker = "Evolución Nvl. V",
            ina_tech_spirit5_sticker = "Evolución Nvl. Omega",
            ina_tech_cap_plus_sticker = "Superación (Cap+)",
            ina_tech_cap_plus_max_sticker = "Superación Total (Cap+ Max)",

            k_ina_top = "Destacado",
            k_ina_winner = "Ganador",
            k_ina_vestige = "Vestigio",
        },
        poker_hand_descriptions = {
            ["ina_TriplePair"] = {
                "3 parejas distintas",
            },
            ["ina_FullMansion"] = {
                "4 cartas del mismo rango",
                "y 2 de otro",
            },
            ["ina_GodHand"] = {
                "6 cartas del mismo rango"
            },
            ["ina_MagicHand"] = {
                "6 cartas del mismo rango y",
                "elemento"
            }
        },
        poker_hands = {
            ["ina_TriplePair"] = "Triple pareja",
            ["ina_FullMansion"] = "Full Mansion",
            ["ina_GodHand"] = "Mano Celestial",
            ["ina_MagicHand"] = "Mágico Gigante",
            ["ina_magic_fire"] = "Tormenta de Fuego",
            ["ina_magic_forest"] = "Mano Mágica",
            ["ina_magic_mountain"] = "Mano Mágica",
            ["ina_magic_wind"] = "Ola Mágica",
        },
        teams = {
            ["ina_team_Raimon"] = "Raimon",
            ["ina_team_Occult"] = "Occult",
            ["ina_team_RoyalAcademy"] = "Royal Academy",
            ["ina_team_Wild"] = "Wild",
            ["ina_team_Brain"] = "Brain",
            ["ina_team_Otaku"] = "Otaku",
            ["ina_team_Farm"] = "Farm",
            ["ina_team_InazumaEleven"] = "Inazuma Eleven",
            ["ina_team_Kirkwood"] = "Kirkwood",
            ["ina_team_Shuriken"] = "Shuriken",
            ["ina_team_Zeus"] = "Zeus",
            ["ina_team_Torneo"] = "Torneo",
            ["ina_team_TormentadeGéminis"] = "Tormenta de Géminis",
            ["ina_team_ServicioSecreto"] = "Servicio Secreto",
            ["ina_team_Alpino"] = "Alpino",
            ["ina_team_Epsilon"] = "Épsilon",
            ["ina_team_RoyalRedux"] = "Royal Academy Redux",
            ["ina_team_EmperadoresOscuros"] = "Emperadores Oscuros",
            ["ina_team_PolvodeDiamantes"] = "Polvo de Diamantes",
            ["ina_team_Prominence"] = "Prominence",
            ["ina_team_Zeus_Ares"] = "Zeus",
            ["ina_team_ClaustroSagrado"] = "Claustro Sagrado",
            ["ina_team_OsakaCCC"] = "Osaka CCC",
            ["ina_team_Fauxshore"] = "Fauxshore",
            ["ina_team_MaryTimes"] = "Mary Times",
            ["ina_team_Genesis"] = "Génesis",
            ["ina_team_EiseiGakuen"] = "Eisei Gakuen",
            ["ina_team_InakuniRaimon"] = "Inakuni Raimon",
            ["ina_team_Scout"] = "Ojeadores",
            ["ina_team_InazumaJapon"] = "Inazuma Japón",
            ["ina_team_Ogre"] = "Academia Ogro",
        },
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            a_powmult = { "^#1# Mult" },
            ina_idea = { "Idea: #1#" },
            ina_art = { "Arte: #1#" },
            ina_code = { "Código: #1#" }
        },
        v_text = {
            ch_c_ina_futbol_frontier = { "Las ciegas saldrán en el orden del {C:attention}Fútbol Frontier{}" },
            ch_c_ina_win_ante16 = { "Supera un enemigo {C:dark_edition}Legendario{}" },
            ch_c_ina_elementals = { "Las ciegas solo podrán ser {C:dark_edition}Elementales{}" }
        }
    }
}
