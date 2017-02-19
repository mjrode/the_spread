defmodule TheSpread.ExampleRequest do
  # Sport: ncaa_basketball
  # Date: 2017-02-10
  def massey_game_1 do
    [[["Thu 02.02", "", "game.php?gid=737531192", "737727-4-2500-769"],
    ["<a href=\"http://www.google.com/cse?cx=partner-pub-0379030414683754:9954400133&ie=UTF-8&q=Wofford Terriers 100 Citadel Bulldogs 90 box score&sa=Search&ref=#gsc.tab=0&gsc.q=Wofford Terriers 100 Citadel Bulldogs 90 box score&gsc.page=1\">FINAL</a>",
     "red"], ["Wofford", "", "team.php?s=292154&t=9126"],
    ["@ Citadel", "", "team.php?s=292154&t=1545"], ["# 181 (14-15)", "", "", 10],
    ["# 309 (9-19)"], [100, "cWin", "", 100], [90, "white"], [97, "cWin", "", 97],
    [92, "white"], [66.03, "cWin", "", 66.03], [33.97, "white"],
    [-4.5, "ltgreen", "", 4.5], [7, "ltred", "", 4.5], [190.5, "ltgreen"],
    [184, "ltred"]]]
  end

  def massey_game_2 do
    [[["Thu 02.02", "", "game.php?gid=737531210", "737727-4-2500-791"],
    ["<a href=\"http://www.google.com/cse?cx=partner-pub-0379030414683754:9954400133&ie=UTF-8&q=Portland State Vikings 72 University of Idaho Vandals 89 box score&sa=Search&ref=#gsc.tab=0&gsc.q=Portland State Vikings 72 University of Idaho Vandals 89 box score&gsc.page=1\">FINAL</a>",
     "red"], ["Portland St", "", "team.php?s=292154&t=6302"],
    ["@ Idaho", "", "team.php?s=292154&t=3415"], ["# 254 (12-13)", "", "", 10],
    ["# 222 (13-12)"], [72, "white", "", 89], [89, "cWin"], [74, "white", "", 78],
    [78, "cWin"], [37.08, "white", "", 62.91], [62.91, "cWin"],
    [4, "ltred", "", 3.5], [-3.5, "ltgreen", "", 3.5], [152.5, "ltgreen"],
    [146.5, "ltred"]]]
  end

  def massey_game_3 do
    [[["Thu 02.02", "", "game.php?gid=737531180", "737727-4-2500-999"],
    ["<a href=\"http://www.google.com/cse?cx=partner-pub-0379030414683754:9954400133&ie=UTF-8&q=Saint Francis PA Red Flash 78 St Francis NY Terriers 61 box score&sa=Search&ref=#gsc.tab=0&gsc.q=Saint Francis PA Red Flash 78 St Francis NY Terriers 61 box score&gsc.page=1\">FINAL</a>",
     "red"], ["St Francis PA", "", "team.php?s=292154&t=6791"],
    ["@ St Francis NY", "", "team.php?s=292154&t=7509"],
    ["# 278 (12-15)", "", "", 7], ["# 348 (4-25)"], [78, "cWin", "", 78],
    [61, "white"], [74, "cWin", "", 74], [68, "white"],
    [71.66, "cWin", "", 71.66], [28.33, "white"], [-6.5, "ltgreen", "", 6.5],
    ["---", "ltred", "", 6.5], [142.5, "ltgreen"], ["---", "ltred"]]]
  end

  def massey_game_4 do
    [[["Thu 02.02", "", "game.php?gid=737531194", "737727-4-2500-719"],
    ["<a href=\"http://www.google.com/cse?cx=partner-pub-0379030414683754:9954400133&ie=UTF-8&q=Detroit Titans 73 Cleveland State Vikings 90 box score&sa=Search&ref=#gsc.tab=0&gsc.q=Detroit Titans 73 Cleveland State Vikings 90 box score&gsc.page=1\">FINAL</a>",
     "red"], ["Detroit", "", "team.php?s=292154&t=2176"],
    ["@ Cleveland St", "", "team.php?s=292154&t=1612"],
    ["# 298 (6-20)", "", "", 8], ["# 262 (8-20)"], [73, "white", "", 90],
    [90, "cWin"], [71, "white", "", 78], [78, "cWin"],
    [26.26, "white", "", 73.74], [73.74, "cWin"], [6.5, "ltred", "", 6.5],
    [-6.5, "ltgreen", "", 6.5], [150.5, "ltgreen"], [150, "ltred"]]]
  end

  def massey_row_game_not_over do
  end

  def wunder_row1 do
    [{"tr", [{"class", ""}],
   [{"td", [], ["\n                      6:30pm                  "]},
    {"td", [], ["887"]},
    {"td", [{"style", "white-space:nowrap"}], ["Ohio Bobcats"]},
    {"td", [], ["465 "]},
    {"td", [], ["\n                        49%          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress grey wd_progress"}],
       [{"div",
         [{"style", "width:  49%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["50 "]},
    {"td", [], ["\n            49%          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress grey wd_progress"}],
       [{"div",
         [{"style", "width:  49%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["O 338 "]},
    {"td", [], [{"font", [{"color", "green"}], ["67%"]}]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress wd_progress"}],
       [{"div",
         [{"style", "width:  67%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}]},
  {"tr", [{"class", ""}],
   [{"td", [],
     [{"a",
       [{"href", "/consensus/viewScoreOdds/event_id/429862.html?width=610"},
        {"name",
         "Ohio Bobcats vs. Ball State Cardinals - Friday February 10, 2017 6:30 pm"},
        {"class", "jTip hidden-xs"}, {"id", "429862"}], ["score »"]},
      {"a",
       [{"href", "/consensus/viewScoreOdds/event_id/429862.html"},
        {"name",
         "Ohio Bobcats vs. Ball State Cardinals - Friday February 10, 2017 6:30 pm"},
        {"class", "visible-xs"}, {"id", "429862"}], ["score »"]}]},
    {"td", [], ["888"]},
    {"td", [{"style", "white-space:nowrap"}], ["Ball State Cardinals"]},
    {"td", [], ["476 "]}, {"td", [], ["\n            51% \n          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress wd_progress"}],
       [{"div",
         [{"style", "width:  51%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["52 "]},
    {"td", [], ["\n            51% \n          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress wd_progress"}],
       [{"div",
         [{"style", "width:  51%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["U 170 "]},
    {"td", [], ["\n            33% \n          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress grey wd_progress"}],
       [{"div",
         [{"style", "width:  33%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}]},
  {"tr", [{"class", "striped"}],
   [{"td", [], ["\n                      7:00pm                  "]},
    {"td", [], ["869"]},
    {"td", [{"style", "white-space:nowrap"}], ["Dayton Flyers "]},
    {"td", [], ["934 "]},
    {"td", [], ["\n                        54%          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress wd_progress"}],
       [{"div",
         [{"style", "width:  54%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["111 "]},
    {"td", [], ["\n            43%          "]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress grey wd_progress"}],
       [{"div",
         [{"style", "width:  43%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}, {"td", [], ["O 361 "]},
    {"td", [], [{"font", [{"color", "green"}], ["66%"]}]},
    {"td", [{"class", "pc_percent_bar"}, {"valign", "middle"}],
     [{"div", [{"class", "progress wd_progress"}],
       [{"div",
         [{"style", "width:  66%;"},
          {"class", "progress-bar progress-bar-warning progress-bar-striped"}],
         []}]}]}]}]
  end
end

ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(TheSpread.Repo, :manual)
