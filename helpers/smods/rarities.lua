SMODS.Rarity({
  key = "top",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'topplayer',
    colours = {
      HEX('e7b400'),
      HEX('df7500'),
    },
    cycle = 5,
    interpolation = 'trig'
  }),
  default_weight = 0.01,
  get_weight = function(self, weight, object_type)
    return weight
  end,
  pools = { ["Joker"] = true },
})

SMODS.Rarity({
  key = "winner",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'winnerplayer',
    colours = {
      HEX('937d3e'),
      HEX('e4ce8f'),
    },
    cycle = 5,
    interpolation = 'trig'
  }),
  default_weight = 0.01,
  get_weight = function(self, weight, object_type)
    return weight
  end,
  pools = { ["Joker"] = true },
})

SMODS.Rarity({
  key = "vestige",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'vestigeplayer',
    colours = {
      HEX('7A5E3C'),
      HEX('B7865B'),
    },
    cycle = 5,
    interpolation = 'trig'
  }),
  default_weight = 0.01,
  get_weight = function(self, weight, object_type) return weight end,
  pools = { ["Joker"] = true },
})

SMODS.Sticker:take_ownership("eternal", {
  atlas = "stickers",
  pos = { x = 9, y = 3 },
  prefix_config = { key = false },
})

SMODS.Sticker:take_ownership("perishable", {
  atlas = "stickers",
  pos = { x = 10, y = 3 },
  prefix_config = { key = false },
})

SMODS.Sticker:take_ownership("rental", {
  atlas = "stickers",
  pos = { x = 11, y = 3 },
  prefix_config = { key = false },
})
