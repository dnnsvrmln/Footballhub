import 'package:football_app/models/overview_league.dart';

class OverviewLeagueList {
  List<int> seasons;
  List<OverviewLeague> leagues;

  OverviewLeagueList({
    required this.seasons,
    required this.leagues,
  });

  factory OverviewLeagueList.fromJson(Map<String, dynamic> json) =>
      OverviewLeagueList(
        seasons: json["seasons"].cast<int>(),
        leagues: List.from(json['leagues'])
            .map((item) => OverviewLeague.fromJson(item))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "seasons": seasons,
        "leagues": leagues,
      };
}
