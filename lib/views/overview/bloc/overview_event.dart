part of 'overview_bloc.dart';

abstract class OverviewEvent extends Equatable {
  const OverviewEvent();
}

class LoadOverviewEvent extends OverviewEvent {
  @override
  List<Object> get props => [];
}
