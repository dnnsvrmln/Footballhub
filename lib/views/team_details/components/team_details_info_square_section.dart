import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';
import 'package:football_app/views/team_details/components/team_details_info_square.dart';

class TeamDetailsInfoSquareSection extends StatelessWidget {
  const TeamDetailsInfoSquareSection({
    Key? key,
    required this.team,
  }) : super(key: key);

  final TeamVenue team;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TeamDetailsInfoSquare(
              squareType: 0,
              team: team,
            ),
          ),
          TeamDetailsInfoSquare(
            squareType: 1,
            team: team,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TeamDetailsInfoSquare(
              squareType: 2,
              team: team,
            ),
          ),
        ],
      ),
    );
  }
}
