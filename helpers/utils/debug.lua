LeakScope = {
  last = { mem = 0, events = 0, jokers = 0, cards = 0 },
}

local function count_events()
  return G and G.E_MANAGER and G.E_MANAGER.events and #G.E_MANAGER.events or 0
end

local function count_jokers()
  return (G and G.jokers and G.jokers.cards) and #G.jokers.cards or 0
end

local function count_all_cards()
  local n = 0
  local buckets = { G.hand, G.deck, G.discard, G.jokers, G.consumeables, G.play }
  for _, area in ipairs(buckets) do
    if area and area.cards then n = n + #area.cards end
  end
  return n
end

function LeakScope.snap(tag)
  collectgarbage("collect")
  local mem = collectgarbage("count")
  local ev  = count_events()
  local jok = count_jokers()
  local car = count_all_cards()
  print(string.format("[LeakScope] %s | mem: %.1f KB (Δ%.1f) | events: %d (Δ%d) | jokers: %d | cards: %d",
    tag, mem, mem - LeakScope.last.mem, ev, ev - LeakScope.last.events, jok, car))
  LeakScope.last = { mem = mem, events = ev, jokers = jok, cards = car }
end
