import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'team_venue_detail_team.dart';
import 'team_venue_detail_venue.dart';
import '../../../models/team_venue.dart';

class TeamDetailBody extends StatelessWidget {
  final TeamVenue teamVenue;

  const TeamDetailBody({super.key, required this.teamVenue});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
            height: 200,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.5),
              child: CachedNetworkImage(
                imageUrl: teamVenue.venueImage,
                placeholder: (context, url) => new CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
            child: Text(
              'About',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, top: 2.5, right: 15.0, bottom: 0.0),
            child: Text(
              '${teamVenue.teamName} is a football club based in the ${teamVenue.teamCountry} and was foundend in ${teamVenue.teamFounded}.'
              'The club plays his home matches in the ${teamVenue.venueName}, which is located in the city of ${teamVenue.venueCity}.',
            ),
          ),
          TeamVenueDetailTeam(
            teamVenue: teamVenue,
          ),
          TeamVenueDetailVenue(
            teamVenue: teamVenue,
          ),
        ],
      ),
    );
  }
}
