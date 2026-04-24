import re

# Orden de jokers extraído de los archivos
joker_order = [
    "Kevin", "Mark", "Nathan", "Axel", "Jude_Raimon", "Bobby", "Steve", "Erik", "Jim", "Tod",
    "Bloom", "Martin",
    "Chamaleon",
    "Feldt",
    "Vox",
    "hillman", "island", "sweet", "butler", "barista", "builder",
    "hood", "hillfort", "code", "star", "cleats", "hattori", "cloack",
    "Greeny", "Hayseed", "Sherman", "Spray", "Dawson", "Muffs", "Hillvalley",
    "Neville", "Night", "Marvin", "Thomas", "Tyler", "Damian", "Nashmith", "z_triangle",
    "Hephestus", "Artemis", "Aphrodite",
    "ironwall", "Western", "Firepool", "fielding", "firsthand", "Tori", "kennedy", "beray",
    "Maddox",
    "Kik", "Waxon", "Sparky", "Maxi", "Water", "Fardream", "Telektual", "Dinglite", "Marshall",
    "Wando", "Dirk", "Scotty", "Scotty_Angry", "Bookworm", "Gami", "Kandel", "Ation",
    "Dvalin", "Dvalin_Plus", "Kenville", "Fedora", "Sworm", "Mercury", "Metron", "Zell",
    "KingR", "Beltzer", "Blade", "Argie", "Bamboo", "Messer", "Spark", "Sparrow", "Jamm", "CalebR",
    "SamfordR", "Cellar", "Zenn", "Little", "Cossimo", "Color",
    "Daisy", "Sand", "Earth", "Pinkpetal", "Greenland", "Bluebells", "Sunrise", "Bush", "Moor",
    "Sue", "Willow", "Closeout", "Spires", "Cash", "Revel", "Brook",
    "Darren", "Fake", "Mishap", "Leave", "Badgame", "Random", "Richmen", "Fate", "Duskplay",
    "Luckyman", "Poker", "Cracker", "Failing", "Cotts", "Passing", "Bathers",
    "Rocky", "Diver", "Hills", "Hurley", "Redding", "Fordline", "Soundtown", "Delight", "Contented",
    "Easton", "Shark", "Cooley", "Breakfast", "Griddle", "Andagi", "Talent",
    "Nero", "Gele", "Kiburn", "Zohen", "Hauser", "Kormer", "Kiwill", "Ark", "Wittz", "Bellatrix",
    "Xene",
    "DarkFeldt", "SamDark", "JimDark", "NathanDark", "KevinDark",
    "Beluga", "Clear", "Icer", "Gazelle", "Frost",
    "Torch",
    "Mark_IJ", "Nathan_IJ", "Jack_IJ", "Hurley_IJ", "Scotty_IJ", "Archer_IJ", "Caleb_IJ", "Shawn_IJ",
    "Axel_IJ", "Austin_IJ", "Thor_IJ", "Jude_IJ", "Samford_IJ", "Kevin_IJ", "Xavier_IJ", "Darren_IJ",
    "Whale", "Water", "Beaches", "Turtle", "Kraken", "Prawn", "Fisher", "HangTen", "Dolphin", "Reef",
    "Jaws", "CHorse", "Summers", "KRab", "Barracuda", "Marlin",
    "Mustafa", "Farooq", "Kalil", "Wali", "Sylla", "Massoud", "Sulaiman", "Armand", "Jasim", "Abdulla",
    "Majdi", "Hamad", "Ahmed", "Jibril", "Rajab", "Siddique",
    "King", "Master", "Zohen", "Bargie", "Hatch", "Turner", "Cloak", "Talisman", "Wittz", "Quagmire",
    "Zell", "Heat", "Hera", "Tyler", "Demeter", "Hillvalley",
    "JungSoo", "DoJun", "SungHwan", "MyungHo", "BaekYong", "Hyun", "Choi", "Byron", "Claude", "Bryce",
    "EunYong",
    "Freddy", "Gascoigne", "Buckingham", "Ralton", "Ripper", "Coole", "Mane", "Appleton", "Purpleton",
    "Partinus", "Arwen", "Jeeves", "Squall", "Woodgate", "Richards", "Pounding",
    "Thorsten", "Alexander", "Heinrich", "Kurt", "Lukas", "Theodor", "Jan", "Niklas", "Jonas",
    "Maximilian", "Peter", "Gerhard", "Erwin", "Jens", "Ernst", "Emmanuel",
    "Pialat", "Godin", "Aron", "Poujol", "Pinot", "Perec", "Huysmans", "Hinault", "Rousseau", "Hervaud",
    "Favreau", "Lazare", "Pinson", "Gutain", "Moreau", "Morland",
    "Inigo", "Costa", "Lopez", "Garrido", "Garcia", "Rodriguez", "Ferreira", "Pereira", "Borja", "Bonachea",
    "Jimenez", "Espindola", "Cesar", "Castor", "Arroyo", "Rubiera",
    "Lazuli", "Diamante", "Turchese", "Agata", "Zaffiro", "Smeraldo", "Granato", "Topazio", "Amatista",
    "Acuto", "Perla", "Quarzo", "Berillo", "Corniola", "Rubino", "Opale",
    "Ortega", "Torres", "Palacios", "Ros", "Martinez", "Caroso", "Lopez", "Torinni", "Castiglione",
    "Balone", "Oro", "Cruz", "Saviola", "Tevez", "Samuel", "Aguero",
    "Dash", "Bryant", "Strider", "Dynamo", "Bobby", "Woodmark", "Erik", "Pierce", "Krueger", "Keats",
    "Jax", "Hawke", "Washington", "Bobbins", "Pooma", "Dexter",
    "Blasi", "Galliano", "Nobili", "Graziuso", "Maserati", "Gabrini", "Nakata", "Yani", "Diavolo",
    "Bianchi", "Generani", "Santini", "Oconti", "Rossa", "Carnivale", "Zanardi",
    "Zorro", "Chacal", "Minion", "Bufalo", "Dingo", "Buho", "Erizo", "Mantis", "Cuervo", "Coyote",
    "Escorpion", "Oso", "Arana", "Cebra", "Caiman", "Mariposa",
    "DaSilva", "Lagarto", "Bagre", "Monstro", "Clemens", "Passos", "Barboza", "Cerezo", "Almeida",
    "Robingo", "Gato", "Ribeiro", "Nogueira", "Oliveira", "Mendes", "Santos",
    "Hector", "Zephyr", "Walter", "Jimi", "Ian", "Quint", "Yasir", "Keith", "Maximino", "Gareth",
    "Drago", "Keenan", "Jarell", "Vic", "Li", "Jazzy",
    "Luceafar", "Bump", "Lump", "Ischer", "Jenkins", "Triumvir", "Gunther", "Stark", "Malice", "Bash",
    "Callous",
    "Anorel", "Nenel", "Genel", "Ekadel", "Lephiel", "Sachinel", "Wenel", "Nuel", "Ientel", "Gaiel", "Sael",
    "Astaroth", "Rubu", "Agor", "Hebimos", "Belal", "Malphas", "Gorja", "Arakune", "Borba", "Zanos",
    "Destra",
    "Zolani", "Dakarai", "Jake", "Moeneeb", "Kennedy", "Anton", "Adam", "Reggie", "Nathan", "Melisizwe",
    "Herschel",
    "Arion", "Riccardo", "Victor", "JP",
    "Isozaki", "Mitsuyoshi",
    "Hotel", "Oscar", "Eco", "Golf", "Charlie", "Lima", "Bravo", "India", "Julieta", "Alfa", "Mike",
    "Uniform", "Tango", "Zulu", "XRay", "Delta",
    "Kilo", "Foxtrot", "Noviembre", "Beta",
    "Zanark", "Shuten",
    "Terry", "Falco", "Trina",
    "Sandra_Fischer", "Trevor", "Cesar", "Valentin", "Adriano_Donati", "Sonny_Wright", "Basile",
    "Haizaki", "Mizukamiya",
    "Hades", "Perseus",
    "Quagmire_Ares", "Hunter_Ares", "Xavier_Ares",
    "Endou", "Sakanoue", "Fudou", "Shirou", "Kidou", "Kazemaru", "Hiura", "Asuto", "Hiroto", "Gouenji",
    "Haizaki", "Goujin", "Ichihoshi", "Nosaka", "Kiyama", "Afuro", "Iwato", "Mansaku", "Saginuma",
    "Nishikage", "Kozoumaru", "Atsuya", "Norika", "Mizukamiya",
    "RaeWon", "DoDoon", "YoungWoo", "SeoAh", "YuHwan", "Younghoon", "SeungJin", "Seok", "JiWon", "Baek",
    "DongHyuk", "EunChang", "MinSoo", "JungPyo",
    "Pazuzu", "Agalia", "Demogor", "Belphego", "Amdu", "Beelze", "Beliano", "Asmo", "Satan", "Sarganas",
    "As", "Lucifer", "Gaap",
    "Akbar", "Ibrohim", "Muhammad", "Majid", "Zafar", "Kumush", "Sarybek", "Farhad", "MoHabbot", "Onaxon",
    "Dost", "Norkul", "Keldi",
    "Kungfu", "Tao", "Xiao", "Minchi", "Lin", "Tanmin", "Wulong", "Zhou", "Hao", "Wantan", "Xiuna", "Chao",
    "Chinsu",
    "Alonso", "Domelgo", "Baraja", "Rufino", "Velasco", "Nando", "Emerico", "Chico", "Luther", "Clario",
    "Bergamo", "Emilio", "Fabio",
    "Bigman", "Gentleman", "Diver", "Smokey", "Judge", "Hunter", "Yoga", "Cobra", "Shakey", "Convoy",
    "Lion", "Horn", "Magician", "Jack",
    "Macero", "Ricardo", "Matheus", "Marcelo", "Lucian", "Renato", "Daninho", "Rolan", "Samuel", "Arthur",
    "Miguel", "Raymond", "Paulo",
    "Gabriella", "Elma", "Alice", "Diana", "Nestore", "Nicolo", "Pietro", "Carlos", "Luca", "Matteo",
    "Petronio", "Racerit", "Kakehashi", "Tonio", "Monica", "Giustino",
    "Goran", "Alexei", "Rabi", "Gwennady", "Simon", "Karl", "Shamil", "Viktor", "Froy", "Zaur", "Yuri",
    "Lasker", "Marl", "Asu", "Lus", "Malik",
    "Procyon", "Tabit", "Meissa", "Saiph", "Alnitak", "Alnilam", "Mintaka", "Bellatrix", "Rigel", "Yurika",
    "Betelgeuse", "Sirius", "Kappa", "Hatysa",
    "Unmei", "Sakuraba",
    "Haruma", "Tsukasa",
    "Axel_Kirkwood",
    "Dulce", "Ryoma", "Blazer", "Weathervane", "Noggin", "Montayne", "Chester", "Mach", "Ace_Server",
    "Rex_George", "Heart", "Clover", "Diamond", "Spade"
]

with open("localization/es_ES.lua", 'r', encoding='utf-8') as f:
    content = f.read()

joker_start = content.find("Joker = {")
joker_end = content.find("        },", joker_start + 50) + len("        },")

joker_section = content[joker_start:joker_end]
joker_pattern = r'(\s+)(j_ina_\w+)\s*=\s*\{[^}]*(?:\{[^}]*\}[^}]*)*\},'
joker_entries = {}

for match in re.finditer(joker_pattern, content[joker_start:joker_end]):
    indent = match.group(1)
    key = match.group(2)
    full_match = match.group(0)
    joker_entries[key] = full_match

joker_variants = {}
for key in joker_entries.keys():
    match = re.match(r'j_ina_(\w+?)(?:_|$)', key)
    if match:
        base = match.group(1)
        if base not in joker_variants:
            joker_variants[base] = []
        joker_variants[base].append(key)

new_joker_entries = []
for base_name in joker_order:
    if base_name in joker_variants:
        for variant_key in sorted(joker_variants[base_name]):
            if variant_key in joker_entries:
                new_joker_entries.append(joker_entries[variant_key])

new_joker_section = "Joker = {\n" + '\n'.join(new_joker_entries) + "\n        },"
new_content = content[:joker_start] + new_joker_section + content[joker_end:]

with open("localization/es_ES.lua", 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Done!")
