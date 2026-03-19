-- Joseph King
local KingR = {
  name = "KingR",
  pos = { x = 9, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Beltzer
local Beltzer = {
  name = "Beltzer",
  pos = { x = 10, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Blade
local Blade = {
  name = "Blade",
  pos = { x = 11, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Argie
local Argie = {
  name = "Argie",
  pos = { x = 12, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Bamboo
local Bamboo = {
  name = "Bamboo",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Messer
local Messer = {
  name = "Messer",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Spark
local Spark = {
  name = "Spark",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Sparrow
local Sparrow = {
  name = "Sparrow",
  pos = { x = 3, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Jamm
local Jamm = J({
  name = "Jamm",
  pos = { x = 4, y = 7 },
  config = { extra = { xmult = 1.25 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card then
                local is_target = not card.debuff and (is_type(v, C.Mountain) or is_type(v, C.Wind))
                if is_target then
                    v.jamm_debuffed = true
                    if not v.debuff then v:set_debuff(true) end
                elseif v.jamm_debuffed then
                    v.jamm_debuffed = nil
                    v:set_debuff(false)
                end
            end
        end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.jamm_debuffed then v.jamm_debuffed = nil; v:set_debuff(false) end
        end
    end
  end,
  calculate = function(self, card, context)
    if context.other_joker and context.other_joker ~= card and not card.debuff and not context.other_joker.debuff 
    and (is_type(context.other_joker, C.Fire) or is_type(context.other_joker, C.Forest)) then
        G.E_MANAGER:add_event(Event({func = function() context.other_joker:juice_up(0.5, 0.5); return true end}))
        return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            Xmult_mod = card.ability.extra.xmult
        }
    end
  end
})

-- Caleb Stonewall
local CalebR = {
  name = "CalebR",
  pos = { x = 5, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- David Samford
local SamfordR = {
  name = "SamfordR",
  pos = { x = 6, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Cellar
local Cellar = {
  name = "Cellar",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Zenn
local Zenn = {
  name = "Zenn",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Little
local Little = {
  name = "Little",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Cossimo
local Cossimo = {
  name = "Cossimo",
  pos = { x = 10, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Color
local Color = {
  name = "Color",
  pos = { x = 11, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
    name = "Royal Redux",
    list = { Jamm }
    -- list = { Beltzer, Blade, Argie, Bamboo, Messer, Spark, Sparrow, Jamm, CalebR, SamfordR, Cellar, Zenn, Little, Cosimo, Color },
}