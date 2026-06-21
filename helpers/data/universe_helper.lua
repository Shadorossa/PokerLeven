Pokerleven.Universe = {
    eris_active = false,
    active_realities = { ["Base"] = true },
    realities = {
        Base = { teams = {} },
        Ares = { teams = { ["ina_team_Zeus_Ares"] = true, ["ina_team_EiseiGakuen"] = true, ["ina_team_InakuniRaimon"] = true } },
        Ogre = { teams = {}, blinds = { ["bl_ina_ogre"] = 1 } },
        Corrupta = {
            teams = { ["ina_team_EmperadoresOscuros"] = true, ["ina_team_RoyalRedux"] = true },
            is_corrupt = true
        }
    },

    update_eris_state = function()
        local act = false
        for _, area in ipairs({G.jokers, Pokerleven.ina_spirits_area}) do
            if area and area.cards then for _, v in ipairs(area.cards) do if v.ability and v.ability.eris_active then act = true; break end end end
        end
        Pokerleven.Universe.eris_active = act
    end,

    is_reality_active = function(r_name)
        local u = Pokerleven.Universe
        if u.eris_active or u.active_realities[r_name] then return true end
        return r_name == "Corrupta" and G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers["v_ina_modified_player"]
    end,

    get_team_reality = function(t_name)
        if not t_name then return "Base" end
        for r_name, data in pairs(Pokerleven.Universe.realities) do if data.teams[t_name] then return r_name end end
        return "Base"
    end,

    is_joker_allowed = function(center)
        if not center.pteam then return true end
        local u = Pokerleven.Universe

        if u.eris_active and not u.realities.Corrupta.teams[center.pteam] then
            for _, f in ipairs(family) do
                local has_c, is_in = false, false
                for _, fn in ipairs(f) do
                    if "j_ina_"..fn == center.key then is_in = true end
                    if string.find(fn, "Dark") or string.find(fn, "R$") then has_c = true end
                end
                if is_in and has_c then return false end
            end
        end
        return u.is_reality_active(u.get_team_reality(center.pteam))
    end,

    get_blind_chance = function(b_key)
        local max_c, u = 0, Pokerleven.Universe
        for r_name, data in pairs(u.realities) do
            if u.is_reality_active(r_name) and data.blinds and data.blinds[b_key] then max_c = math.max(max_c, data.blinds[b_key]) end
        end
        return max_c
    end,

    is_blind_allowed_in_slot = function(v, slot_type, ante)
        local act = Pokerleven.Universe.eris_active
        local can = (slot_type == "Small" and (v.small or (act and (v.big or v.boss)))) or (slot_type == "Big" and (v.big or (act and v.boss)))
        if not can then return false end
        if act then return true end
        if type(v.in_pool) == 'function' then return v:in_pool() and true or false end
        if v.boss and not v.small and not v.big then
            local w_a = G.GAME and G.GAME.win_ante or 8
            return (not v.boss.showdown and v.boss.min <= ante and (ante % w_a ~= 0 or ante < 2)) or (v.boss.showdown and ante % w_a == 0 and ante >= 2)
        end
        return ((v.small and v.small.min) or (v.big and v.big.min) or 0) <= ante
    end
}
