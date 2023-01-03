import 'package:flutter/material.dart';
import 'package:football_app/models/overview_league.dart';
import 'package:football_app/resources/constants.dart';

class OverviewLeagueTitleView extends StatelessWidget {
  final OverviewLeague league;
  final VoidCallback onTap;

  const OverviewLeagueTitleView({
    Key? key,
    required this.league,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.network(
                    league.logoUrl,
                    fit: BoxFit.contain,
                    width: 36,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        league.name,
                        style: const TextStyle(
                          // color: appDarkTextColor,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        league.country,
                        style: const TextStyle(
                          // color: appDarkTextColor,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
