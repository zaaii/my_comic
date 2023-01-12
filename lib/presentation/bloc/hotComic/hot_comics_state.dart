part of 'hot_comics_bloc.dart';

abstract class HotComicsState extends Equatable {
  const HotComicsState();
  
  @override
  List<Object> get props => [];
}

class HotComicsEmpty extends HotComicsState {}

class HotComicsLoading extends HotComicsState {}

class HotComicsHasData extends HotComicsState {
  final List<Comic> result;

  HotComicsHasData(this.result);

  @override
  List<Object> get props => [result];
}

class HotComicsError extends HotComicsState {
  final String message;

  const HotComicsError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailComicHasData extends HotComicsState {
  final DetailComic result;

  DetailComicHasData(this.result);

  @override
  List<Object> get props => [result];
}
