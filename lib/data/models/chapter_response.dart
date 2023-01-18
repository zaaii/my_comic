import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:my_comic/data/models/chapter_model.dart';

class ChapterResponse extends Equatable {
  final ChaptersModel chapterModel;

  const ChapterResponse({
    required this.chapterModel,
  });

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      ChapterResponse(
        chapterModel: ChaptersModel.fromJson(json));

  Map<String, dynamic> toJson() => {
        "data": jsonEncode(chapterModel),
      };

  @override
  List<Object> get props => [
        chapterModel,
      ];
}
