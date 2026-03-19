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

return {
    name = "Royal Redux",
    list = { Jamm }
}
