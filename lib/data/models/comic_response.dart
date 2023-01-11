import 'package:equatable/equatable.dart';
import 'package:my_comic/data/models/comic_model.dart';

class ComicResponse extends Equatable {
  final List<ComicModel> comicModel;

  const ComicResponse({
    required this.comicModel,
  });

  factory ComicResponse.fromJson(Map<String, dynamic> json) => ComicResponse(
        comicModel: List<ComicModel>.from(
            json["data"].map((x) => ComicModel.fromJson(x))),
      );

  @override
  List<Object?> get props => [
        comicModel,
      ];
}