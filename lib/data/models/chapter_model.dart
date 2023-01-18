import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:my_comic/domain/entities/chapter.dart';

class ChaptersModel extends Equatable {
  ChaptersModel({
    required this.data,
  });

  List<String> data;

  factory ChaptersModel.fromJson(Map<String, dynamic> json) =>
      ChaptersModel(data: List<String>.from(json["data"]));

  Map<String, dynamic> toJson() => {
        "data": data,
      };

  Chapter toEntity() {
    return Chapter(data: data);
  }

  @override
  List<Object> get props => [
        data,
      ];
}
