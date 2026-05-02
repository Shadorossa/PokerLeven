SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 16,
    py = 16
})

SMODS.Atlas({
    key = "custom_icons",
    path = "custom_icons.png",
    px = 18,
    py = 18
})

SMODS.Atlas({
    key = "Jokers01",
    path = "jokers01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Spirits01",
    path = "Spirit.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers02",
    path = "Jokers02.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers03",
    path = "Jokers03.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers04",
    path = "Jokers04.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers05",
    path = "Jokers05.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers06",
    path = "Jokers06.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers07",
    path = "jokers07.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers08",
    path = "Jokers08.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers09",
    path = "Jokers09.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Jokers10",
    path = "jokers10.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "JokersBobby",
    path = "JokersBobby.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "JokersVestigio",
    path = "jokers_vestigio.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "top",
    path = "jokers_top01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "legendary01",
    path = "legendary01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "tournaments",
    path = "tournaments.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "ina_logo",
    path = "ina_logo.png",
    px = 389,
    py = 216
}):register()

SMODS.Atlas({
    key = "ina_resources",
    path = "resources.png",
    px = 18,
    py = 18
}):register()

SMODS.Atlas({
    key = "stickers",
    path = "stickers.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "stickers02",
    path = "stickers02.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Managers01",
    path = "managers01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "Boosters01",
    path = "Boosters01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "decks",
    path = "decks.png",
    px = 71,
    py = 95,
}):register()

SMODS.Atlas({
    key = "Tags01",
    path = "tags01.png",
    px = 34,
    py = 34
}):register()

SMODS.Atlas({
    key = "bossBlinds",
    atlas_table = "ANIMATION_ATLAS",
    path = "bossBlinds01.png",
    px = 34,
    py = 34,
    frames = 21,
}):register()

SMODS.Atlas({
    key = "finalBossBlinds",
    atlas_table = "ANIMATION_ATLAS",
    path = "finalBossBlinds.png",
    px = 34,
    py = 34,
    frames = 34,
}):register()

SMODS.Atlas({
    key = "finalBossBlindsChr",
    atlas_table = "ANIMATION_ATLAS",
    path = "finalBossBlindsChr.png",
    px = 34,
    py = 34,
    frames = 34,
}):register()

SMODS.Atlas({
    key = "smallBlinds01",
    atlas_table = "ANIMATION_ATLAS",
    path = "smallBlinds01.png",
    px = 34,
    py = 34,
    frames = 21,
}):register()

SMODS.Atlas({
    key = "bigBlinds01",
    atlas_table = "ANIMATION_ATLAS",
    path = "bigBlinds01.png",
    px = 34,
    py = 34,
    frames = 21,
}):register()

SMODS.Atlas({
    key = "bossBlinds20",
    atlas_table = "ANIMATION_ATLAS",
    path = "bossBlinds20.png",
    px = 34,
    py = 34,
    frames = 21,
}):register()

SMODS.Atlas({
    key = "upgrade_techniques",
    path = "upgrade_techniques.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "vouchers01",
    path = "vouchers01.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
    key = "enhancements01",
    path = "enhancements01.png",
    px = 71,
    py = 95
}):register()

SMODS.Sound({
    key = "music_titlescreen",
    path = "titlescreen.ogg",
    volume = 0.25,
    sync = {
        ina_music_mainline = true
    },
    pitch = 1,
    select_music_track = function()
        return G.STAGE == G.STAGES.MAIN_MENU
    end,
})

SMODS.Sound({
    key = "music_zeus",
    path = "ie1_k_zeusblind.ogg",
    volume = 0.25,
    sync = {
        ina_music_mainline = true
    },
    pitch = 1,
    select_music_track = function()
        if G.GAME and G.GAME.blind and G.GAME.blind.name == "Zeus" then
            return true
        end
    end,
})

SMODS.Sound({
    key = "music_royal",
    path = "ie1_k_royalccademy.ogg",
    volume = 0.25,
    sync = {
        ina_music_mainline = true
    },
    pitch = 1,
    select_music_track = function()
        if G.GAME and G.GAME.blind and G.GAME.blind.name == "Royal Academy" then
            return true
        end
    end,
})

SMODS.Sound({
    key = "music_ultrazeus",
    path = "ie1_k_ultrazeusblind.ogg",
    volume = 0.25,
    sync = {
        ina_music_mainline = true
    },
    pitch = 1,
    select_music_track = function()
        if G.GAME and G.GAME.blind and G.GAME.blind.name == "ina-zeus_caido" then
            return true
        end
    end,
})

SMODS.Sound({
    key = "music_ogre",
    path = "ie3_k_ogroblind.ogg",
    volume = 0.25,
    sync = {
        ina_music_mainline = true
    },
    pitch = 1,
    select_music_track = function()
        if G.GAME and G.GAME.blind and G.GAME.blind.name == "ina-ogre" then
            return true
        end
    end,
})

-- Store mod path for direct audio access (Soundtown vertical remix)
Pokerleven.mod_path = SMODS.current_mod.path

local custom_colours = loc_colour
local top_rarity = SMODS.Gradient({
    key = 'topplayer2',
    colours = {
        HEX('e7b400'),
        HEX('df7500'),
    },
    cycle = 5,
    interpolation = 'trig'
})
local maxlvl = SMODS.Gradient({
    key = 'maxlvl',
    colours = {
        HEX('b30c00'),
        HEX('ffb200'),
    },
    cycle = 5,
    interpolation = 'trig'
})
local suits = SMODS.Gradient({
    key = 'suits',
    colours = {
        HEX('f03464'),
        HEX('235955'),
        HEX('f06b3f'),
        HEX('3c4368'),
    },
    cycle = 5,
    interpolation = 'trig'
})

local flag_jpn = SMODS.Gradient({
    key = 'ina_flag_JPN',
    colours = { HEX('ffffff'), HEX('bc002d') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_ita = SMODS.Gradient({
    key = 'ina_flag_ITA',
    colours = { HEX('008c45'), HEX('f4f5f0'), HEX('cd212a') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_bra = SMODS.Gradient({
    key = 'ina_flag_BRA',
    colours = { HEX('009739'), HEX('fedd00'), HEX('012169') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_arg = SMODS.Gradient({
    key = 'ina_flag_ARG',
    colours = { HEX('74acdf'), HEX('ffffff'), HEX('74acdf') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_usa = SMODS.Gradient({
    key = 'ina_flag_USA',
    colours = { HEX('b22234'), HEX('ffffff'), HEX('3c3b6e') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_eng = SMODS.Gradient({
    key = 'ina_flag_ENG',
    colours = { HEX('ffffff'), HEX('ce1124') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_esp = SMODS.Gradient({
    key = 'ina_flag_ESP',
    colours = { HEX('aa151b'), HEX('f1bf00'), HEX('aa151b') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_kor = SMODS.Gradient({
    key = 'ina_flag_KOR',
    colours = { HEX('ffffff'), HEX('cd2e3a'), HEX('0047a0') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_fra = SMODS.Gradient({
    key = 'ina_flag_FRA',
    colours = { HEX('002395'), HEX('ffffff'), HEX('ed2939') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_ger = SMODS.Gradient({
    key = 'ina_flag_GER',
    colours = { HEX('000000'), HEX('dd0000'), HEX('ffce00') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_aus = SMODS.Gradient({
    key = 'ina_flag_AUS',
    colours = { HEX('012169'), HEX('e8112d'), HEX('ffffff') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_qat = SMODS.Gradient({
    key = 'ina_flag_QAT',
    colours = { HEX('8d153a'), HEX('ffffff') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_rus = SMODS.Gradient({
    key = 'ina_flag_RUS',
    colours = { HEX('ffffff'), HEX('0039a6'), HEX('d52b1e') },
    cycle = 3,
    interpolation = 'trig'
})
local flag_mex = SMODS.Gradient({
    key = 'ina_flag_MEX',
    colours = { HEX('006847'), HEX('ffffff'), HEX('ce1126') },
    cycle = 3,
    interpolation = 'trig'
})
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        custom_colours()
    end
    G.ARGS.LOC_COLOURS["mountain"] = HEX("f57c00")
    G.ARGS.LOC_COLOURS["gk"] = HEX("ffa726")
    G.ARGS.LOC_COLOURS["fire"] = HEX("d32f2f")
    G.ARGS.LOC_COLOURS["fw"] = HEX("ef5350")
    G.ARGS.LOC_COLOURS["forest"] = HEX("2e7d32")
    G.ARGS.LOC_COLOURS["df"] = HEX("66bb6a")
    G.ARGS.LOC_COLOURS["wind"] = HEX("81d4fa")
    G.ARGS.LOC_COLOURS["mf"] = HEX("4fc3f7")
    -- === SAGA ORIGINAL (IE1) ===
    G.ARGS.LOC_COLOURS["ina_team_raimon"] = HEX("ffa726")
    G.ARGS.LOC_COLOURS["ina_team_occult"] = HEX("4B0082")
    G.ARGS.LOC_COLOURS["ina_team_royalacademy"] = HEX("2C5E4F")
    G.ARGS.LOC_COLOURS["ina_team_wild"] = HEX("797B49")
    G.ARGS.LOC_COLOURS["ina_team_brain"] = HEX("888888")
    G.ARGS.LOC_COLOURS["ina_team_otaku"] = HEX("A754C4")
    G.ARGS.LOC_COLOURS["ina_team_shuriken"] = HEX("4B0082")
    G.ARGS.LOC_COLOURS["ina_team_farm"] = HEX("7AC943")
    G.ARGS.LOC_COLOURS["ina_team_inazumaeleven"] = HEX("ffa726")
    G.ARGS.LOC_COLOURS["ina_team_kirkwood"] = HEX("7A5E3C")
    G.ARGS.LOC_COLOURS["ina_team_zeus"] = HEX("D4AF37")
    G.ARGS.LOC_COLOURS["ina_team_umbrella"] = HEX("2196F3")
    G.ARGS.LOC_COLOURS["ina_team_inazumakids"] = HEX("FFEB3B")
    G.ARGS.LOC_COLOURS["ina_team_sallys"] = HEX("E91E63")

    -- === SAGA ALIUS (IE2) ===
    G.ARGS.LOC_COLOURS["ina_team_tormentadegéminis"] = HEX("441D68")
    G.ARGS.LOC_COLOURS["ina_team_serviciosecreto"] = HEX("191919")
    G.ARGS.LOC_COLOURS["ina_team_alpino"] = HEX("89D5F5")
    G.ARGS.LOC_COLOURS["ina_team_epsilon"] = HEX("261B4A")
    G.ARGS.LOC_COLOURS["ina_team_royalredux"] = HEX("9B0000")
    G.ARGS.LOC_COLOURS["ina_team_emperadoresoscuros"] = HEX("1D043D")
    G.ARGS.LOC_COLOURS["ina_team_polvodediamantes"] = HEX("AEE2F2")
    G.ARGS.LOC_COLOURS["ina_team_prominence"] = HEX("E52200")
    G.ARGS.LOC_COLOURS["ina_team_claustrosagrado"] = HEX("754C11")
    G.ARGS.LOC_COLOURS["ina_team_osakaccc"] = HEX("E8458A")
    G.ARGS.LOC_COLOURS["ina_team_fauxshore"] = HEX("01426A")
    G.ARGS.LOC_COLOURS["ina_team_marytimes"] = HEX("1565C0")
    G.ARGS.LOC_COLOURS["ina_team_genesis"] = HEX("2E7D32")
    G.ARGS.LOC_COLOURS["ina_team_seaoftrees"] = HEX("1B5E20")
    G.ARGS.LOC_COLOURS["ina_team_younginazuma"] = HEX("F9A826")
    G.ARGS.LOC_COLOURS["pink"] = HEX("FF7ABF")

    -- === SAGA FFI (IE3) ===
    G.ARGS.LOC_COLOURS["ina_team_inazumajapon"] = HEX("fb8c00")
    G.ARGS.LOC_COLOURS["ina_team_knightsofqueen"] = HEX("E1F5FE")
    G.ARGS.LOC_COLOURS["ina_team_bigwaves"] = HEX("00BCD4")
    G.ARGS.LOC_COLOURS["ina_team_desertlion"] = HEX("FFB300")
    G.ARGS.LOC_COLOURS["ina_team_neojapan"] = HEX("B71C1C")
    G.ARGS.LOC_COLOURS["ina_team_firedragon"] = HEX("D32F2F")
    G.ARGS.LOC_COLOURS["ina_team_brockenbrigade"] = HEX("2E7D32")
    G.ARGS.LOC_COLOURS["ina_team_rosegryphon"] = HEX("1976D2")
    G.ARGS.LOC_COLOURS["ina_team_redmatadors"] = HEX("D32F2F")
    G.ARGS.LOC_COLOURS["ina_team_teamd"] = HEX("4527A0")
    G.ARGS.LOC_COLOURS["ina_team_theempire"] = HEX("0277BD")
    G.ARGS.LOC_COLOURS["ina_team_unicorn"] = HEX("1E88E5")
    G.ARGS.LOC_COLOURS["ina_team_orpheus"] = HEX("1565C0")
    G.ARGS.LOC_COLOURS["ina_team_teamzoolan"] = HEX("212121")
    G.ARGS.LOC_COLOURS["ina_team_thekingdom"] = HEX("FDD835")
    G.ARGS.LOC_COLOURS["ina_team_littlegigant"] = HEX("C62828")
    G.ARGS.LOC_COLOURS["ina_team_ogre"] = HEX("37474F")
    G.ARGS.LOC_COLOURS["ina_team_skyteam"] = HEX("B3E5FC")
    G.ARGS.LOC_COLOURS["ina_team_darkteam"] = HEX("4A148C")
    G.ARGS.LOC_COLOURS["ina_team_capecrusaders"] = HEX("FFCA28")

    -- === SAGA GO ===
    G.ARGS.LOC_COLOURS["ina_team_raimongo"] = HEX("FFA000")
    G.ARGS.LOC_COLOURS["ina_team_orderofblacktemplars"] = HEX("212121")
    G.ARGS.LOC_COLOURS["ina_team_mirageacademy"] = HEX("7E57C2")
    G.ARGS.LOC_COLOURS["ina_team_universal"] = HEX("0288D1")
    G.ARGS.LOC_COLOURS["ina_team_mountolympus"] = HEX("FFFFFF")
    G.ARGS.LOC_COLOURS["ina_team_dragonlink"] = HEX("455A64")
    G.ARGS.LOC_COLOURS["ina_team_eternallight"] = HEX("FFF176")
    G.ARGS.LOC_COLOURS["ina_team_ancientdark"] = HEX("311B92")

    -- === SAGA CHRONO STONE / GALAXY ===
    G.ARGS.LOC_COLOURS["ina_team_arions"] = HEX("81D4FA")
    G.ARGS.LOC_COLOURS["ina_team_protocolomega"] = HEX("0D47A1")
    G.ARGS.LOC_COLOURS["ina_team_protocolomega2"] = HEX("1565C0")
    G.ARGS.LOC_COLOURS["ina_team_protocolomega3"] = HEX("1976D2")
    G.ARGS.LOC_COLOURS["ina_team_footballbots"] = HEX("9E9E9E")
    G.ARGS.LOC_COLOURS["ina_team_whitedeer"] = HEX("795548")
    G.ARGS.LOC_COLOURS["ina_team_terracottaarmy"] = HEX("A1887F")
    G.ARGS.LOC_COLOURS["ina_team_zanarkdomain"] = HEX("BF360C")
    G.ARGS.LOC_COLOURS["ina_team_perfectcascade"] = HEX("E0E0E0")
    G.ARGS.LOC_COLOURS["ina_team_zan"] = HEX("424242")
    G.ARGS.LOC_COLOURS["ina_team_gir"] = HEX("616161")
    G.ARGS.LOC_COLOURS["ina_team_gar"] = HEX("757575")
    G.ARGS.LOC_COLOURS["ina_team_chronostorm"] = HEX("FFD54F")
    G.ARGS.LOC_COLOURS["ina_team_ragnah"] = HEX("263238")
    G.ARGS.LOC_COLOURS["ina_team_nosfanatica"] = HEX("880E4F")
    G.ARGS.LOC_COLOURS["ina_team_aullidolunar"] = HEX("78909C")
    G.ARGS.LOC_COLOURS["ina_team_eartheleven"] = HEX("2196F3")
    G.ARGS.LOC_COLOURS["ina_team_zanarkoutsiders"] = HEX("D84315")

    -- === SAGA ARES / ORION ===
    G.ARGS.LOC_COLOURS["ina_team_zeus_ares"] = HEX("E0CD36")
    G.ARGS.LOC_COLOURS["ina_team_eiseigakuen"] = HEX("2E4347")
    G.ARGS.LOC_COLOURS["ina_team_inakuniraimon"] = HEX("F9A826")
    G.ARGS.LOC_COLOURS["ina_team_barcelonaorb"] = HEX("9C27B0")
    G.ARGS.LOC_COLOURS["ina_team_bastion"] = HEX("4E342E")
    G.ARGS.LOC_COLOURS["ina_team_ribera"] = HEX("0097A7")
    G.ARGS.LOC_COLOURS["ina_team_lunarprime"] = HEX("FFAB91")
    G.ARGS.LOC_COLOURS["ina_team_inazumajaponorion"] = HEX("0277BD")
    G.ARGS.LOC_COLOURS["ina_team_redbison"] = HEX("C62828")
    G.ARGS.LOC_COLOURS["ina_team_shiningsatans"] = HEX("6A1B9A")
    G.ARGS.LOC_COLOURS["ina_team_eternaldancers"] = HEX("00838F")
    G.ARGS.LOC_COLOURS["ina_team_avengingacrobats"] = HEX("AD1457")
    G.ARGS.LOC_COLOURS["ina_team_mutekinogiant"] = HEX("2E7D32")
    G.ARGS.LOC_COLOURS["ina_team_navyinvaders"] = HEX("1A237E")
    G.ARGS.LOC_COLOURS["ina_team_oledesamba"] = HEX("FBC02D")
    G.ARGS.LOC_COLOURS["ina_team_guardiansofqueen"] = HEX("00BCD4")
    G.ARGS.LOC_COLOURS["ina_team_perfectspark"] = HEX("B3E5FC")
    G.ARGS.LOC_COLOURS["ina_team_shadowoforion"] = HEX("212121")

    -- === VICTORY ROAD / OTHERS ===
    G.ARGS.LOC_COLOURS["ina_team_nagumohara"] = HEX("FF7043")
    G.ARGS.LOC_COLOURS["ina_team_westmanor"] = HEX("7CB342")
    G.ARGS.LOC_COLOURS["ina_team_orchid"] = HEX("EC407A")
    G.ARGS.LOC_COLOURS["ina_team_northbright"] = HEX("26A69A")
    G.ARGS.LOC_COLOURS["ina_team_eastwind"] = HEX("42A5F5")
    G.ARGS.LOC_COLOURS["ina_team_stormridge"] = HEX("5C6BC0")
    G.ARGS.LOC_COLOURS["ina_team_solariazeus"] = HEX("FFEE58")
    G.ARGS.LOC_COLOURS["ina_team_vestiges"] = HEX("78909C")
    G.ARGS.LOC_COLOURS["ina_team_winners"] = HEX("FFD54F")
    G.ARGS.LOC_COLOURS["ina_team_scout"] = HEX("546E7A")


    G.ARGS.LOC_COLOURS["bench"] = HEX("4ca0a5")
    G.ARGS.LOC_COLOURS["training"] = HEX("5A00FF")
    G.ARGS.LOC_COLOURS["strat"] = HEX("9AA4B7")
    G.ARGS.LOC_COLOURS["top"] = top_rarity
    G.ARGS.LOC_COLOURS["maxlvl"] = maxlvl
    G.ARGS.LOC_COLOURS["suits"] = suits


    return custom_colours(_c, _default)
end
