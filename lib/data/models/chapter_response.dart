import 'package:equatable/equatable.dart';
import 'package:my_comic/data/models/chapter_model.dart';

class ChapterResponse extends Equatable {
  final List<ChaptersModel> chapterModel;

  const ChapterResponse({
    required this.chapterModel,
  });

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      ChapterResponse(
        chapterModel: List<ChaptersModel>.from(
            json["data"].map((x) => ChaptersModel.fromJson(x))),
      );

  @override
  List<Object?> get props => [
        chapterModel,
      ];
}