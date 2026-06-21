local filtered = {}
for _, ch in ipairs(G.CHALLENGES) do
    if ch.original_mod and ch.original_mod.id == "Pokerleven" then
        table.insert(filtered, ch)
    end
end

local _set_challenge_unlock = set_challenge_unlock
function set_challenge_unlock()
    if G.PROFILES[G.SETTINGS.profile].all_unlocked then return end
    if G.PROFILES[G.SETTINGS.profile].challenges_unlocked then
        local _ch_comp, _ch_tot = 0, #G.CHALLENGES
        for k, v in ipairs(G.CHALLENGES) do
            if v.id and G.PROFILES[G.SETTINGS.profile].challenge_progress.completed[v.id or ''] then
                _ch_comp = _ch_comp + 1
            end
        end
        G.PROFILES[G.SETTINGS.profile].challenges_unlocked = math.min(_ch_tot, _ch_comp + 4)
    else
        local deck_wins = 0
        for k, v in pairs(G.PROFILES[G.SETTINGS.profile].deck_usage) do
            if v.wins and v.wins[1] then
                deck_wins = deck_wins + 1
            end
        end
        if (deck_wins + 1) >= G.CHALLENGE_WINS and not G.PROFILES[G.SETTINGS.profile].challenges_unlocked then
            G.PROFILES[G.SETTINGS.profile].challenges_unlocked = 4
            notify_alert('b_challenge', "Back")
        end
    end
end

G.CHALLENGES = filtered
G.CHALLENGE_WINS = 2
