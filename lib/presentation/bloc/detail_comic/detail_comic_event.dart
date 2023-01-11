part of 'detail_comic_bloc.dart';

abstract class DetailComicEvent extends Equatable {
  const DetailComicEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailComicEvent extends DetailComicEvent {
  final String param;

  const FetchDetailComicEvent(this.param);

  @override
  List<Object> get props => [param];
}
