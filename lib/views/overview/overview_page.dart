import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/services/league_service.dart';
import 'package:football_app/views/overview/bloc/overview_bloc.dart';
import 'components/league_overview_item.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OverviewBloc(
        RepositoryProvider.of<LeagueService>(context),
      )..add(LoadOverviewEvent()),
      child: Scaffold(
        body: BlocBuilder<OverviewBloc, OverviewState>(
          builder: (context, state) {
            if (state is OverviewLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView.builder(
                  itemCount: state.leaguesList.leagues.length,
                  itemBuilder: (context, index) => LeagueOverviewItem(
                    league: state.leaguesList.leagues[index],
                    seasonsList: state.leaguesList.seasons,
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
