import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/usecase/get_comic.dart';

part 'comic_event.dart';
part 'comic_state.dart';

class ComicBloc extends Bloc<ComicEvent, ComicState> {
  final GetComic _getComic;

  ComicBloc(this._getComic) : super(ComicEmpty()) {
    on<ComicEvent>((event, emit) async {
      if (event is FetchComicEvent) {
        emit(ComicLoading());
        final result = await _getComic.execute();

        result.fold(
          (failure) => emit(ComicError(failure.toString())),
          (data) => emit(ComicHasData(data)),
        );
      }
    });
  }
}
