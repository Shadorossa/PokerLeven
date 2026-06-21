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
            bl_ina_tormenta_geminis = {
                name = "Tormenta de Géminis",
                text = { "Juega tu mano en {C:attention}10s{}", "o se jugará {C:attention}automáticamente{}" }
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
            bl_ina_spfixers = {
                name = "Servicio Secreto",
                text = { "Las figuras dan", "{C:chips}+10{} Fichas adicionales" }
            },
            bl_ina_alpine = {
                name = "Instituto Alpino",
                text = { "Tréboles {C:attention}debilitados{}", "Diamantes dan {C:mult}+5{} Mult" }
            },
            bl_ina_cloister = {
                name = "Claustro Sagrado",
                text = { "Pierde {C:attention}1 descarte{} (o mano)", "por cada mano jugada" }
            },
            bl_ina_osakaccc = {
                name = "CCC de Osaka",
                text = { "Gana {C:money}1${} por descarte usado", "Los EG cargan al ganar" }
            },
            bl_ina_fauxshore = {
                name = "Instituto Fauxshore",
                text = { "Ciega {C:attention}30%{} más grande", "Descartes por {C:money}1${} cada uno" }
            },
            bl_ina_marytimes = {
                name = "Mary Times",
                text = { "{X:mult,C:white}X2{} si aciertas palo o", "nº de cartas secreto" }
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
            bl_ina_epsilon = {
                name = "Épsilon",
                text = { "La {C:attention}primera mano{} jugada", "no puntúa" }
            },
            bl_ina_epsilonplus = {
                name = "Épsilon Plus",
                text = { "No puntúan manos de {C:attention}4+ cartas{}", "salvo {C:attention}Tormenta de Fuego{}" }
            },
            bl_ina_RRedux = {
                name = "Royal Academy Redux",
                text = { "{C:attention}5%{} (+5% por mano) de", "destruir un Joker activado" }
            },
            bl_ina_Genesis = {
                name = "Génesis",
                text = { "Anula todas las {C:attention}Ediciones{}", "y {C:attention}Sellos{} de tus cartas" }
            },
            bl_ina_Prominence = {
                name = "Prominence",
                text = { "El {C:attention}25%{} de tu puntuación", "final es destruido" }
            },
            bl_ina_Diamond = {
                name = "Polvo de Diamantes",
                text = { "Las cartas y Jokers", "{C:attention}no pueden moverse{}" }
            },
            bl_ina_ForestTeam = {
                name = "Mar de Árboles",
                text = { "Al jugar o descartar, los palos", "del mazo {C:attention}cambian al azar{}" }
            },
            bl_ina_YoungInazuma = {
                name = "Jóvenes Inazuma",
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
            -- IE1_A_raimon
            j_ina_Kevin = {
                name = "Kevin Dragonfly",
                text = { "{C:forest}Tornado Dragón{}",
                    "Reactiva el {C:attention}Joker{} {X:fw,C:white}FW{}",
                    "derecho cada {C:attention}#1# manos",
                    "{C:inactive}#2# restantes" }
            },
            j_ina_Mark = {
                name = "Mark Evans",
                text = { "{C:mountain}Mano Mágica{}",
                    "{C:attention}+#1#{} al tamaño de mano jugada y de {C:red}descarte{}",
                    "{C:chips}+#2#{} al tamaño de {C:chips}mano{}" }
            },
            j_ina_Nathan = {
                name = "Nathan Swift",
                text = { "{C:wind}Entrada Huracán{}",
                    "Cada {C:attention}Joker{} del {X:ina_team_raimon,C:white}Raimon{}",
                    "otorga {X:mult,C:white}X#2#{}" }
            },
            j_ina_Jack = {
                name = "Jack Wallside",
                text = { "{C:mountain}El Muro{}",
                    "{C:attention}Las Piedras{} ganan {C:chips}+#1#{} fichas",
                    "permanentemente por cada {C:attention}Joker{} {X:df,C:white}DF{}"
                }
            },
            j_ina_Axel = {
                name = "Axel Blaze",
                text = { "{C:fire}Tormenta de Fuego",
                    "La mano jugada obtiene {X:mult,C:white}X#1#{}",
                    "si contiene {C:attention}Color{} de {C:hearts}Corazones{}" }
            },
            j_ina_Shadow = {
                name = "Shadow Cimmerian",
                text = { "{C:forest}Tornado Oscuro{}",
                    "Si al seleccionar la ciega es",
                    "el único {C:attention}Joker{}, crea una copia",
                    "{C:dark_edition}negativa{} propia sin habilidades"
                }
            },
            j_ina_Willy = {
                name = "Willy Glass",
                text = { "{C:forest}Remate gafas{}",
                    "{C:green}#1# en #2#{} de convertir la mano",
                    "jugada en cartas {C:attention}policromáticas{},",
                    "de {C:attention}cristal{} y con {C:attention}sello rojo{}" }
            },
            j_ina_Max = {
                name = "Maxwell 'Max' Carson",
                text = { "{C:wind}Remate Espiral{}",
                    "{C:chips}+#1#{} fichas por cada comodín de {X:wind,C:white}Viento{}",
                    "{C:inactive}(Actual:{} {C:chips}+#2#{}{C:inactive}){}" }
            },
            j_ina_Peabody = {
                name = "Paul Peabody",
                text = { "{C:mountain}Mano Celestial{}",
                    "Aumenta en {C:mult}+#2#{} por cada {C:attention}carta puntuada{}",
                    "en la última mano jugada",
                    "{C:inactive}(Actual:{} {C:mult}+#1#{}{C:inactive} multi en tu última mano){}"
                }
            },
            j_ina_Jude_Raimon = {
                name = "Jude Sharp",
                text = { "{C:wind}Espejismo de Balón{}",
                    "Gana {X:mult,C:white}X#2#{} cada vez que el {C:attention}Joker",
                    "a su {C:attention}izquierda{} se activa",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}"
                }
            },
            j_ina_Bobby = {
                name = "Bobby Shearer",
                text = { { "{C:forest}El Traidor{}",
                    "Al seleccionar la ciega, cambia",
                    "a tu equipo más numeroso", },
                    { "Los jugadores del equipo",
                        "de {C:attention}Bobby{} otorgan {C:chips}+#1# Chips{}", } }
            },
            j_ina_Steve = {
                name = "Steve Grim",
                text = { "{C:wind}Disparo Rodante{}",
                    "Cada {C:attention}Joker{} del {X:ina_team_raimon,C:white}Raimon{} otorga {C:chips}+#1# Fichas{} y {C:mult}+#2# Mult.{}",
                    "Gana {C:money}+#3#${} al finalizar la ronda.",
                    "{C:inactive}(Actual:{} {C:chips}+#4#{} {C:inactive}y{} {C:mult}+#5# {C:inactive}){}",
                }
            },
            j_ina_Erik = {
                name = "Erik Eagle",
                text = { "{C:forest}Tri-Pegaso{}",
                    "{C:tarot}El Mago{} cambia su efecto y",
                    "pasa a otorgar {C:attention}2 sellos{} al azar", }
            },
            j_ina_Jim = {
                name = "Jim Wraith",
                text = { "{C:wind}Giro bobina{}",
                    "Gana {C:chips}+#1#{} fichas",
                }
            },
            j_ina_Tod = {
                name = "Tod Ironside",
                text = {
                    "{C:wind}Equilibrismo{}",
                    "Gana {C:chips}+#1#{} fichas por",
                    "cada {C:enhanced}Acero{}",
                    "en {C:attention}mano{} o {C:attention}jugada{}"
                }
            },

            -- IE1_B_occult
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
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}",
                }
            },
            j_ina_Blood = {
                name = "Blood",
                text = { "{C:mountain}Niebla Venenosa{}",
                    "{C:attention}Drena{} {C:money}#1#${} de los {C:attention}Jokers{} adyacentes,",
                    "Cada {C:money}1${} en su valor de venta otorga {C:chips}+#2# Fichas{}",
                    "{C:inactive}(Actual:{} {C:chips}+#3#{}{C:inactive}){}" }
            },
            j_ina_Grave = {
                name = "Grave",
                text = { "{C:fire}Maldición{}", "{C:green}#1# en #2#{} de crear una carta",
                    "{C:tarot}Muerte{} por cada {C:attention}6{} que consigas puntuar" }
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

            -- IE1_C_royal
            j_ina_King = {
                name = "Joseph King",
                text = { "{C:fire}Escudo de Fuerza{}",
                    "Copia el rey {C:attention}derecho{} al",
                    "jugar una mano que contenga",
                    "un {C:attention}Trío{} de {C:attention}Reyes{}", }
            },
            j_ina_Bloom = {
                name = "Bloom",
                text = { "{C:fire}Chut de los 100 toques{}",
                    "{X:mult,C:white}X#1#{} si juegas {C:attention}Escalera{} tras",
                    "haber conseguido puntuar {C:attention}100{} cartas",
                    "{C:inactive}(Actual:{} {C:attention}#2#{}{C:inactive} puntuadas){}" }
            },
            j_ina_Drent = {
                name = "Drent",
                text = { "{C:mountain}Terremoto{}",
                    "{C:green}#1# en #2#{} de crear {C:tarot}La Torre{}",
                    "después de cada {C:attention}mano{} jugada.",
                    "Cada {C:attention}Joker{} {X:mountain,C:white}Montaña{} lo mejora en {C:green}1{}" }
            },
            j_ina_Jude = {
                name = "Jude Sharp",
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
                name = "David Samford",
                text = { "{C:forest}Penguin Emperor No. 2{}", "{X:mult,C:white}X#1#{} Mult if spade",
                    "color with {C:attention}1{} {X:mf,C:white}MF{} and {C:attention}2{} {X:fw,C:white}FW{}" }
            },
            j_ina_Swing = {
                name = "Swing",
                text = { "{C:wind}Multiple Tap{}",
                    "Scoring Three of a Kind gains {C:chips}+#1#{} chips",
                    "per {C:attention}Joker{} from {X:ina_team_royalacademy,C:white}Royal Academy{}", }
            },

            -- IE1_L_Umbrella
            j_ina_Banker = {
                name = "Banker",
                text = {
                    "{C:wind}Financial Manipulation{}",
                    "A {C:attention}#1#%{} of shop items are",
                    "{C:money}free{}, the rest cost {C:red}double{}"
                }
            },

            -- IE3_F_KnightsOfQueen
            j_ina_David_Buckingham = {
                name = "David Buckingham",
                text = {
                    "{C:mountain}Indestructible Palace{}",
                    "Every {{C:attention}#2#{} hands played",
                    "multiplies chips by {{X:chips,C:white}X3{}",
                    "{{C:inactive}#1#{}"
                }
            },
            j_ina_Lance_Ralton = {
                name = "Lance Ralton",
                text = {
                    "{C:wind}Lance Charge{}",
                    "Scoring {{C:attention}3+{} of the same rank 3 times consecutively",
                    "reduces the blind's goal by {{C:attention}15%{}",
                    "{{C:inactive}(Rank: #1# | Consecutive: #2#/3){}"
                }
            },
            j_ina_Gary_Mane = {
                name = "Gary Mane",
                text = {
                    "{C:mountain}Mountain Pride{}",
                    "Gain {{X:chips,C:white}X#1#{} chips permanently",
                    "per hand played of the {{C:attention}same type{}",
                    "consecutively. If you break the chain,",
                    "lose {{C:red}half{} of the accumulated multiplier.",
                    "{{C:inactive}(Current: {{X:chips,C:white}X#2#{C:inactive} | Last: #3#){}"
                }
            },
            j_ina_Edgar_Partinus = {
                name = "Edgar Partinus",
                text = {
                    "{C:wind}Excalibur{}",
                    "The cards needed for",
                    "{{C:attention}Straight{} vary based on the cycle"
                }
            },
            j_ina_Mikey_Richards = {
                name = "Mikey Richards",
                text = {
                    "{C:forest}Forest Cycle{}",
                    "Every {{C:attention}#1#{} hands scored, add",
                    "{{C:attention}#2#{} cards from your discard pile",
                    "randomly back to your hand.",
                    "{{C:inactive}(Progress: #3#/#1#){}"
                }
            },

            -- IE3_G_BrockenBrigade
            j_ina_Thorsten_Welger = {
                name = "Thorsten Welger",
                text = {
                    "{C:forest}Lethal Mesh{}",
                    "When you select a {{C:attention}blind{},",
                    "the leftmost {{C:attention}joker{}",
                    "becomes {{C:dark_edition}negative{} and perishable"
                }
            },

            -- IE3_O_TheKingdom
            j_ina_Nacho_Ortega = {
                name = "Nacho Ortega",
                text = {
                    "{C:fire}Million Hands{}",
                    "In {C:attention}PvP{} blinds, each available hand",
                    "reduces rival's goal by {C:attention}#1#%{}",
                }
            },
            j_ina_Monstro_Ximenes = {
                name = "Monstro Ximenes",
                text = {
                    "{C:fire}Insatiable{}",
                    "Exceeding the {C:attention}blind{} doesn't end it,",
                    "you can keep playing your {C:attention}remaining hands{}",
                }
            },
            j_ina_Bolboreta_Barboza = {
                name = "Bolboreta Barboza",
                text = {
                    "{C:wind}Transformation{}",
                    "Copies the {C:attention}ability of last joker{}",
                    "you bought from the {{C:attention}shop{}"
                }
            },
            j_ina_Ricardo_Aguero = {
                name = "Ricardo Agüero",
                text = {
                    "{C:mountain}Serial Goal Scorer{}",
                    "If you exceed the blind by more than {{C:attention}#3#%{}",
                    "gain {{C:attention}+1{} streak",
                    "Each streak adds {{C:attention}#2#%{} power (chips and mult)",
                    "{{C:inactive}(Current streak: #1#){}"
                }
            },
            j_ina_Enrique_Caroso = {
                name = "Enrique Caroso",
                text = {
                    "{C:wind}Master of Rhythm{}",
                    "Achieve this pattern in {{C:attention}3{} consecutive hands:",
                    "{{C:attention}Hand 1{}: Pair | {{C:attention}Hand 2{}: Three of a Kind | {{C:attention}Hand 3{}: Four of a Kind",
                    "If successful, activate {{C:wind}Harmony{}: +{{C:attention}#2#{} card slots × 5 rounds",
                    "{{C:inactive}(Progress: #1#/3 | Status: #3#){}"
                }
            },

            -- IE1_D_wild
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
                    "{C:enhanced}versátil{} que consigas puntuar en un {C:attention}Color",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}" }
            },
            j_ina_Monkey = {
                name = "Monkey",
                text = { "{C:wind}Giro del Mono{}",
                    "Obtén {X:mult,C:white}XMult{} por {C:enhanced}cartas versátiles{}",
                    "en el mazo, multiplicado por {X:ina_team_wild,C:white}Wild{} / 10",
                    "{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}{C:inactive}){}" }
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

            -- IE1_E_brain
            j_ina_Feldt = {
                name = "Thomas Feldt",
                text = { {
                    "{C:forest}Campo de Fuerza Defensivo{}",
                    "Genera {C:attention}#1#{} {X:mountain,C:white}Barrera{}",
                    "si la mano contiene {C:attention}3{} {C:spades}Picas{}"
                },
                    {
                        "En la {C:attention}última mano{} consume",
                        "todas las {X:mountain,C:white}Barreras{} para",
                        "dar {X:mult,C:white}X#2#{} por {C:attention}Joker de {X:forest,C:white}Bosque{}",
                        "{C:inactive}(Actual:{} {X:mult,C:white}X#3#{}{C:inactive}){}"
                    }
                }
            },
            j_ina_Marvel = {
                name = "Marvel",
                text = { "{C:mountain}Escaner Defensa", "Si el valor en {C:chips}fichas{}",
                    "de la carta que consigues puntuar",
                    "tiene {C:attention}exactamente 3 bits en 1{}",
                    "{C:mult}+#1#{} de multi" }
            },
            j_ina_Tell = {
                name = "Tell",
                text = { "{C:forest}Adivino{}", "{X:chips,C:white}XPI{} si tienes {C:attention}3, 1, 4{} en",
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
                    "de la primera carta que consigas puntuar por cada {X:ina_team_brain,C:white}Brain{}" }

            },
            j_ina_Under = {
                name = "Under",
                text = { "{C:forest}Calculo Dificil", "Obtiene {C:chips}#1# / log2(#2# + 1){} chips",
                    "por cada {X:gk,C:white}GK{}{}" }
            },

            -- IE1_F_otaku
            j_ina_Idol = {
                name = "Idol",
                text = { "{C:mountain}Deslizamiento de Portería{}",
                    "Reactiva {C:attention}4s{}",
                    "{C:green}#1# de #2#{} veces" }
            },
            j_ina_Hero = {
                name = "Hero",
                text = { "{C:fire}Bola falsa{}", "Transforma cada carta",
                    "{C:attention}figura{} que consigas puntuar en un {C:attention}4{}" }
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
            j_ina_Moe = {
                name = "Moe",
                text = { "{C:forest}Aura de Maquillaje{}", "Los {C:attention}4s{} otorgan {X:mult,C:white}X#1#{} Mult",
                    "Suma {C:attention}#2#{} al tamaño de mano jugada" }
            },
            j_ina_Hacker = {
                name = "Hacker",
                text = { "{C:mountain}Ciberbalón{}", "Al puntuar un {C:attention}4{} roba",
                    "una carta adicional" }
            },
            j_ina_Artie = {
                name = "Artie",
                text = { "{C:wind}Regate Rítmico{}", "Al jugar una {C:attention}Escalera{} gana",
                    "{C:money}#1#${} por cada {C:attention}4{} que contenga" }
            },
            j_ina_Nerd = {
                name = "Nerd",
                text = { "{C:mountain}Muro de Gafas{}", "Otorga {C:chips}+#1#{} Fichas por cada {C:attention}4{}",
                    "en tu mazo completo" }
            },

            -- IE1_G_inazuma_eleven
            j_ina_Hoshi = {
                name = "Hoshi",
                text = { "{C:wind}Campo Torbellino{}",
                    "Gana {C:mult}+#1#{} de multi por cada {X:ina_team_inazumaeleven,C:white}Inazuma 11{}",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}" }
            },
            j_ina_Hibiki = {
                name = "Seymour Hillman",
                text = { "{C:mountain}Mano Celestial{}",
                    "{C:attention}Retrigger{} a todos los {X:gk,C:white}GK{}" }
            },
            j_ina_Silvia = {
                name = "Silvia Woods",
                text = { "{C:forest}Mánager Eficiente{}", "Otorga {X:mult,C:white}X#1#{} si tienes",
                    "exactamente {C:attention}#2#{} {C:pink}Managers{}" }
            },
            j_ina_Celia = {
                name = "Celia Hills",
                text = { "{C:wind}Análisis de Datos{}", "Al seleccionar la ciega,",
                    "revela {C:attention}#1#{} cartas del mazo" }
            },
            j_ina_Nelly = {
                name = "Nelly Raimon",
                text = { "{C:fire}Apoyo Directivo{}", "Otorga {C:chips}+#1#{} Fichas por cada",
                    "Joker del equipo {C:attention}#2#{}" }
            },

            -- IE1_H_zeus
            j_ina_Aphrodite = {
                name = "Byron Love",
                text = { "{C:wind}Sabiduría Divina{}",
                    "{X:mult,C:white}X#1#{} multi si la mano",
                    "contiene un {C:attention}As{}",
                    "{C:inactive}(Escala con nivel de técnica){}" }
            },
            j_ina_Poseidon = {
                name = "Poseidon",
                text = { "{C:mountain}Muralla de Tsunami{}",
                    "Al puntuar una {C:attention}figura{} gana",
                    "{C:chips}+#1#{} fichas" }
            },
            j_ina_Hermes = {
                name = "Hermes",
                text = { "{C:wind}Carrera Acuática{}",
                    "Gana {C:mult}+#1#{} multi por cada",
                    "mano {C:attention}consecutiva{} jugada sin descartar",
                    "{C:inactive}(Actual:{} {C:mult}+#2#{}{C:inactive}){}" }
            },
            j_ina_Dionysus = {
                name = "Dionysus",
                text = { "{C:forest}Remate Divino{}",
                    "{C:green}#1# en #2#{} de crear una",
                    "carta de {C:tarot}Tarot{} al azar" }
            },
            j_ina_Artemis = {
                name = "Artemis",
                text = { "{C:wind}Divine Arrow{}",
                    "Scoring a face card {{C:attention}Seeds{} it.",
                    "{{C:attention}Harvester:{} Gain {{C:chips}+#1#{} chips",
                    "{{C:inactive}(Current:{{} {{C:chips}+#2#{{C:inactive}){}" }
            },
            j_ina_Athena = {
                name = "Athena",
                text = { "{C:forest}Heaven's Time{}",
                    "{C:attention}Once per round{}, if positioned to the {C:attention}right{}:",
                    "Play a hand to see the points it would give",
                    "without consuming hands and without losing the cards." }
            },
            j_ina_Apollo = {
                name = "Apollo",
                text = { "{C:fire}Rayo Luminoso{}",
                    "Al puntuar un {C:attention}As{} gana",
                    "{X:mult,C:white}X#1#{} multi" }
            },
            j_ina_Ares = {
                name = "Ares",
                text = { "{C:fire}Ataque de Meteoritos{}",
                    "Al destruir una carta gana",
                    "{C:mult}+#1#{} multi" }
            },
            j_ina_Hera = {
                name = "Hera",
                text = { "{C:mountain}Juicio Divino{}",
                    "Si la mano es una {C:attention}Escalera Color{},",
                    "crea una carta {C:spectral}Espectral{} aleatoria" }
            },
            j_ina_Demeter = {
                name = "Demeter",
                text = { "{C:forest}Cosecha Divina{}",
                    "Gana {C:money}#1#${} por cada",
                    "carta {C:attention}As{} en tu mano al final de la ronda" }
            },
            j_ina_Hephaestus = {
                name = "Hephaestus",
                text = { "{C:fire}Martillo Divino{}",
                    "Mejora un {C:attention}As{} aleatorio a",
                    "{C:attention}Carta de Oro{} cada ronda" }
            },
        },
        Other = {
            Mangual_Letal = {
                name = "Mangual Letal",
                text = { "Ectoplasma otorga {C:dark_edition}Letal{} a {C:attention}Bash{}, {C:attention}Malice{} y {C:attention}Callous{}" }
            },
            Dios_rematador = {
                name = "Dios rematador",
                text = {
                    "El valor de los jokers puede",
                    "descender a {C:red}negativo{}.",
                    "Venderlos te {C:red}costará dinero{}."
                }
            },
            ina_stone_seal = {
                name = "Stone Seal",
                text = {
                    "This card {C:attention}always{}",
                    "scores when played"
                }
            },
            ina_space_seal = {
                name = "Space Seal",
                text = {
                    "When scoring, has a {C:green}#1# in #2#{} chance",
                    "to level up the",
                    "hand played"
                }
            },
            ricardo_streak_reset = {
                name = "Streak Reset",
                text = {
                    "The streak will be lost completely",
                    "if you win {{C:attention}3 consecutive blinds{}",
                    "without exceeding the goal by more than {{C:attention}250%{}.",
                    "{{C:inactive}(Progress: #1#/3){}"
                }
            },
            modo_cambio = {
                name = "Change Mode",
                text = {
                    "If placed to the {{C:attention}far right{}",
                    "when entering a blind, transforms",
                    "into {{C:attention}Byron{} for {{C:attention}4 blinds{}."
                }
            },
            fate_tooltip = {
                name = "Fate",
                text = {
                    "{{C:attention}#1#{} blinds remaining",
                    "to complete {{C:attention}the deal{}"
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
                name = "Cap+",
                text = {
                    "Este comodín ha",
                    "roto sus límites.",
                    "{C:attention}Inmune a Debuffs{}"
                },
            },
            ina_tech_cap_plus_max_sticker = {
                name = "Cap+ max",
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
            Evolution = {
                name = "Evolution",
                text = {
                    "This player can {{C:attention}evolve{}",
                    "upon meeting its goal.",
                    "{{C:inactive,s:0.8}Only available once per round."
                }
            },
            Kenville_Evolution = { name = "Epsilon (P)", text = { "Play a {{C:attention}Straight{} that", "contains a {{C:attention}2, 3 and 4{}." } },
            Mole_Evolution = { name = "Epsilon (P)", text = { "Transfer {{C:attention}#1#/#2#{} upgrades{}." } },
            Kayson_Evolution = { name = "Epsilon (P)", text = { "Defeat {{C:attention}#1#/#2#{} Boss Blinds{}." } },
            Tytan_Evolution = { name = "Epsilon (P)", text = { "Score {{C:attention}#1#/#2#{} cards{} of", "{{C:attention}Stone{} or {{C:attention}Steel{}." } },
            Fedora_Evolution = { name = "Epsilon (P)", text = { "Send {{C:attention}#1#/#2#{} cards{} to the void." } },
            Krypto_Evolution = { name = "Epsilon (P)", text = { "Have {{C:attention}#1#/#2#{} Chaotic Cards{}", "in your deck." } },
            Sworm_Evolution = { name = "Epsilon (P)", text = { "Perform {{C:attention}#1#/#2#{} rescues{} and", "{{C:attention}#3#/#4#{} discards{}." } },
            Mercury_Evolution = { name = "Epsilon (P)", text = { "Use {{C:attention}#1#/#2#{} Mercury planets{}." } },
            Metron_Evolution = { name = "Epsilon (P)", text = { "Reach an exponent of", "{{C:attention}^#1#/^#2#{}." } },
            Epsilon_Timer = { name = "Plus Form", text = { "Returns to normal state", "in {{C:attention}#1#{} blind/s." } },
            CalebR_Evolution = { name = "Evolution", text = { "Evolves {{C:attention}Joseph King{} and {{C:attention}David Samford{} after {{C:attention}#3#{} rounds." } },
            Caleb_IJ_Evolution = { name = "Transformation", text = { "Transforms {{C:attention}King{} and {{C:attention}Samford{} into {{C:dark_edition}Redux{} if they are starters in {{X:ina_team_inazumajapan,C:white}I. Japan{} for {{C:attention}#3#{} rounds." } },
            Position_Evolution = { name = "Epsilon (P)", text = { "Move the player to the", "right half of your Jokers." } },
            RolChange = {
                name = "Role Change",
                text = { "{{C:attention}#1#{} furthest to the left",
                    "{{C:attention}#2#{} furthest to the right" }
            },
            ConsecutiveCards = {
                name = "Consecutive Cards",
                text = {
                    "Activates when playing a card",
                    "{{C:attention}#1#{} next to the reference card",
                    "from the previous hand"
                }
            },
            Chaotic = {
                name = "Chaos",
                text = { "Combine this player",
                    "with one from team {{C:attention}#1#{}" }
            },
            Fire_Blizzard = {
                name = "Fire Blizzard",
                text = { "Combine this player",
                    "with {{C:attention}#1#{}" }
            },
            Combo_Cosmico = {
                name = "Cosmic Combo",
                text = { "Gain {{C:mult}Mult.{} and {{C:chips}Chips{} extra",
                    "per Joker with {{C:red}negative{} value",
                    "if {{C:attention}Xavier Schiller{} is present." }
            },
            ina_spirit_charges = {
                name = "Spirit Power",
                text = {
                    "{{C:inactive}Charges: {{C:attention}#1#/#2#{}",
                    "{{C:inactive}Evolution: {{C:attention}#3#/#4#{} {{C:inactive}uses{}",
                }
            },
            ina_spirit_charges_max = {
                name = "Spirit Power",
                text = {
                    "{{C:inactive}Charges: {{C:attention}#1#/#2#{}",
                    "{{C:inactive}Evolution: {{C:attention}Max.{}"
                }
            },
            Edgar_Nivel1 = {
                name = "Cycle 1",
                text = { "Needs {{C:attention}#1#{} cards", "{{C:red}}-20%{} Chips and Mult in Straight" }
            },
            Edgar_Nivel2 = {
                name = "Cycle 2",
                text = { "Needs {{C:attention}#1#{} cards", "{{C:green}}+10%{} Chips and Mult in Straight" }
            },
            Edgar_Nivel3 = {
                name = "Cycle 3",
                text = { "Needs {{C:attention}#1#{} cards", "{{C:attention}}+50%{} Chips and Mult in Straight" }
            },
            Edgar_Nivel4 = {
                name = "Cycle 4",
                text = { "Needs {{C:attention}#1#{} cards", "{{C:attention}}+100%{} Chips and Mult in Straight" }
            },
            Edgar_Nivel5 = {
                name = "Cycle 5",
                text = { "Needs {{C:attention}#1#{} cards", "{{C:mult}}+250%{} Chips and Mult in Straight" }
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
            ina_oblivion = "El Olvido",
            ina_hell_drop = "Caída a los Infiernos",
            ina_rank_up = "¡Ascenso!",
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

            -- Knights of Queen
            k_palace = "Palace!",
            k_palace_built = "Palace Built!",
            k_floor = "Floor",
            k_lance_charge = "Lance Charge!",
            k_lance = "Lance",
            k_chain_broken = "Chain Broken!",
            k_forest_cycle = "Forest Cycle!",
            k_excalibur = "Excalibur!",

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
            ina_tech_cap_plus_sticker = "Cap+",
            ina_tech_cap_plus_max_sticker = "Cap+ max",
            ina_stone_seal = "Stone Seal",
            ina_space_seal = "Space Seal",

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
            ["ina_team_Seishou"] = "Seishou Academy",
            ["ina_team_Tonegawa"] = "Tonegawa Tousen",
            ["ina_team_Oumahara"] = "Oumahara",
            ["ina_team_InazumaJapon"] = "Inazuma Japón",
            ["ina_team_NeoJapon"] = "Neo Japón",
            ["ina_team_TheEmpire"] = "The Empire",
            ["ina_team_KnightsOfQueen"] = "Knights of Queen",
            ["ina_team_Unicorn"] = "Unicorn",
            ["ina_team_Orpheus"] = "Orpheus",
            ["ina_team_TheKingdom"] = "The Kingdom",
            ["ina_team_LittleGigant"] = "Little Gigant",
            ["ina_team_TeamZoolan"] = "Team Zoolan",
            ["ina_team_TeamGarshield"] = "Team Garshield",
            ["ina_team_DarkAngels"] = "Dark Angels",
            ["ina_team_SkyTeam"] = "Sky Team",
            ["ina_team_MakaiArmy"] = "Makai Army Z",
            ["ina_team_RoseGryphon"] = "Rose Gryphon",
            ["ina_team_BrockenBorg"] = "Brocken Borg",
            ["ina_team_TheBarracudas"] = "The Barracudas",
            ["ina_team_RedMatadors"] = "Red Matadors",
            ["ina_team_DesertLion"] = "Desert Lion",
            ["ina_team_BigWaves"] = "Big Waves",
            ["ina_team_FireDragon"] = "Fire Dragon",
            ["ina_team_Scout"] = "Scouts",
            ["ina_team_Ogre"] = "Academia Ogro",
            ["ina_team_OgreRedux"] = "Ogro Redux",
            ["ina_team_Destructores"] = "Destructores",
        }
    }
}
