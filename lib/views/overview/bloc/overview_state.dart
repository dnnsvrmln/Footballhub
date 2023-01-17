part of 'overview_bloc.dart';

abstract class OverviewState extends Equatable {
  const OverviewState();

  @override
  List<Object> get props => [];
}

class OverviewInitialState extends OverviewState {}

class OverviewLoadedState extends OverviewState {
  final OverviewLeagueList leaguesList;

  const OverviewLoadedState(this.leaguesList);

  @override
  List<Object> get props => [leaguesList];
}
