import 'package:equatable/equatable.dart';
import 'package:my_comic/data/models/detail_comic_model.dart';

class DetailComicResponse extends Equatable {
  final DetailComicModel detailComicModel;

  const DetailComicResponse({
    required this.detailComicModel,
  });

  factory DetailComicResponse.fromJson(Map<String, dynamic> json) =>
      DetailComicResponse(
        detailComicModel: DetailComicModel.fromJson(json["data"]),
      );

  @override
  List<Object?> get props => [
        detailComicModel,
      ];
}
