part of 'hot_comics_bloc.dart';

abstract class HotComicsEvent extends Equatable {
  const HotComicsEvent();

  @override
  List<Object> get props => [];
}

class FetchHotComicsEvent extends HotComicsEvent {}
