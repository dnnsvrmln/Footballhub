class TeamVenue {
  final int teamId;
  final String teamName;
  final String teamCode;
  final String teamCountry;
  final int teamFounded;
  final bool isNational;
  final String teamLogo;
  final int venueId;
  final String venueName;
  final String venueAddress;
  final String venueCity;
  final int venueCapacity;
  final String venueSurface;
  final String venueImage;

  const TeamVenue({
    required this.teamId,
    required this.teamName,
    required this.teamCode,
    required this.teamCountry,
    required this.teamFounded,
    required this.isNational,
    required this.teamLogo,
    required this.venueId,
    required this.venueName,
    required this.venueAddress,
    required this.venueCity,
    required this.venueCapacity,
    required this.venueSurface,
    required this.venueImage,
  });

  factory TeamVenue.fromJson(Map<String, dynamic> json) {
    return TeamVenue(
      teamId: json['team']['id'] as int,
      teamName: json['team']['name'],
      teamCode: json['team']['code'],
      teamCountry: json['team']['country'],
      teamFounded: json['team']['founded'] as int,
      isNational: json['team']['national'] as bool,
      teamLogo: json['team']['logo'],
      venueId: json['venue']['id'] as int,
      venueName: json['venue']['name'],
      venueAddress: json['venue']['address'],
      venueCity: json['venue']['city'],
      venueCapacity: json['venue']['capacity'] as int,
      venueSurface: json['venue']['surface'],
      venueImage: json['venue']['image'],
    );
  }
}
