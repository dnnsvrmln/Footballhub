import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/views/ranking/bloc/ranking_bloc.dart';
import '../../services/league_service.dart';

class RankingPage extends StatelessWidget {
  final String season;
  final String leagueId;

  const RankingPage({super.key, required this.season, required this.leagueId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RankingBloc(
        RepositoryProvider.of<LeagueService>(context),
        season,
        leagueId,
      )..add(LoadRankingEvent()),
      child: BlocBuilder<RankingBloc, RankingState>(
        builder: (context, state) {
          if (state is RankingInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RankingLoadedState) {
            return Column(
              children: [
                Text(state.name),
                Text(state.country),
                Text(state.season.toString()),
                Text(state.logo),
              ],
            );
          }
          return Text("Yo");
        },
      ),
    );
  }
}
