-- Normalises player card definitions before SMODS.Joker registration.
-- Called by load_joker_folder in Pokerleven.lua for every item in a player file.
process_joker_item = function(item)
  if not item.discovered then
    item.discovered = false
  end
  item.key = item.key or item.name

  item.config = item.config or {}
  item.config.extra = item.config.extra or {}

  if item.ptype         then item.config.extra.ptype         = item.ptype         end
  if item.pposition     then item.config.extra.pposition     = item.pposition     end
  if item.pteam         then item.config.extra.pteam         = item.pteam         end
  if item.pteam_concept then item.config.extra.pteam_concept = item.pteam_concept end
  if item.special       then item.config.extra.special       = item.special
                              item.special_type              = item.special        end
  if item.no_training   then item.config.extra.no_training   = item.no_training
                              item.config.extra.tech_level   = 1                  end
  if item.techtype        then item.config.extra.techtype        = item.techtype        end
  if item.numberTechType  then item.config.extra.numberTechType  = item.numberTechType  end
  if item.pdorsal         then item.config.extra.pdorsal         = item.pdorsal         end
  if item.pgender         then item.config.extra.pgender         = item.pgender         end
  if item.pnation         then item.config.extra.pnation         = item.pnation         end
  if item.pyear           then item.config.extra.pyear           = item.pyear           end

  if not item.custom_pool_func then
    item.in_pool = function(self)
      return player_in_pool(self)
    end
  end

  item.generate_ui = Pokerleven.generate_info_ui
  item.set_badges  = ina_set_badges
end
