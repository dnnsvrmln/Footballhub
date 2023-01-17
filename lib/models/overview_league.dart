class OverviewLeague {
  int id;
  String name;
  String country;
  String logoUrl;
  String flagUrl;

  OverviewLeague({
    required this.id,
    required this.name,
    required this.country,
    required this.logoUrl,
    required this.flagUrl,
  });

  factory OverviewLeague.fromJson(Map<String, dynamic> json) => OverviewLeague(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logoUrl: json["logoUrl"],
        flagUrl: json["flagUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logoUrl": logoUrl,
        "flagUrl": flagUrl,
      };
}
