Pokerleven.formations = {
  -- Pachanga (5 players)
  ["1-2-1"] = { "GK", "DF", "MF", "MF", "FW" },
  ["2-1-1"] = { "GK", "DF", "DF", "MF", "FW" },
  ["1-1-2"] = { "GK", "DF", "MF", "FW", "FW" },
  ["0-2-2"] = { "GK", "MF", "MF", "FW", "FW" },

  -- Partido (11 players)
  ["4-3-3"] = { "GK", "DF", "DF", "DF", "DF", "MF", "MF", "MF", "FW", "FW", "FW" },
  ["4-4-2"] = { "GK", "DF", "DF", "DF", "DF", "MF", "MF", "MF", "MF", "FW", "FW" },
  ["3-5-2"] = { "GK", "DF", "DF", "DF", "MF", "MF", "MF", "MF", "MF", "FW", "FW" },
  ["4-2-3-1"] = { "GK", "DF", "DF", "DF", "DF", "MF", "MF", "MF", "MF", "MF", "FW" },
}

Pokerleven.formation_links = {
  -- Pachanga (5 players)
  ["1-2-1"] = { {1, 2}, {2, 3}, {2, 4}, {3, 4}, {3, 5}, {4, 5} },
  ["2-1-1"] = { {1, 2}, {1, 3}, {2, 3}, {2, 4}, {3, 4}, {4, 5} },
  ["1-1-2"] = { {1, 2}, {2, 3}, {3, 4}, {3, 5}, {4, 5} },
  ["0-2-2"] = { {1, 2}, {1, 3}, {2, 3}, {2, 4}, {3, 5}, {4, 5} },

  -- Partido (11 players)
  ["4-3-3"] = { 
    {1, 3}, {1, 4}, -- GK to CBs
    {2, 3}, {2, 6}, -- LB to LCB, LCM
    {3, 4}, {3, 6}, {3, 7}, -- LCB to RCB, LCM, CM
    {4, 5}, {4, 7}, {4, 8}, -- RCB to RB, CM, RCM
    {5, 8}, -- RB to RCM
    {6, 7}, {6, 9}, {6, 10}, -- LCM to CM, LW, ST
    {7, 8}, {7, 10}, -- CM to RCM, ST
    {8, 11}, {8, 10}, -- RCM to RW, ST
    {9, 10}, {11, 10} -- Wingers to ST
  },
  ["4-4-2"] = {
    {1, 3}, {1, 4}, -- GK to CBs
    {2, 3}, {2, 6}, -- LB to LCB, LM
    {3, 4}, {3, 7}, -- LCB to RCB, LCM
    {4, 5}, {4, 8}, -- RCB to RB, RCM
    {5, 9}, -- RB to RM
    {6, 7}, {6, 10}, -- LM to LCM, LS
    {7, 8}, {7, 10}, -- LCM to RCM, LS
    {8, 9}, {8, 11}, -- RCM to RM, RS
    {9, 11}, {10, 11} -- RM to RS, LS to RS
  },
  ["3-5-2"] = {
    {1, 2}, {1, 3}, {1, 4}, -- GK to CBs
    {2, 3}, {2, 5}, {2, 6}, -- LCB to CB, LWB, LCM
    {3, 4}, {3, 7}, -- CB to RCB, CM
    {4, 9}, {4, 8}, -- RCB to RWB, RCM
    {5, 6}, {5, 10}, -- LWB to LCM, LS
    {6, 7}, {6, 10}, -- LCM to CM, LS
    {7, 8}, {7, 10}, {7, 11}, -- CM to RCM, LS, RS
    {8, 9}, {8, 11}, -- RCM to RWB, RS
    {9, 11}, {10, 11} -- RWB to RS, LS to RS
  },
  ["4-2-3-1"] = {
    {1, 3}, {1, 4}, -- GK to CBs
    {2, 3}, {2, 6}, {2, 8}, -- LB to LCB, LDMF, LAM
    {3, 4}, {3, 6}, -- LCB to RCB, LDMF
    {4, 5}, {4, 7}, -- RCB to RB, RDMF
    {5, 7}, {5, 10}, -- RB to RDMF, RAM
    {6, 7}, {6, 8}, {6, 9}, -- LDMF to RDMF, LAM, CAM
    {7, 9}, {7, 10}, -- RDMF to CAM, RAM
    {8, 9}, {8, 11}, -- LAM to CAM, ST
    {9, 10}, {9, 11}, -- CAM to RAM, ST
    {10, 11} -- RAM to ST
  }
}

Pokerleven.formation_layouts = {
  -- Pachanga (5 players)
  ["1-2-1"] = { { 5 }, { 3, 4 }, { 2 }, { 1 } },
  ["2-1-1"] = { { 5 }, { 4 }, { 2, 3 }, { 1 } },
  ["1-1-2"] = { { 4, 5 }, { 3 }, { 2 }, { 1 } },
  ["0-2-2"] = { { 4, 5 }, { 2, 3 }, {}, { 1 } },

  -- Partido (11 players)
  ["4-3-3"] = {
    { 9, 10, 11 }, -- LW, ST, RW
    { 6, 7, 8 },   -- LCM, CM, RCM
    { 2, 3, 4, 5 }, -- LB, LCB, RCB, RB
    { 1 }           -- GK
  },
  ["4-4-2"] = {
    { 10, 11 },
    { 6, 7, 8, 9 },
    { 2, 3, 4, 5 },
    { 1 }
  },
  ["3-5-2"] = {
    { 10, 11 },
    { 5, 6, 7, 8, 9 },
    { 2, 3, 4 },
    { 1 }
  },
  ["4-2-3-1"] = {
    { 11 },          -- ST
    { 8, 9, 10 },    -- LAM, CAM, RAM
    { 6, 7 },        -- LDMF, RDMF
    { 2, 3, 4, 5 },  -- LB, LCB, RCB, RB
    { 1 }            -- GK
  }
}
