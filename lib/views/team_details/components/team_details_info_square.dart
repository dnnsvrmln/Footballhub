import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';
import 'package:football_app/resources/constants.dart';

class TeamDetailsInfoSquare extends StatelessWidget {
  const TeamDetailsInfoSquare({
    Key? key,
    required this.team,
    required this.squareType,
  }) : super(key: key);

  final int squareType;
  final TeamVenue team;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: appTextColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getApplicableIcon(squareType),
          const SizedBox(
            height: 12,
          ),
          Text(
            (() {
              if (squareType == 0) {
                return team.teamFounded.toString();
              } else if (squareType == 1) {
                return team.teamCode;
              } else {
                return team.isNational ? "Ja" : "Nee";
              }
            })(),
            style: const TextStyle(
              color: appTextColor,
              fontFamily: 'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            (() {
              if (squareType == 0) {
                return "Opgericht";
              } else if (squareType == 1) {
                return "Code";
              } else {
                return "Nationaal";
              }
            })(),
            style: const TextStyle(
              color: appTextColor,
              fontFamily: 'Quicksand',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  _getApplicableIcon(int type) {
    switch (type) {
      case 0:
        return const Icon(
          CupertinoIcons.calendar,
          color: appTextColor,
        );
      case 1:
        return const Icon(
          CupertinoIcons.pencil,
          color: appTextColor,
        );
      default:
        return const Icon(
          CupertinoIcons.flag,
          color: appTextColor,
        );
    }
  }
}
