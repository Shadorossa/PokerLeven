-- ══════════════════════════════════════════════════
-- Joker Music System (reusable for any joker)
-- ══════════════════════════════════════════════════

--- Check if we are currently in a blind (not shop, not menu)
---@return boolean
Pokerleven.is_in_blind = function()
    return G.STATE and (G.STATE == G.STATES.SELECTING_HAND
        or G.STATE == G.STATES.HAND_PLAYED
        or G.STATE == G.STATES.DRAW_TO_HAND
        or G.STATE == G.STATES.PLAY_TAROT)
end

--- Set a joker music flag in G.GAME
---@param key string The flag key
---@param value any The value to set (nil to clear)
Pokerleven.set_joker_music = function(key, value)
    if G.GAME then
        G.GAME[key] = value
    end
end

-- ══════════════════════════════════════════════════
-- Soundtown Vertical Remix (Love2D direct audio)
-- All 3 tracks play simultaneously, only volumes change
-- ══════════════════════════════════════════════════

Pokerleven._soundtown = {
    sources = nil,
    active = false,
    current_tuning = 1
}

--- Get current music volume from settings (0 to 1)
local function _st_get_vol()
    local v = (G.SETTINGS.SOUND and G.SETTINGS.SOUND.music_volume) or G.SETTINGS.music_volume or 50
    return v / 100 * 0.5
end

--- Load the 3 audio sources (lazy, only once)
Pokerleven.soundtown_load = function()
    if Pokerleven._soundtown.sources then return true end
    local base = (Pokerleven.mod_path or "") .. "assets/sounds/"
    local files = {
        [0] = base .. "ie2_Soundtown_W.ogg",
        [1] = base .. "ie2_Soundtown_M.ogg",
        [2] = base .. "ie2_Soundtown_S.ogg"
    }
    Pokerleven._soundtown.sources = {}
    for i = 0, 2 do
        local ok, src = pcall(love.audio.newSource, files[i], "stream")
        if ok and src then
            src:setLooping(true)
            src:setVolume(0)
            Pokerleven._soundtown.sources[i] = src
        end
    end
    return true
end

--- Start all 3 tracks playing simultaneously
---@param tuning number Initial tuning (0/1/2)
Pokerleven.soundtown_start = function(tuning)
    local st = Pokerleven._soundtown
    Pokerleven.soundtown_load()
    if not st.sources then return end

    tuning = tuning or 1
    st.current_tuning = tuning
    local vol = _st_get_vol()

    for i = 0, 2 do
        if st.sources[i] then
            st.sources[i]:setVolume(i == tuning and vol or 0)
            if not st.sources[i]:isPlaying() then
                st.sources[i]:play()
            end
        end
    end
    st.active = true
end

--- Stop all 3 tracks
Pokerleven.soundtown_stop = function()
    local st = Pokerleven._soundtown
    if st.sources then
        for i = 0, 2 do
            if st.sources[i] and st.sources[i]:isPlaying() then
                st.sources[i]:stop()
            end
        end
    end
    st.active = false
end

--- Crossfade to a new tuning level (smooth transition ~1s)
---@param new_tuning number Target tuning (0/1/2)
Pokerleven.soundtown_set_tuning = function(new_tuning)
    local st = Pokerleven._soundtown
    if not st.active or not st.sources then return end
    if st.current_tuning == new_tuning then return end

    local old = st.current_tuning
    st.current_tuning = new_tuning
    local vol = _st_get_vol()

    local steps = 20
    for i = 1, steps do
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.05,
            func = function()
                local ratio = i / steps
                if st.sources[old] then
                    st.sources[old]:setVolume((1 - ratio) * vol)
                end
                if st.sources[new_tuning] then
                    st.sources[new_tuning]:setVolume(ratio * vol)
                end
                return true
            end
        }))
    end
end
