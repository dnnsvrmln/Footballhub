import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/views/overview/bloc/overview_bloc.dart';
import 'package:football_app/views/team_details/team_details_page.dart';
import 'package:sticky_headers/sticky_headers.dart';
import './standings_header.dart';
import './standings_card.dart';
import '../../../models/league.dart';

class StandingsList extends StatelessWidget {
  final League league;

  const StandingsList({
    super.key,
    required this.league,
  });

  void selectTeam(BuildContext buildContext, int teamId, String teamName) {
    Navigator.of(buildContext).push(MaterialPageRoute(
      builder: (newContext) => BlocProvider.value(
        value: BlocProvider.of<OverviewBloc>(buildContext),
        child: TeamDetailsPage(
          teamId: teamId.toString(),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: const StandingsHeader(),
      content: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: league.standings[0].length,
          itemBuilder: (context, index) => StandingsCard(
            standing: league.standings[0][index],
            onTap: (() => selectTeam(
                  context,
                  league.standings[0][index].team.id,
                  league.standings[0][index].team.name,
                )),
          ),
        ),
      ),
    );
  }
}
