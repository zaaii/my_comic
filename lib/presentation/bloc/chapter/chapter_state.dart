part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();
  
  @override
  List<Object> get props => [];
}

class ChapterEmpty extends ChapterState {}

class ChapterLoading extends ChapterState {}

class ChapterHasData extends ChapterState {
  final Chapter result;

  const ChapterHasData(this.result);

  @override
  List<Object> get props => [result];
}

class ChapterError extends ChapterState {
  final String message;

  const ChapterError(this.message);

  @override
  List<Object> get props => [message];
}