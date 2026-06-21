---@diagnostic disable: cast-local-type
ina_set_badges = function(self, card, badges)
    local pteam = get_team(card)
    local text_colour = G.C.WHITE
    if pteam then
        local lower_pteam = string.lower(pteam)
        local loc_team = localize(pteam, 'teams')
        if loc_team == 'ERROR' then loc_team = pteam end

        -- Seguridad: Si G.ARGS o LOC_COLOURS no existen (pasa a veces al arrancar), usamos un color gris por defecto
        local badge_colour = G.C.GREY
        if G.ARGS and G.ARGS.LOC_COLOURS and G.ARGS.LOC_COLOURS[lower_pteam] then
            badge_colour = G.ARGS.LOC_COLOURS[lower_pteam]
        end

        badges[#badges + 1] = create_badge(loc_team, badge_colour, text_colour, 1.2)
    end
    if card.ability and card.ability.ina_small_sticker then
        local sticker_key = card.ability.ina_small_sticker
        local center = G.P_CENTERS[sticker_key] or (SMODS.Stickers and SMODS.Stickers[sticker_key])
        local color = center and center.badge_colour or G.C.PURPLE
        badges[#badges + 1] = create_badge(localize(sticker_key, "labels"), color, text_colour, 1.2)
    end
end

type_tooltip = function(self, info_queue, center)
    local percent
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.ptype then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.ptype }
    end
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.pposition then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.pposition }
    end
end

apply_property_sticker = function(card, sticker_type, property)
    local inateam_list = { "Forest", "Fire", "Wind", "Mountain" }
    local inaposition_list = { "FW", "DF", "MF", "GK" }
    local apply_type = nil

    if sticker_type then
        apply_type = sticker_type
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    else
        if property == "type" then
            options = {}
            for _, t in ipairs(inateam_list) do
                if t ~= card.ability.extra.ptype then
                    table.insert(options, t)
                end
            end
            apply_type = pseudorandom_element(options, pseudoseed("type"))
        elseif property == "position" then
            options = {}
            for _, p in ipairs(inaposition_list) do
                if p ~= card.ability.extra.pposition then
                    table.insert(options, p)
                end
            end
            apply_type = pseudorandom_element(options, pseudoseed("position"))
        end
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    end

    if property == "type" then
        for _, v in pairs(inateam_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "position" then
        for l, v in pairs(inaposition_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "type" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.ptype then
            card.ability.extra.ptype = apply_type
        end
    end

    if property == "position" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.pposition then
            card.ability.extra.pposition = apply_type
        end
    end
end

-- CREDITS
local base_create_badges = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    base_create_badges(obj, badges)

    if obj and obj.ina_credits then
        local function calc_scale_fac(text)
            local size = 0.9
            local font = G.LANG.font
            local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
            local calced_text_width = 0
            for _, c in utf8.chars(text) do
                ---@diagnostic disable-next-line: undefined-field
                local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
                    ---@diagnostic disable-next-line: undefined-field
                    + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
                calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
            end
            return calced_text_width > max_text_width and max_text_width / calced_text_width or 1
        end

        local strings = { "Pokerleven" }

        if obj.ina_credits.idea then
            for i = 1, #obj.ina_credits.idea do
                localized = localize({ type = "variable", key = "ina_idea", vars = { obj.ina_credits.idea[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        if obj.ina_credits.art then
            for i = 1, #obj.ina_credits.art do
                localized = localize({ type = "variable", key = "ina_art", vars = { obj.ina_credits.art[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        if obj.ina_credits.code then
            for i = 1, #obj.ina_credits.code do
                localized = localize({ type = "variable", key = "ina_code", vars = { obj.ina_credits.code[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        local scale_fac = {}
        local min_scale_fac = 1
        for i = 1, #strings do
            scale_fac[i] = calc_scale_fac(strings[i])
            min_scale_fac = math.min(min_scale_fac, scale_fac[i])
        end

        local ct = {}
        for i = 1, #strings do
            ct[i] = { string = strings[i] }
        end

        local badge = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        colour = G.C.RED,
                        r = 0.1,
                        minw = 2 / min_scale_fac,
                        minh = 0.36,
                        emboss = 0.05,
                        padding = 0.03 * 0.9,
                    },
                    nodes = {
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = ct,
                                    colours = { obj.ina_credits.text_colour or G.C.WHITE },
                                    silent = true,
                                    float = true,
                                    shadow = true,
                                    offset_y = -0.03,
                                    spacing = 1,
                                    scale = 0.33 * 0.9,
                                }),
                            },
                        },
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                    },
                },
            },
        }

        badges[#badges] = badge
    end
end
