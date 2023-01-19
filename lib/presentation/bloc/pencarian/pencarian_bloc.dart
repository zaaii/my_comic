import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:my_comic/domain/usecase/get_pencarian.dart';
import 'package:my_comic/domain/entities/comic.dart';

part 'pencarian_event.dart';
part 'pencarian_state.dart';

class PencarianBloc extends Bloc<PencarianEvent, PencarianState> {
  final GetPencarian _pencarian;

  PencarianBloc(this._pencarian) : super(PencarianEmpty()) {
    on<OnQueryChanged>((event, emit) async {
      emit(PencarianLoading());
      final result = await _pencarian.execute(event.query);
      result.fold(
        (failure) => emit(PencarianError(failure.message)),
        (data) => emit(PencarianHasData(data)),
      );
    },
    transformer: comicDebounce(const Duration(milliseconds: 500))
    );
  }
}

EventTransformer<T> comicDebounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
