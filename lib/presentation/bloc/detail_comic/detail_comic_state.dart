part of 'detail_comic_bloc.dart';

abstract class DetailComicState extends Equatable {
  const DetailComicState();
  
  @override
  List<Object> get props => [];
}

class DetailComicEmpty extends DetailComicState {}

class DetailComicLoading extends DetailComicState {}

class DetailComicHasData extends DetailComicState {
  final DetailComic result;

  const DetailComicHasData(this.result);

  @override
  List<Object> get props => [result];
}

class DetailComicError extends DetailComicState {
  final String message;

  const DetailComicError(this.message);

  @override
  List<Object> get props => [message];
}
