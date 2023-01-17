import 'standing.dart';

class League {
  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  List<List<Standing>> standings;

  League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.standings,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        standings: List<List<Standing>>.from(json["standings"].map(
            (x) => List<Standing>.from(x.map((x) => Standing.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "standings": List<dynamic>.from(
            standings.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}
