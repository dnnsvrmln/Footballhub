import 'package:flutter/material.dart';
import '../../../resources/constants.dart';
import '../../../models/standing.dart';

class StandingsCard extends StatelessWidget {
  final Standing standing;
  final VoidCallback onTap;

  const StandingsCard({
    super.key,
    required this.standing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Text(
                      standing.rank.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        standing.team.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      standing.allGames.played.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${standing.allGames.goals.goalsFor.toString()}:${standing.allGames.goals.against.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      standing.goalsDiff.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      standing.points.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
