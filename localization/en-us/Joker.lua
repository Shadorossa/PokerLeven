return {
	descriptions = {
		Joker = {
			j_ina_Kevin = {
				name = "Kevin",
				text = { "{C:forest}Tornado Dragon{}", "Reactivates the {X:fw,C:white}FW{} joker",
					"to its right{}",
					"Triggers evey {C:attention}#1# hands played",
					"{C:inactive}#2# hands remaining" }
			},
			j_ina_Kevin_inf = {
				name = "Kevin",
				text = { "{C:forest}Tornado Dragon{}", "Reactivates the {X:fw,C:white}FW{} joker",
					"to its right{}" }
			},
			j_ina_Mark = {
				name = "Mark",
				text = { "{C:mountain}Magic Hand{}",
					"{C:attention}+#1#{} To played hand size",
					"{C:attention}+#1#{} To discard amount",
					"{C:chips}+#2#{} To {C:chips}hand{} size" }
			},
			j_ina_Nathan = {
				name = "Nathan",
				text = { "{C:wind}Flurry Dash{}",
					"Each {X:raimon,C:white}Raimon{} player grants {X:mult,C:white}X#2#{}" }
			},
			j_ina_Jack = {
				name = "Jack",
				text = { "{C:mountain}The Wall{}", "For each {X:df,C:white}DF{} joker",
					"{C:attention}Stones{} gain",
					"{C:chips}+#1#{} chips permanently" }
			},
			j_ina_Axel = {
				name = "Axel",
				text = { "{C:fire}Fire Tornado", "{X:mult,C:white}X#1#{} if the played hand",
					"contains {C:attention}a flush{} of {C:red}hearts{}" }
			},
			j_ina_Shadow = {
				name = "Shadow",
				text = { "{C:forest}Back Tornado{}",
					"When selecting the blind",
					"if it is the only player",
					"creates a {C:dark_edition}negative{} copy",
					"of itself without abilities" }
			},
			j_ina_Shadow_clone = {
				name = "Shadow",
				text = { "Just a {C:dark_edition}Shadow{}" }
			},
			j_ina_Willy = {
				name = "Willy",
				text = { "{C:forest}Spectacle Crash{}",
					"{C:green}#1# in #2#{} chance to convert",
					"the played hand into {C:attention}polychrome{},",
					"{C:attention}glass{} and {C:attention}red seal{} cards" }
			},
			j_ina_Max = {
				name = "Max",
				text = { "{C:wind}Spiral Shot{}", "{C:chips}+#2#{} chips",
					"{C:chips}+#1#{} chips per {X:wind,C:white}Wind{} joker" }
			},
			j_ina_Peabody = {
				name = "Peabody",
				text = { "{C:mountain}Heavenly Hand{}", "{C:mult}+#1#{} Mult on your last hand",
					"Increases by {C:mult}+#2#{} per {C:attention}activated card{}",
					"in the last played hand" }
			},
			j_ina_Jude_Raimon = {
				name = "Jude",
				text = { "{C:wind}Illusion ball{}", "{X:mult,C:white}X#1#{}",
					"Gains {X:mult,C:white}X#2#{} each time the joker",
					"to its {C:attention}left{} is activated" }
			},
			j_ina_Bobby = {
				name = "Bobby",
				text = { { "{C:forest}The Traitor{}",
					"When selecting the blind changes",
					"to the team you have the most players of", },
					{ "Players from {C:attention}Bobby{}'s team",
						"grant {C:chips}+#1# Chips{}", } }
			},
			j_ina_Erik = {
				name = "Erik",
				text = { "{C:forest}Tri-Pegasus{}",
					"Now {C:tarot}The Magician{} cards",
					"grant {C:attention}2 random seals{}",
					"and no longer transform into {C:green}Lucky Card{}" }
			},
			j_ina_Steve = {
				name = "Steve",
				text = { "{C:wind}Rolling kick{}", "Each {X:raimon,C:white}Raimon{} player",
					"grants {C:chips}+#1#{} chips and {C:mult}+#2#{} mult",
					"Gets {C:money}+#3#${} at the end of the round",
					"{C:inactive}Currently{} {C:chips}+#4#{}{C:inactive} {C:inactive}and{} {C:mult}+#5#{}" }
			},
			j_ina_Jim = {
				name = "Jim",
				text = { "{C:wind}Coil turn{}",
					"Gain {C:chips}+#1#{} chips",
				}
			},
			-- Occult
			j_ina_Talisman = {
				name = "Talisman",
				text = { "{C:forest}Teleport Shot{}", "Reactivates",
					" the {X:occult,C:white}Occult{} joker to its right{} {C:attention}#1# times{}" }
			},
			j_ina_Wolfy = {
				name = "Wolfy",
				text = { "{C:fire}Moonsault{}", "{X:mult,C:white}X#1#{}", "Gains {X:mult,C:white}X#2#{} per",
					"{C:tarot}The Moon{} card used" }
			},
			j_ina_Blood = {
				name = "Blood",
				text = { "{C:mountain}Poison Mist{}",
					"{C:attention}Drains{} {C:money}#1#${} from adjacent jokers",
					"{C:chips}+#2#{} chips per {C:money}1${}", "in its sell value",
					"{C:inactive}Currently{} {C:chips}+#3#{}" }
			},
			j_ina_Grave = {
				name = "Grave",
				text = { "{C:fire}Curse{}", "{C:green}#1# in #2#{} chance",
					"to create a {C:tarot}Death{} card", "per {C:attention}6{} scored" }
			},
			j_ina_Mask = {
				name = "Mask",
				text = { "{C:wind}Killer Blade{}", "Sacrifices the joker to the right",
					"and gains {C:money}#1#${} sell value", "when a blind is selected" }
			},
			j_ina_Styx = {
				name = "Styx",
				text = { "{C:forest}Phantom shot{}", "{C:chips}+#1#{} chips",
					"{C:chips}+#2#{} chips per {C:tarot}Tarot{} card used" }
			},
			j_ina_Franky = {
				name = "Franky",
				text = { "{C:mountain}Mega Quake{}", "{C:attention}High Card{} grants {C:mult}+#1#{} Mult" }
			},
			j_ina_Mummy = {
				name = "Mummy",
				text = { "{C:forest}Ghost Pull{}", "Each {C:clubs}#3#{} grants {C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips" }
			},
			j_ina_King = {
				name = "King",
				text = { "{C:fire}Power shield{}", "If the played hand contains",
					"a {C:attention}Three of a Kind{} of {C:attention}Kings{}:",
					"Creates a copy of the rightmost king" }
			},
			j_ina_Bloom = {
				name = "Bloom",
				text = { "{C:fire}Wrath Shot{}",
					"If you have played 100 cards or more",
					"{X:mult,C:white}X#1#{} Mult when playing a hand",
					"that contains a straight",
					"{C:inactive}Currently{} {C:mult}#2#{} plays" }
			},
			j_ina_Drent = {
				name = "Drent",
				text = { "{C:mountain}Earthquake{}", "{C:green}#1# in #2#{} chance",
					"to create a {C:tarot}The Tower{} card", "after each {C:attention}hand{} played.",
					"Chance improves by 1", "per {X:mountain,C:white}Mountain{} joker" }
			},
			j_ina_Jude = {
				name = "Jude",
				text = { "{C:wind}Illusion bal{}", "{X:mult,C:white}X#1#{}",
					"Gains {X:mult,C:white}X#2#{} each time the joker",
					"to its {C:attention}left{} is activated", "in the scoring hand" }
			},
			j_ina_Martin = {
				name = "Martin",
				text = { "{C:forest}Killer slide{}", "{C:blue}Common{} jokers grant {C:mult}+#1#{} Mult",
					"{C:green}Uncommon{} jokers grant {C:mult}+#2#{} Mult",
					"{C:red}Rare{} jokers grant {X:mult,C:white}X#3#{} Mult",
					"{C:purple}Legendary{} jokers grant {X:dark_edition,C:white}^#4#{} Mult" }
			},
			j_ina_Master = {
				name = "Master",
				text = { "{C:wind}Breakthrough{}", "{C:mult}+#1#{} Mult per",
					"{X:royal academy,C:white}Royal Acad.{} joker",
					"if it is the {C:attention}first{} joker on the left" }
			},
			j_ina_Samford = {
				name = "Samford",
				text = { "{C:forest}Emperor Penguin No. 2{}", "{X:mult,C:white}X#1#{} if you have at least",
					"{C:attention}1{} {X:mf,C:white}MF{} and {C:attention}2{} {X:fw,C:white}FW{} jokers" }
			},
			j_ina_Swing = {
				name = "Swing",
				text = { "{C:wind}Clone Faker{}", "{C:chips}+#1#{} Chips per",
					"{X:royal academy,C:white}Royal Acad.{} joker if the",
					"hand contains a {C:attention}Three of a Kind{}" }
			},
			j_ina_Chicken = {
				name = "Chicken",
				text = { "{C:fire}Golden Egg{}", "{C:attention}Versatile{} cards have",
					"{C:green}#1# in #2#{} chance", "to earn {C:money}#3#${} when scoring" }
			},
			j_ina_Boar = {
				name = "Boar",
				text = { "{C:fire}Wild Claw{}", "If you play a {C:attention}pair of twos{}",
					"destroy it and generate", "a {C:attention}Wild Tag{}" }
			},
			j_ina_Chamaleon = {
				name = "Chameleon",
				text = { "{C:wind}Afterimage{}",
					"You can play {C:attention}Flush{} with 4 cards",
					"If you play a 5th card", "and it's a different suit,",
					"transforms it into a {C:tarot}Versatile Card{}" }
			},
			j_ina_Eagle = {
				name = "Eagle",
				text = { "{C:wind}Condor dive{}", "Gains {C:mult}+#1#{} Mult per",
					"{C:tarot}Versatile Card{} that scores in a hand", "containing a {C:attention}Flush{}",
					"{C:inactive}Currently{} {C:mult}+#2#{}" }
			},
			j_ina_Monkey = {
				name = "Monkey",
				text = { "{C:wind}Monkey turn{}",
					"Gain {X:mult,C:white}XMult{} equal to",
					"the number of {C:tarot}Versatile Cards{}",
					"in the deck multiplied by", "{X:wild,C:white}Wild{} team players / 10",
					"Currently {X:mult,C:white}X#1#{}" }
			},
			j_ina_Gorilla = {
				name = "Gorilla",
				text = { "{C:mountain}Tarzan kick{}", "Creates a {C:attention}Wild Tag{}",
					"upon defeating a Boss Blind" }
			},
			j_ina_Cheetah = {
				name = "Cheetah",
				text = { "{C:wind}Dash Accelerator{}", "If you play {C:attention}5 scoring versatile cards{}",
					"reactivates them once", "per {X:select_element,C:white}#1#{} element player",
					"Element changes each round" }
			},
			j_ina_Feldt = {
				name = "Feldt",
				text = { {
					"{C:forest}Shot Pocket{}",
					"Generates {C:attention}#1#{} {X:mountain,C:white}Barrier{}",
					"if you play at least {C:attention}3{} {C:spades}Spades{}"
				},
					{
						"On the {C:attention}last hand{},",
						"consumes all {X:mountain,C:white}Barriers{}",
						"to give {X:mult,C:white}X#2#{} per",
						"{X:forest,C:white}Forest{} player",
						"{C:inactive}Currently{} {X:mult,C:white}X#3#"
					}
				}
			},
			j_ina_Feldt_n3 = {
				name = "Feldt",
				text = { {
					"{C:forest}Shot Pocket{}",
					"Generates {C:attention}#1#{} {X:mountain,C:white}Barrier{}",
					"if you play at least {C:attention}3{} {C:spades}Spades{}"
				},
					{
						"On the {C:attention}last hand{},",
						"consumes {C:attention}#4# {X:mountain,C:white}Barriers{}",
						"to give {X:mult,C:white}X#2#{} per",
						"{X:forest,C:white}Forest{} player",
						"{C:inactive}Currently{} {X:mult,C:white}X#3#"
					}
				}
			},

			j_ina_Marvel = {
				name = "Marvel",
				text = { "{C:mountain}Defense Scan", "If the {C:chips}chip{} value",
					"of the scoring card",
					"has {C:attention}exactly 3 bits set to 1{}",
					"{C:mult}+#1#{} mult{}" }
			},

			j_ina_Tell = {
				name = "Tell",
				text = { "{C:forest}Fortune Teller{}", "{X:chips,C:white}XPI{} if you have",
					"{C:attention}3 1 4{} in the back hand when scoring" }
			},

			j_ina_Seller = {
				name = "Seller",
				text = { "{C:wind}Psycho Shot{}", "After each round played",
					"gains {C:money}+#2#$ sell potential{}.", "When Seller is sold, increases",
					"the {C:money}sell value{} of other jokers", "by its sell potential",
					"{C:inactive}Currently{} {C:money}#1#${}" }
			},

			j_ina_Kind = {
				name = "Kind",
				text = { "{C:forest}Attack Scan{}", "If the scoring hand is a {C:attention}palindrome{},",
					"reactivates the first and last card." }
			},

			j_ina_Turner = {
				name = "Turner",
				text = { "{C:fire}Fire Tornado{}", "Creates a copy of the {C:attention}first card{}",
					"scored per {X:brain,C:white}Brain{} player on your team",
					"if the played hand contains a {C:attention}Four of a Kind{}" }
			},

			j_ina_Under = {
				name = "Under",
				text = { "{C:forest}Hard Calculation", "Gets {C:chips}#1# / log2(#2# + 1){} chips",
					"per {X:gk,C:white}GK{}{}" }
			},

			-- Otaku
			j_ina_Idol = {
				name = "Idol",
				text = { "{C:mountain}Sliding goal{}",
					"Reactivates {C:attention}4s{}",
					"{C:green}#1# out of #2#{} times" }
			},

			j_ina_Hero = {
				name = "Hero",
				text = { "{C:fire}Fake Ball{}", "Transforms each scoring",
					"{C:attention}face card{} into a {C:attention}4{}" }
			},

			j_ina_Custom = {
				name = "Custom",
				text = { "{C:wind}Cyclone{}", "{X:wind,C:white}Wind{} jokers", "can appear multiple times" }
			},

			j_ina_Robot = {
				name = "Robot",
				text = { "{C:wind}Bewildered{}", "Reactivates {C:attention}Lucky Cards{}",
					"scored in a {C:attention}straight{}",
					"that are in the same position",
					"as each of your {X:mf,C:white}MF{} jokers",
					"starting from the left" }
			},

			j_ina_Gamer = {
				name = "Gamer",
				text = { "{C:fire}Utter Gutsiness Bat{}",
					"You gain {C:chips}chips{} equal to your {C:attention}FPS / 2{}",
					"Bonus becomes {C:attention}FPS{} if", "you have at least 2 {X:otaku,C:white}Otaku{} players",
					"Max value is {C:attention}144 FPS{}", "{C:inactive}Currently{} {C:chips}+#1#{}" }
			},

			j_ina_Artist = {
				name = "Artist",
				text = { "{C:wind}Maximum Gambling{}", "If the played hand contains",
					"a scoring {C:attention}King{} and a {C:attention}Queen{}",
					"converts all scoring cards",
					"into {C:attention}Lucky Cards{}" }
			},

			j_ina_Arcade = {
				name = "Arcade",
				text = { "{C:forest}Comet Shot{}", "The chance to trigger",
					"extra money on {C:attention}Lucky Card{}",
					"is now {C:green}#1# in 15{}, Now each",
					"{C:attention}Lucky Card{}", "costs {C:money}#2#${} to play" }
			},

			-- Inazuma Eleven
			j_ina_Hillman = {
				name = "Hillman",
				text = { "{C:mountain}Ray Ray Restaurant{}",
					"Gains {X:chips,C:white}X#1#{} chips per",
					"{C:pink}Strat{} used this run",
					"{C:inactive}Currently{} {X:chips,C:white}X#2#{}" }
			},

			j_ina_Island = {
				name = "Island",
				text = { "{C:forest}Zigzag Spark{}",
					"Gains {C:chips}+#1#{} chips if the played hand",
					"contains {C:attention}two pair{}",
					"{C:inactive}Currently{} {C:chips}+#2#{}" }
			},

			j_ina_Sweet = {
				name = "Sweet",
				text = { "{C:mountain}Recruitment{}",
					"Creates a {X:raimon,C:white}Raimon{} or {X:inazuma_eleven,C:white}I.Eleven",
					"joker when a blind is selected{}",
					"Can be {C:chips}Common{} or {C:green}Uncommon{}",
					"{C:inactive}Must have space{}" }
			},

			j_ina_Butler = {
				name = "Butler",
				text = { "{C:forest}Rentier{}",
					"Debt can now",
					"go up to {C:money}-#1#${}",
					"per {C:money}-#2#${}, each",
					"scoring card gains",
					"{C:chips}+#3#{} chips for the",
					"rest of the run" }
			},

			j_ina_Barista = {
				name = "Barista",
				text = { "{C:wind}Cross Pass{}",
					"The last card played gives",
					"{X:chips,C:white}X#1#{} extra chips" }
			},

			j_ina_Builder = {
				name = "Builder",
				text = { "{C:fire}Fire Rooster{}",
					"If the played hand contains",
					" a {C:attention}Full House{} transforms a random",
					"card into {C:attention}Steel{}",
					"and {C:mult}destroys{} another card" }
			},

			-- Shuriken
			j_ina_Hood = {
				name = "Hood",
				text = {
					"{C:forest}Whirlwind{}",
					"Gains {X:mult,C:white}X#1#{} per",
					"{X:gk,C:white}GK{}{} Joker",
					"{C:inactive}Currently{} {X:mult,C:white}X#2#{}"
				}
			},

			j_ina_Hillfort = {
				name = "Hillfort",
				text = { "{C:wind}Shadow Stitch{}",
					"When selecting the blind gains {C:chips}+#1#{} chips",
					"per {C:money}#2#${} sell value",
					"of {X:wind,C:white}Wind{} players",
					"{C:inactive}Currently{} {C:chips}+#3#{}" }
			},

			j_ina_Code = {
				name = "Code",
				text = { "{C:mountain}Spider Web{}",
					"Reactivates {C:attention}gold{} cards",
					"in the hand at the end of the round",
					"as many times as",
					"{X:shuriken,C:white}Shuriken{} players" }
			},

			j_ina_Star = {
				name = "Star",
				text = { "{C:wind}Clone Faker{}", "Per {C:red}diamond{} card",
					"gains {C:money}+#1#${} and {C:mult}+#2#{} Mult", }
			},

			j_ina_Cleats = {
				name = "Cleats",
				text = { "{C:wind}Moonsault{}",
					"When selecting the blind",
					"{C:green}transforms{} the joker to",
					"the right into another",
					"of the same {C:green}rarity{}" }
			},

			j_ina_Hattori = {
				name = "Hattori",
				text = { "{C:forest}Clone Shot{}",
					"When selecting the blind creates",
					"{C:attention}#1#{} basic {C:dark_edition}negative{} copies",
					"of itself.",
					"They are destroyed at the end of the round" }
			},

			j_ina_Cloack = {
				name = "Cloak",
				text = { "{C:fire}Afterimage{}", "{C:attention}Frontal{}",
					"When selecting the blind",
					"spends {C:mountain}#1# Barriers{} to clone",
					"a random joker {C:dark_edition}negative{}",
					"perishable with {C:attention}#2#{} rounds remaining" }
			},
			j_ina_Cloack_inf = {
				name = "Cloak",
				text = { "{C:fire}Afterimage{}", "{C:attention}Frontal{}",
					"When selecting the blind",
					"spends {C:mountain}#1# Barriers{} to clone",
					"a random joker {C:dark_edition}negative{}" }
			},
			b_ina_wintersea = {
				name = "Wintersea",
				text = {
					"{C:pink}#1# Managers{}",
					"The first joker",
					"will be {C:dark_edition}eternal{}, {C:attention}pinned{}",
					"and {C:mult}polychrome{}"
				},
			},

			-- Farm
			j_ina_Greeny = {
				name = "Greeny",
				text = {
					{
						"{C:fire}Infinite Wall{}",
						"Generates {C:attention}#1#{} {X:mountain,C:white}barrier{} if when ",
						"entering the blind you have {C:attention}#2#{} {X:df,C:white}DF{}"
					},
					{
						"{C:attention}Right-Footed{}",
						"Consumes {C:attention}#3#{} {X:mountain,C:white}barriers{} to create",
						"a {C:training}training{} card that",
						"is suitable for any joker"
					}
				}
			},

			j_ina_Hayseed = {
				name = "Hayseed",
				text = {
					"{C:mountain}Sowing{}",
					"Gains {C:mult}+#1#{} multiplier",
					"per {C:attention}exact trio{} played",
					"{C:inactive}Currently{} {C:mult}+#2#{} Mult"
				}
			},

			j_ina_Sherman = {
				name = "Sherman",
				text = { "{C:fire}Bamboo Pattern{}",
					"Gains {C:chips}+#1# Chips{}", "when a",
					"{X:farm,C:white}Farm{} player is activated",
					"{C:inactive}Currently{} {C:chips}+#2# Chips{}" }
			},

			j_ina_Spray = {
				name = "Spray",
				text = { "{C:fire}Run Ball Run{}",
					"When selecting a {C:attention}blind{} and",
					"having less than {C:money}#1#${} gains {X:mult,C:white}X#2#{}",
					"{C:inactive}Currently{}: {X:mult,C:white}X#3#{}" }
			},

			j_ina_Dawson = {
				name = "Dawson",
				text = { "{C:wind}Mole Fake{}",
					"If you have less than {C:money}#1#${} and",
					"the played hand is {C:attention}high card{}",
					"{C:attention}duplicates{} that card" }
			},

			j_ina_Muffs = {
				name = "Muffs",
				text = { "{C:forest}Shine Drive{}",
					"After playing a hand {C:attention}Sow{}.",
					"{C:attention}Harvester:{} Gains {C:mult}+#1# Mult{}",
					"{C:inactive}Currently{} {C:mult}+#2# Mult{}" }
			},

			j_ina_Hillvalley = {
				name = "Hillvalley",
				text = { "{C:mountain}Infinite Wall{}",
					"Gains {C:chips}+X{} chips permanently ",
					"when scoring an {C:attention}8{}, {C:attention}9{} or {C:attention}10{} with {C:chips}X{} being the",
					"{C:attention}value{} of the scoring card",
					"{C:inactive}Currently{}: {C:chips}+#1#{}" }
			},

			-- Kirkwood
			j_ina_Neville = {
				name = "Neville",
				text = { "{C:fire}Toughness Block{}",
					"{C:attention}Glass{} cards",
					"now break {C:green}#1# out of #2#{} times" }
			},

			j_ina_Night = {
				name = "Night",
				text = { "{C:fire}Spinning Cut{}",
					"When selecting a",
					"blind, generates a",
					"{X:kirkwood,C:white}Kirkwood{} player, {C:chips}Common{}, or {C:green}Uncommon{}",
					"{C:attention}Can generate duplicates{}",
					"{C:inactive}Requires space{}" }
			},

			j_ina_Marvin = {
				name = "Marvin",
				text = { "{C:fire}Back Tornado{}",
					"{X:attention,C:white}Triplets{}",
					"{C:attention}Odd{} cards",
					"grant {C:mult}+#1# Mult{}" }
			},

			j_ina_Thomas = {
				name = "Thomas",
				text = { "{C:wind}Back Tornado{}",
					"{X:attention,C:white}Triplets{}",
					"{C:attention}Odd{} cards",
					"grant {C:chips}+#1# Chips{}" }
			},

			j_ina_Tyler = {
				name = "Tyler",
				text = {
					"{C:mountain}Back Tornado{}",
					"{X:attention,C:white}Triplets{}",
					"{C:attention}Odd{} cards",
					"generate a {C:tarot}tarot{} {C:green}#1# in #2# times{}" }
			},

			j_ina_Damian = {
				name = "Damian",
				text = {
					"{C:wind}Moonsault{}",
					"When leaving the shop, gains",
					"{C:chips}+#1# Chips{} per",
					"{X:fire,C:white}Fire{} type player in play",
					"{C:inactive}Currently{}: {C:chips}+#2#{}" }
			},

			j_ina_Nashmith = {
				name = "Nashmith",
				text = {
					"{C:forest}Boost Glide{}",
					"Each {C:spades}Spade{} played grants",
					"{C:chips}+#1# Chips{} per",
					"{X:forest,C:white}Forest{} player",
				}
			},

			j_ina_Z_Triangle = {
				name = "Triangle Z",
				text = { "{C:forest}Placeholder{}", "Placeholder effect line 1", "Placeholder effect line 2" }
			},

			-- Zeus

			j_ina_Poseidon = {
				name = "Poseidon",
				text = { { "{C:mountain}Tsunami Wall{}",
					"Generates {C:attention}#1#{} {X:mountain,C:white}barrier{} when playing",
					"a {C:attention}face card{} hand with at least {C:attention}#2#{} scoring" },
					{ "{C:attention}Frontal{}",
						"{C:chips}+#3# Chips{} per {X:mountain,C:white}barrier{}",
						"{C:mult}Spends{} all {X:mountain,C:white}barriers{}",
						"{C:inactive}Currently:{} {C:chips}+#4# Chips{}" } }
			},

			j_ina_Hephestus = {
				name = "Hephaestus",
				text = {
					"{C:fire}Dash Storm{}",
					"Upon winning the blind converts",
					"a {C:attention}random card{}",
					"into a {C:attention}Steel{} card",
					"per {X:fire,C:white}Fire{} type and {X:df,C:white}DF{} position",
					"player"
				}
			},

			j_ina_Apollo = {
				name = "Apollo",
				text = {
					"{C:forest}Heaven's Time{}",
					"If you play a hand with {C:attention}two pair{}",
					"Gains {C:chips}+#1# chips{} and {C:mult}+#4# mult{} {C:inactive}between 2pm and 7pm{}",
					"Gains {C:chips}+#2# chips{} {C:inactive}otherwise{}",
					"{C:inactive}Currently{}: {C:chips}+#3#{}, {C:mult}+#5#{} mult"
				}
			},

			j_ina_Artemis = {
				name = "Artemis",
				text = { "{C:wind}Divine Arrow{}",
					"After playing a face card {C:attention}Sow{} it.",
					"{C:attention}Harvester:{} Gains {C:chips}+#1# Chips{}",
					"{C:inactive}Currently{} {C:chips}+#2# Chips{}" }
			},

			j_ina_Hermes = {
				name = "Hermes",
				text = { "{C:forest}Divine Gold",
					"If the first hand",
					"played is {C:attention}pair{}",
					"converts the pair",
					"into {C:attention}gold cards{}" }
			},

			j_ina_Demeter = {
				name = "Demeter",
				text = {
					"{C:fire}Reflect Buster{}",
					"Grants {C:mult}+#1# Mult{} and {C:chips}+#2# Chips{}",
					"per remaining discard",
					"{C:inactive}Currently{}: {C:mult}+#3#{} {C:chips}+#4#{}"
				}
			},

			j_ina_Aphrodite = {
				name = "Aphrodite",
				text = { { "{C:forest}God Knows{}",
					"At the end of a round",
					"randomly changes between {X:fw,C:white}FW{} and {X:mf,C:white}MF{}" },
					{ "If {X:fw,C:white}FW{} {X:mult,C:white}X#1#{} per",
						"{X:fw,C:white}FW{}, {X:zeus,C:white}Zeus{} and multiplied by {C:mult}discards",
						"If {X:mf,C:white}MF{} {X:mult,C:white}X#2#{} per",
						"{X:mf,C:white}MF{}, {X:zeus,C:white}Zeus{} and multiplied by {C:chips}hands",
						"{C:inactive}Currently{} {X:mult,C:white}X#3#{}" } },
				unlock = {
					"Reach ante {C:attention}9",
				},
			},

			j_ina_Blazer = {
				name = "Blazer",
				text = { {
					"{C:fire}Inferno{}",
					"All {C:attention}Jokers{}",
					"are {X:fire,C:white}Fire{}",
					"If multiple elementals exist",
					"only the leftmost one",
					"works"
				},
					{
						"If not in the play area",
						"returns all players",
						"to their original type",
						"Works even {C:mult}disabled{}"
					}
				}
			},

			j_ina_Ace_Server = {
				name = "Ace Server",
				text = { {
					"{C:fire}Counter Strike{}",
					"{C:green}1 in #1# {}chance to increase",
					"the played hand level",
					"{C:attention}#2# level{} if {C:attention}#3# Aces{} score."
				} }
			},

			j_ina_Weathervane = {
				name = "Weathervane",
				text = { {
					"{C:wind}Whirlwind{}",
					"All {C:attention}Jokers{}",
					"are {X:wind,C:white}Wind{}",
					"If multiple elementals exist",
					"only the leftmost one",
					"works"
				},
					{
						"If not in the play area",
						"returns all players",
						"to their original type",
						"Works even {C:mult}disabled{}"
					}
				}
			},

			j_ina_Noggin = {
				name = "Noggin",
				text = { {
					"{C:forest}Living Jungle{}",
					"All {C:attention}Jokers{}",
					"are {X:forest,C:white}Forest{}",
					"If multiple elementals exist",
					"only the leftmost one",
					"works"
				},
					{
						"If not in the play area",
						"returns all players",
						"to their original type",
						"Works even {C:mult}disabled{}"
					}
				}
			},

			j_ina_Montayne = {
				name = "Montayne",
				text = { {
					"{C:mountain}Fortress{}",
					"All {C:attention}Jokers{}",
					"are {X:mountain,C:white}Mountain{}",
					"If multiple elementals exist",
					"only the leftmost one",
					"works"
				},
					{
						"If not in the play area",
						"returns all players",
						"to their original type",
						"Works even {C:mult}disabled{}"
					}
				}
			},

			j_ina_Dulce = {
				name = "Dulce",
				text = {
					"{C:wind}Harvest Wind{}",
					"When selecting the {C:attention}blind{} sows",
					"{C:attention}#1#{} random card/s from the deck",
					"per joker that is",
					"{X:wind,C:white}Wind{} or {X:mf,C:white}MF{}",
				}
			},

			j_ina_Ryoma = {
				name = "Ryoma",
				text = {
					"{C:mountain}Infinite Stop{}",
					"Gains {C:mult}+#1# mult{} each time",
					"a {X:gk,C:white}GK{} is activated",
					"{C:inactive}Currently{} {C:mult}+#2#{}"
				}
			},

			j_ina_Mach = {
				name = "Mach",
				text = {
					"{C:fire}Grenade Shot{}",
					"Gains {X:mult,C:white}X#1#{} each time",
					"a {C:attention}player or manager{} is sold",
					"{C:inactive}Currently{} {X:mult,C:white}X#2#{}"
				}
			},

			j_ina_Rex_George = {
				name = "Rex George",
				text = { {
					"{C:wind}Leaf Pile{}",
					"Converts played {C:attention}#1#{}s into {C:attention}#2#s{}",
				} }
			},

			-- TOURNAMENT WINNERS
			j_ina_Turi = {
				name = "Turiño",
				text = { { "{C:forest}Bouncing Bunny{}",
					"Earn {X:dark_edition,C:white}^X#2#{} for every",
					"{C:attention}#3#{} {C:tarot}Tarots{} of {C:suits}Suit{} used",
					"{C:inactive}(Actual:{} {X:mult,C:white}X#1#{}, {C:tarot}#4#{} {C:inactive}usados){}" }, }
			},

			j_ina_Nelly = {
				name = "Nelly",
				text = { { "Each round grants between {C:money}#1#${} to {C:money}#2#${},",
					"if you {C:attention}lose the game{}, instead,",
					"{C:mult}destroys{} all jokers",
					"outside the bench and this card." },
					{ "If past ante {C:attention}#3#{}",
						"upon death sets money to {C:money}#4#${}" } }
			},

			j_ina_Celia = {
				name = "Celia",
				text = { {
					"If you have a {C:attention}Jude{},",
					"transforms it to its {X:raimon,C:white}Raimon{} form",
					"at the start of the next shop"
				},
					{ "Generates a {C:attention}Scout{} on the {C:bench}Bench{}",
						"when selecting a blind",
						"{C:inactive}Must have space{}" } }
			},
			j_ina_Koudera = {
				name = "Koudera",
				text = {
					"{C:tarot}+#1#{} {C:tarot}consumable{} slot"
				}
			},
			j_ina_Aurelia = {
				name = "Aurelia",
				text = {
					"{C:green}+#1#{} free {C:attention}reroll{} per shop"
				}
			},
			j_ina_Silvia = {
				name = "Silvia",
				text = {
					"{C:green}+#1#{} {C:attention}booster pack{} slot"
				}
			},
			j_ina_Chester = {
				name = "Chester",
				text = {
					"You can see the next {C:tarot}#1#{}",
					"cards to be drawn"
				}
			},
			j_ina_Akihiro = {
				name = "Akihiro Hino",
				text = {
					"{C:dark_edition,E:1}Please wait a little longer{}"
				}
			},
			-- Gemini Storm
			j_ina_Janus = {
				name = "Janus",
				text = { "{C:forest}Astro Break{}",
					"Starts at {X:mult,C:white}X1{} Mult",
					"Gains {X:mult,C:white}X#2#{} Mult for every",
					"{C:planet}Planet{} card used this run",
					"{C:inactive}(Currently{} {X:mult,C:white}X#1#{}{C:inactive}){}"
				},
				unlock = { "Use {C:attention}25 Planet cards{}", "{C:inactive}(#1#/#2#){}" }
			},
			j_ina_Galileo = {
				name = "Galileo",
				text = { "{C:forest}Black Hole{}",
					"Gains {C:mult}+#1#{} Mult for each",
					"card {C:attention}destroyed{}",
					"{C:inactive}(Currently{} {C:mult}+#2#{}{C:inactive}){}"
				},
				unlock = { "Destroy {C:attention}100 cards{} in total", "{C:inactive}(#1#/#2#){}" }
			},
			j_ina_Pandora = {
				name = "Pandora",
				text = { "{C:wind}Phantom Shot{}",
					"When a playing card is destroyed, {C:green}#3# in #2#{} chance",
					"to create a {C:planet}Planet{} card. Chance increases",
					"for each {C:wind}Wind{} Joker.",
					"If chance is {C:attention}100% or more{}, creates a {C:dark_edition}Negative Planet{}"
				},
				unlock = { "Use {C:attention}5 Planet cards{} in a single round" }
			},
			j_ina_Diam = {
				name = "Diam",
				text = { "{C:forest}Photon Shot{}",
					"On scoring hand, destroy {C:attention}1 card{} in hand",
					"for each {C:attention}Gemini Storm{} Joker.",
					"Gain {C:chips}+#1#{} Chips for each card destroyed {C:attention}this hand{}."
				},
				unlock = { "Destroy {C:attention}5 or more cards{}", "in a single hand" }
			},
			j_ina_Rihm = {
				name = "Rihm",
				text = { "{C:forest}Security Shot{}",
					"{C:green}#1# in #2#{} chance to destroy",
					"scored {C:attention}Winning Hand{} cards"
				},
				unlock = { "Win a run" }
			},
			j_ina_Grengo = {
				name = "Grengo",
				text = { "{C:mountain}Universe Blast{}",
					"Gains {C:chips}+#1#{} Chips for each card",
					"missing from your deck (below 52)",
					"{C:inactive}(Currently{} {C:chips}+#2#{}{C:inactive}){}"
				},
				unlock = { "Win a run with {C:attention}20 or fewer cards{}", "in your deck" }
			},
			j_ina_Io = {
				name = "Io",
				text = { "{C:fire}Fireball Storm{}",
					"Gains {C:chips}+#1#{} Chips for each",
					"{C:fire}Fire{} Joker you have",
					"{C:inactive}(Currently{} {C:chips}+#2#{}{C:inactive}){}"
				},
				unlock = { "Have {C:attention}3 Fire Jokers{} simultaneously" }
			},
			j_ina_Charon = {
				name = "Charon",
				text = { "{C:fire}Photon Flash{}",
					"When playing a {C:attention}Flush{}, destroy the",
					"rightmost card in hand and give {C:mult}+#1#{} Mult"
				},
				unlock = { "Play a {C:attention}Flush{} with", "3 or more {C:hearts}Hearts{}" }
			},
			j_ina_Gigs = {
				name = "Gigs",
				text = { "{C:fire}Ignite Steal{}",
					"If you have another {C:fire}Fire{} Joker,",
					"retrigger the first played card {C:attention}#1#{} times"
				},
				unlock = { "Play {C:attention}1000 cards{} total", "{C:inactive}(#1#/#2#){}" }
			},
			j_ina_Ganymede = {
				name = "Ganymede",
				text = { "{C:mountain}Gravitation{}",
					"If you have another {C:mountain}Mountain{} Joker,",
					"prevents death once ({C:red}destroys self{})"
				},
				unlock = { "Win a round with {C:attention}0 cards{} in your hand" }
			},
			j_ina_Ganymede_1 = {
				name = "Ganymede",
				text = { "{C:mountain}Gravitation{}",
					"If you have another {C:mountain}Mountain{} Joker,",
					"prevents death once ({C:red}destroys self{}).",
					"Gives {C:money}$#1#{}{} on death"
				},
			},
			j_ina_Coral = {
				name = "Coral",
				text = { "{C:wind}Coral Defense{}",
					"{C:mult}+#1#{} Mult if played hand has",
					"{C:attention}3 cards or fewer{}.",
					"Doubles if you have another {X:df,C:white}DF{} Joker"
				},
				unlock = { "Win a round playing only hands with", "{C:attention}3 or fewer cards{}" }
			},
		},
	},
	misc = {}
}
