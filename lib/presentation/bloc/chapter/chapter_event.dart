part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class FetchChapterEvent extends ChapterEvent {
  final String param;

  FetchChapterEvent(this.param);

  @override
  List<Object> get props => [param];
}
