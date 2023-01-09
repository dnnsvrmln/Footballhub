import 'package:flutter/material.dart';
import '../../services/league_service.dart';
import './components/team_venue_detail_body.dart';
import '../../resources/constants.dart';

class TeamVenueDetailPage extends StatelessWidget {
  const TeamVenueDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final teamId = routeArguments['teamId'] ?? '0';
    final teamName = routeArguments['teamName'] ?? 'Team Detail';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          teamName,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: appBackgroundColor,
      ),
      backgroundColor: appBackgroundColor,
      body: FutureBuilder(
        future: LeagueService().getTeamVenue(teamId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: const Text('Oops, en error ocurred!'),
              content: const Text(
                  'Something went wrong during loading of the standigs...'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                )
              ],
            );
          } else {
            return TeamDetailBody(
              teamVenue: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
