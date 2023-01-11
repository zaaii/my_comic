part of 'comic_bloc.dart';

abstract class ComicState extends Equatable {
  const ComicState();
  
  @override
  List<Object> get props => [];
}

class ComicEmpty extends ComicState {}

class ComicLoading extends ComicState {}

class ComicHasData extends ComicState {
  final List<Comic> result;

  ComicHasData(this.result);

  @override
  List<Object> get props => [result];
}

class ComicError extends ComicState {
  final String message;

  const ComicError(this.message);

  @override
  List<Object> get props => [message];
}

class DetailComicHasData extends ComicState {
  final DetailComic result;

  DetailComicHasData(this.result);

  @override
  List<Object> get props => [result];
}
