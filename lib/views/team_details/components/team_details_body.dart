import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';
import 'package:football_app/resources/constants.dart';

class TeamDetailsBody extends StatelessWidget {
  final TeamVenue team;

  const TeamDetailsBody({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBackgroundColor,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 320,
              backgroundColor: appBackgroundColor,
              iconTheme: const IconThemeData(color: appTextColor),
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: team.venueImage,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
          body: Text(team.teamName),
        ),
      ),
    );
  }
}
