defmodule TheSpread.TeamName do

  def format_college_name(massey_name) do
    massey_name = String.to_atom(massey_name)
    wunder_name = Map.fetch(college_map, massey_name)
    case  wunder_name do
      {:ok, name} ->
        name
      _error ->
        Atom.to_string(massey_name)
    end
  end

  def college_map do
    teams = %{
    "gonzaga": "gonzaga bulldogs",
    "villanova": "villanova wildcats",
    "kansas": "kansas jayhawks",
    "baylor": "baylor bears",
    "wisconsin": "wisconsin badgers",
    "arizona": "arizona wildcats",
    "virginia": "virginia cavaliers",
    "louisville": "louisville cardinals",
    "florida": "florida gators",
    "kentucky": "kentucky wildcats",
    "ucla": "ucla bruins",
    "west virginia": "west virginia mountaineers",
    "cincinnati": "cincinnati bearcats",
    "north carolina": "north carolina tar heels",
    "oregon": "oregon ducks",
    "duke": "duke blue devils",
    "purdue": "purdue boilermakers",
    "florida st": "florida state seminoles",
    "creighton": "creighton blue jays",
    "smu": "smu mustangs",
    "st mary's ca": "saint mary's ca gaels",
    "maryland": "maryland terrapins",
    "notre dame": "notre dame fighting irish",
    "south carolina": "south carolina gamecocks",
    "butler": "butler bulldogs",
    "oklahoma st": "oklahoma state cowboys",
    "xavier": "xavier musketeers",
    "wichita st": "wichita state shockers",
    "kansas st": "kansas state wildcats",
    "iowa st": "iowa state cyclones",
    "northwestern": "northwestern wildcats",
    "dayton": "dayton flyers",
    "minnesota": "minnesota golden gophers",
    "usc": "usc trojans",
    "miami fl": "miami hurricanes",
    "tcu": "tcu horned frogs",
    "california": "california golden bears",
    "va commonwealth": "vcu rams",
    "virginia tech": "virginia tech hokies",
    "illinois st": "illinois state redbirds",
    "tennessee": "tennessee volunteers",
    "wake forest": "wake forest deacons",
    "clemson": "clemson tigers",
    "arkansas": "arkansas razorbacks",
    "georgia": "georgia bulldogs",
    "michigan st": "michigan state spartans",
    "seton hall": "seton hall pirates",
    "marquette": "marquette golden eagles",
    "syracuse": "syracuse orange",
    "mtsu": "mtsu blue raiders",
    "texas tech": "texas tech red raiders",
    "michigan": "michigan wolverines",
    "georgetown": "georgetown hoyas",
    "rhode island": "rhode island rams",
    "mississippi": "mississippi rebels",
    "indiana": "indiana hoosiers",
    "georgia tech": "ga tech yellow jackets",
    "houston": "houston cougars",
    "alabama": "alabama crimson tide",
    "pittsburgh": "pittsburgh panthers",
    "vermont": "vermont catamounts",
    "auburn": "auburn tigers",
    "providence": "providence friars",
    "utah": "utah utes",
    "unc wilmington": "nc wilmington seahawks",
    "akron": "akron zips",
    "nevada": "nevada wolf pack",
    "vanderbilt": "vanderbilt commodores",
    "ohio st": "ohio state buckeyes",
    "penn st": "penn state nittany lions",
    "texas a&m": "texas a&m aggies",
    "belmont": "belmont bruins",
    "valparaiso": "valparaiso crusaders",
    "memphis": "memphis tigers",
    "illinois": "illinois fighting illini",
    "monmouth nj": "monmouth hawks",
    "ut arlington": "texas arlington mavericks",
    "boise st": "boise state broncos",
    "new mexico st": "new mexico state aggies",
    "etsu": "tennessee state tigers",
    "richmond": "richmond spiders",
    "iowa": "iowa hawkeyes",
    "princeton": "princeton tigers",
    "mississippi st": "mississippi state bulldogs",
    "unc asheville": "nc asheville bulldogs",
    "chattanooga": "ut chattanooga moccasins",
    "bucknell": "bucknell bison",
    "colorado": "colorado buffaloes",
    "arkansas st": "arkansas st. red wolves",
    "col charleston": "charleston cougars",
    "nc state": "nc state wolfpack",
    "nebraska": "nebraska cornhuskers",
    "texas": "texas longhorns",
    "george mason": "george mason patriots",
    "byu": "byu cougars",
    "winthrop": "winthrop eagles",
    "oklahoma": "oklahoma sooners",
    "st john's": "st. john's red storm",
    "colorado st": "colorado state rams",
    "stanford": "stanford cardinal",
    "st bonaventure": "st. bonaventure bonnies",
    "san francisco": "san francisco dons",
    "temple": "temple owls",
    "la salle": "la salle explorers",
    "furman": "furman paladins",
    "connecticut": "connecticut huskies",
    "new mexico": "new mexico lobos",
    "fl gulf coast": "florida gulf coast eagles",
    "ucf": "central florida knights",
    "davidson": "davidson wildcats",
    "cs bakersfield": "cal state bakersfield",
    "harvard": "harvard crimson",
    "unc greensboro": "unc greensboro spartans",
    "san diego st": "sd state jack rabbits",
    "georgia st": "georgia state panthers",
    "arizona st": "arizona state sun devils",
    "yale": "yale bulldogs",
    "oakland": "oakland golden grizzlies",
    "g washington": "g.washington colonials",
    "n dakota st": "n. dakota fighting hawks",
    "louisiana tech": "louisiana tech bulldogs",
    "rutgers": "rutgers scarlet knights",
    "tulsa": "tulsa golden hurricane",
    "ohio": "ohio bobcats",
    "santa clara": "santa clara broncos",
    "towson": "towson state tigers",
    "loyola-chicago": "loyola chicago ramblers",
    "old dominion": "old dominion monarchs",
    "massachusetts": "massachusetts minutemen",
    "south dakota": "south dakota coyotes",
    "iona": "iona gaels",
    "northern iowa": "northern iowa panthers",
    "ga": "",
    "lehigh": "lehigh mountain hawks",
    "wyoming": "wyoming cowboys",
    "washington st": "washington state cougars",
    "ga southern": "georgia southern eagles",
    "rice": "rice owls",
    "elon": "elon college phoenix",
    "san jose st": "san jose state spartans",
    "n kentucky": "northern kentucky norse",
    "buffalo": "buffalo bulls",
    "wright st": "wright state raiders",
    "e washington": "e. washington eagles",
    "lsu": "lsu tigers",
    "weber st": "weber state wildcats",
    "fresno st": "fresno state bulldogs",
    "lipscomb": "lipscomb bison",
    "denver": "denver university pioneers",
    "william & mary": "william & mary tribe",
    "st joseph's pa": "st. joseph's hawks",
    "ipfw": "ipfw mastadons",
    "missouri st": "mississippi state bulldogs",
    "c michigan": "c. michigan chippewas",
    "nc central": "nc central eagles",
    "ern": "",
    "albany ny": "albany great danes",
    "wi green bay": "wi-green bay phoenix",
    "tn martin": "tenn martin skyhawks",
    "canisius": "canisius golden griffins",
    "s illinois": "southern illinois salukis",
    "stony brook": "stony brook seawolves",
    "liberty": "liberty flames",
    "grand canyon": "grand canyon antelopes",
    "loy marymount": "loyola marymount lions",
    "toledo": "toledo rockets",
    "samford": "samford bulldogs",
    "st peter's": "saint peter's peacocks",
    "tennessee st": "tennessee state tigers",
    "ull": "",
    "uab": "uab blazers",
    "boston univ": "boston u terriers",
    "marshall": "marshall thundering herd",
    "boston college": "",
    "morehead st": "morehead state eagles",
    "ball st": "ball state cardinals",
    "jacksonville st": "jacksonville st. gamecocks",
    "utah st": "utah state aggies",
    "navy": "",
    "north dakota": "north dakota state bison",
    "uc irvine": "cal irvine anteaters",
    "wofford": "wofford terriers",
    "evansville": "evansville aces",
    "ne omaha": "nebraska omaha mavericks",
    "e michigan": "eastern michigan eagles",
    "siena": "siena saints",
    "umbc": "",
    "coastal car": "c. carolina chanticleers",
    "troy": "troy trojans",
    "new orleans": "",
    "uc davis": "california davis aggies",
    "washington": "washington huskies",
    "sam houston st": "",
    "tx": "tx san antonio roadrunners",
    "mercer": "mercer bears",
    "texas st": "texas state bobcats",
    "sc upstate": "",
    "montana": "montana grizzlies",
    "kent": "",
    "new hampshire": "",
    "fordham": "fordham rams",
    "n illinois": "northern illinois huskies",
    "missouri": "missouri tigers",
    "missouri kc": "",
    "indiana st": "indiana st. sycamores",
    "mt st mary's": "mt. st. mary's mountaineers",
    "hofstra": "hofstra pride",
    "fairfield": "fairfield stags",
    "penn": "pennsylvania quakers",
    "murray st": "murray state racers",
    "south alabama": "south alabama jaguars",
    "idaho": "idaho vandals",
    "rider": "rider broncs",
    "gardner webb": "",
    "loyola md": "",
    "depaul": "depaul blue demons",
    "st louis": "saint louis billikens",
    "w michigan": "western michigan broncos",
    "east carolina": "east carolina pirates",
    "s dakota st": "",
    "bowling green": "bowling green falcons",
    "san diego": "san diego toreros",
    "tam c. christi": "",
    "wku": "w. kentucky hilltoppers",
    "columbia": "columbia lions",
    "holy cross": "",
    "e illinois": "eastern illinois panthers",
    "duquesne": "duquesne dukes",
    "unlv": "unlv runnin' rebels",
    "iupui": "iupui jaguars",
    "high point": "",
    "il chicago": "illinois chicago flames",
    "ark little rock": "",
    "charlotte": "nc charlotte 49ers",
    "long beach st": "long beach state 49ers",
    "utah valley": "",
    "pepperdine": "pepperdine waves",
    "bradley": "bradley braves",
    "radford": "",
    "air force": "air force falcons",
    "montana st": "montana state bobcats",
    "quinnipiac": "quinnipiac bobcats",
    "long island": "",
    "portland": "portland pilots",
    "sf austin": "",
    "houston bap": "",
    "portland stb": "portland state vikings",
    "lamar": "",
    "oral roberts": "oral roberts golden eagles",
    "tennessee tech": "tenn tech golden eagles",
    "hawaii": "hawaii warriors",
    "delaware": "delaware blue hens",
    "wagner": "wagner seahawks",
    "cleveland st": "cleveland state vikings",
    "kennesaw": "",
    "northeastern": "northeastern huskies",
    "cs northridge": "cs northridge matadors",
    "utep": "utep miners",
    "se missouri st": "se missouri st. redhawks",
    "brown": "brown bears",
    "seattle": "",
    "ut san antonio": "tx san antonio roadrunners",
    "pacific": "pacific tigers",
    "drexel": "drexel dragons",
    "north florida": "",
    "colgate": "colgate red raiders",
    "jacksonville": "",
    "robert morris": "",
    "fl atlantic": "florida atlantic owls",
    "f dickinson": "farleigh dickinson knights",
    "niagara": "niagara purple eagles",
    "campbell": "",
    "appalachian st": "app state mountaineers",
    "norfolk st": "",
    "james madison": "james madison dukes",
    "st francis pa": "",
    "se louisiana": "",
    "miami oh": "miami ohio redhawks",
    "wi milwaukee": "wi-milwaukee panthers",
    "drake": "drake bulldogs",
    "manhattan": "manhattan jaspers",
    "w illinois": "w. illinois leathernecks",
    "south florida": "south florida bulls",
    "e kentucky": "e. kentucky colonels",
    "youngstown st": "youngstown state penguins",
    "cs fullerton": "cal state fullerton titans",
    "cs sacramento": "",
    "sacred heart": "",
    "binghamton": "",
    "cornell": "cornell big red",
    "austin peay": "austin peay governors",
    "ma lowell": "",
    "uc riverside": "cal riverside highlanders",
    "w carolina": "w. carolina catamounts",
    "cent arkansas": "",
    "detroit": "detroit titans",
    "army": "",
    "hampton": "",
    "alcorn st": "",
    "abilene chr": "",
    "nicholls st": "",
    "tulane": "tulane green wave",
    "utrgv": "",
    "njit": "",
    "dartmouth": "dartmouth big green",
    "bryant": "bryant bulldogs",
    "vmi": "vmi keydets",
    "n colorado": "northern colorado bears",
    "citadel": "the citadel bulldogs",
    "northwestern la": "",
    "ulm": "ul monroe warhawks",
    "cal poly slo": "cal poly slo mustangs",
    "incarnate word": "",
    "american univ": "",
    "oregon st": "oregon state beavers",
    "marist": "marist red foxes",
    "morgan st": "morgan state bears",
    "northern arizona": "n. arizona lumberjacks",
    "hartford": "",
    "lafayette": "ul lafayette ragin cajuns",
    "savannah st": "",
    "charleston so": "",
    "north texas": "north texas mean green",
    "florida intl": "fla intl golden panthers",
    "md e shore": "",
    "howard": "howard bison",
    "mcneese st": "",
    "stetson": "",
     "miss": "mississippi rebels",
    "delaware st": "",
    "idaho st": "idaho state bengals",
    "prairie view": "",
    "chicago st": "",
     "univ": "",
    "edwardsville": "siu edwardsville cougars",
    "santa barbara": "santa barbara gauchos",
    "s carolina st": "",
    "jackson st": "",
    "maine": "",
    "central conn": "",
    "grambling": "",
    "alabama st": "",
    "longwood": ""}
  end
end
