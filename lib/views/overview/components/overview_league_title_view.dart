import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/models/overview_league.dart';

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
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                spreadRadius: -5,
                blurRadius: 25,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: league.logoUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
