import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/usecase/get_detail_comic.dart';

part 'detail_comic_event.dart';
part 'detail_comic_state.dart';

class DetailComicBloc extends Bloc<DetailComicEvent, DetailComicState> {
  final GetDetailComic _getDetailComic;

  DetailComicBloc(this._getDetailComic) : super(DetailComicEmpty()) {
    on<DetailComicEvent>((event, emit) async {
      if (event is FetchDetailComicEvent) {
        emit(DetailComicLoading());
        final result = await _getDetailComic.execute(event.param);

        result.fold(
          (exception) => emit(DetailComicError(exception.toString())),
          (data) => emit(DetailComicHasData(data)),
        );
      }
    });
  }
}
