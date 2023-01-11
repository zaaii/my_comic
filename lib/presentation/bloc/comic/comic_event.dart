part of 'comic_bloc.dart';

abstract class ComicEvent extends Equatable {
  const ComicEvent();

  @override
  List<Object> get props => [];
}

class FetchComicEvent extends ComicEvent {}
