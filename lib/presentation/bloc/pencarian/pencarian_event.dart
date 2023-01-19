part of 'pencarian_bloc.dart';

abstract class PencarianEvent extends Equatable {
  const PencarianEvent();

  @override
  List<Object> get props => [];
}

class OnQueryChanged extends PencarianEvent {
  final String query;

  const OnQueryChanged(this.query);

  @override
  List<Object> get props => [query];
}