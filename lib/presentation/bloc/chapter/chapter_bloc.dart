import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/domain/usecase/get_chapter.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final GetChapter _getChapter;

  ChapterBloc(this._getChapter) : super(ChapterEmpty()) {
    on<ChapterEvent>((event, emit) {
      if (event is FetchChapterEvent) {
        emit(ChapterLoading());
        _getChapter(event.param).then((result) {
          result.fold(
            (exception) => emit(ChapterError(exception.toString())),
            (data) => emit(ChapterHasData([data])),
          );
        });
      }
    });
  }
}
