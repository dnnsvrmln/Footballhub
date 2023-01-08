import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../models/team_venue.dart';

class TeamVenueDetailTeam extends StatelessWidget {
  final TeamVenue teamVenue;

  const TeamVenueDetailTeam({super.key, required this.teamVenue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
          child: Text(
            'Team',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 2.5, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                trailing: Text(teamVenue.teamName),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Country'),
                trailing: Text(teamVenue.teamCountry),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.add_business),
                title: const Text('Founded'),
                trailing: Text(teamVenue.teamFounded.toString()),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.photo_camera_front_sharp),
                title: const Text('Club Logo'),
                trailing: CachedNetworkImage(
                  imageUrl: teamVenue.teamLogo,
                  fit: BoxFit.cover,
                  // height: 50,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
