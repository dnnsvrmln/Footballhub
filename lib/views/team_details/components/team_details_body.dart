import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';

class TeamDetailsBody extends StatelessWidget {
  final TeamVenue team;

  const TeamDetailsBody({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(team.teamName),
    );
  }
}
