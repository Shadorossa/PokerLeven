C = {}

-- Seals
C.SEALS = { 'Blue', 'Red', 'Gold', 'Purple' }

-- Types
C.ALL_TYPES = { "Wind", "Fire", "Forest", "Mountain" }
C.Wind = C.ALL_TYPES[1]
C.Fire = C.ALL_TYPES[2]
C.Forest = C.ALL_TYPES[3]
C.Mountain = C.ALL_TYPES[4]

C.STICKERS = {}
C.STICKERS.types = { "wind_sticker", "fire_sticker", "forest_sticker", "mountain_sticker" }
C.STICKERS.positions = { "fw_sticker", "mf_sticker", "gk_sticker", "df_sticker" }

-- Positions
C.ALL_POSITIONS = { "FW", "MF", "DF", "GK" }
C.FW = C.ALL_POSITIONS[1]
C.MF = C.ALL_POSITIONS[2]
C.DF = C.ALL_POSITIONS[3]
C.GK = C.ALL_POSITIONS[4]

-- Genders
C.ALL_GENDERS = { "M", "F" }
C.M = C.ALL_GENDERS[1]
C.F = C.ALL_GENDERS[2]

-- Nationalities
C.ALL_NATIONS = { "Italy", "Spain", "France", "Japan", "Korea", "Australia", "USA", "Brazil", "Russia", "Argentina", "Germany", "England", "Uzbekistan" }
C.ITALY = C.ALL_NATIONS[1]
C.SPAIN = C.ALL_NATIONS[2]
C.FRANCE = C.ALL_NATIONS[3]
C.JAPAN = C.ALL_NATIONS[4]
C.KOREA = C.ALL_NATIONS[5]
C.AUSTRALIA = C.ALL_NATIONS[6]
C.USA = C.ALL_NATIONS[7]
C.BRAZIL = C.ALL_NATIONS[8]
C.RUSSIA = C.ALL_NATIONS[9]
C.ARGENTINA = C.ALL_NATIONS[10]
C.GERMANY = C.ALL_NATIONS[11]
C.ENGLAND = C.ALL_NATIONS[12]
C.UZBEKISTAN = C.ALL_NATIONS[13]
C.UNKNOWN = "UNKNOWN"

-- Captain
C.CAPTAIN = true

-- Dictionary
C.TRAINING = "Training"
C.STRAT = "Strat"
C.INA_UPGRADE_TECHNIQUE_KEY = "c_ina_upgrade_technique_"

-- Overridable
C.MAX_HIGHLIGHTED_MAGICIAN = 2

-- School Years
C.YEARS = { "1st year", "2nd year", "3rd year", "Adult" }
C.YEAR_1 = C.YEARS[1]
C.YEAR_2 = C.YEARS[2]
C.YEAR_3 = C.YEARS[3]
C.ADULT = C.YEARS[4]
C.YEAR_UNKNOWN = "UNKNOWN"

-- Upgrades
C.UPGRADES = { "plus", "number", "grade", "spirit" }
C.UPGRADES.Plus = C.UPGRADES[1]
C.UPGRADES.Number = C.UPGRADES[2]
C.UPGRADES.Grade = C.UPGRADES[3]
C.UPGRADES.Spirit = C.UPGRADES[4]
C.UPGRADES.NumberType = {}
C.UPGRADES.NumberType.A = "ina_tech_numbera_sticker"
C.UPGRADES.NumberType.S = "ina_tech_numbers_sticker"
C.UPGRADES.NumberType.Z = "ina_tech_numberz_sticker"

--- For specific jokers
C.CUSTOM = {}
C.CUSTOM.Bobby_Teams = {
    ["ina_team_Raimon"]        = { x = 0, y = 0 },
    ["ina_team_RoyalAcademy"]  = { x = 1, y = 0 },
    ["ina_team_Occult"]        = { x = 5, y = 0 },
    ["ina_team_Wild"]          = { x = 6, y = 0 },
    ["ina_team_Brain"]         = { x = 7, y = 0 },
    ["ina_team_Otaku"]         = { x = 8, y = 0 },
    ["ina_team_InazumaEleven"] = { x = 9, y = 0 },
    ["ina_team_Shuriken"]      = { x = 10, y = 0 },
    ["ina_team_Farm"]          = { x = 11, y = 0 },
    ["ina_team_Kirkwood"]      = { x = 12, y = 0 },
    ["ina_team_Zeus"]          = { x = 0, y = 1 }
}

local team_number = 0
for _ in pairs(C.CUSTOM.Bobby_Teams) do
    team_number = team_number + 1
end
C.CUSTOM.Bobby_Teams_Number = team_number

C.ELEMENTALS_KEYS = { j_ina_Weathervane = true, j_ina_Noggin = true, j_ina_Montayne = true, j_ina_Blazer = true }

--- FOR GENERAL CREDITS
C.CREDITS = {}
C.CREDITS.lead = 'Deco'
C.CREDITS.developers = 'Synkro, Izan'
C.CREDITS.graphic = 'Shadorossa, Synkro'
