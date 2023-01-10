import 'package:flutter/material.dart';
import 'package:football_app/services/league_service.dart';
import 'package:football_app/views/team_details/components/team_details_body.dart';

class TeamDetailsPage extends StatefulWidget {
  final String teamId;

  const TeamDetailsPage({
    super.key,
    required this.teamId,
  });

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LeagueService().getMockTeamVenue(widget.teamId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Oops, an error occured!'),
          );
        } else {
          return TeamDetailsBody(team: snapshot.data!);
        }
      },
    );
  }
}
