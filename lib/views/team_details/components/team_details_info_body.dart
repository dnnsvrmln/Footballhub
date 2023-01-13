import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';
import 'package:football_app/resources/constants.dart';
import 'package:football_app/views/team_details/components/team_details_info_square_section.dart';

import 'team_details_info_details_item.dart';

class TeamDetailsInfoBody extends StatelessWidget {
  const TeamDetailsInfoBody({
    Key? key,
    required this.team,
  }) : super(key: key);

  final TeamVenue team;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.teamName,
                    style: const TextStyle(
                      color: appTextColor,
                      fontFamily: 'Quicksand',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    team.teamCountry,
                    style: const TextStyle(
                      color: appTextColor,
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
              CachedNetworkImage(
                imageUrl: team.teamLogo,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 80,
                fit: BoxFit.contain,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        TeamDetailsInfoSquareSection(team: team),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Details",
                style: TextStyle(
                  color: appTextColor,
                  fontFamily: 'Quicksand',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TeamDetailsInfoDetailsItem(
                itemString: team.venueName,
                itemNaam: "Stadion",
              ),
              TeamDetailsInfoDetailsItem(
                itemString: team.venueCity,
                itemNaam: "Stad",
              ),
              TeamDetailsInfoDetailsItem(
                itemString: team.venueAddress,
                itemNaam: "Adres",
              ),
              TeamDetailsInfoDetailsItem(
                itemString: team.venueCapacity.toString(),
                itemNaam: "Capaciteit",
              ),
              TeamDetailsInfoDetailsItem(
                itemString: team.venueSurface,
                itemNaam: "Gras type",
              ),
            ],
          ),
        )
      ],
    );
  }
}
