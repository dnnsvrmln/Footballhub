import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app/models/overview_league_list.dart';
import 'package:football_app/services/league_service.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final LeagueService _leagueService;

  OverviewBloc(this._leagueService) : super(OverviewInitialState()) {
    on<LoadOverviewEvent>((event, emit) async {
      final leagues = await _leagueService.getLeaguesOverview();
      emit(
        OverviewLoadedState(leagues),
      );
    });
  }
}
