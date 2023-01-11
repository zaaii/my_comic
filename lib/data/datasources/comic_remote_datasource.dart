import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:my_comic/data/models/comic_model.dart';
import 'package:my_comic/data/models/comic_response.dart';
import 'package:my_comic/data/models/detail_comic_model.dart';
import 'package:my_comic/data/models/detail_comic_response.dart';
import 'package:my_comic/data/models/chapter_model.dart';
import 'package:my_comic/data/models/chapter_response.dart';

abstract class ComicRemoteDataSource {
  Future<List<ComicModel>> getComics();
  Future<DetailComicModel> getDetailComic(String param);
  Future<ChaptersModel> getChapter(String param);
}

class ComicRemoteDataSourceImpl implements ComicRemoteDataSource {
  static const String BASE_URL = 'https://wibutools.live/api/komiku';
  // final http.Client client;
  final Dio dio;

  ComicRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ComicModel>> getComics() async {
    final response = await dio.get('$BASE_URL');
    if (response.statusCode == 200) {
      return ComicResponse.fromJson(response.data).comicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<DetailComicModel> getDetailComic(String param) async {
    final response = await dio.get('$BASE_URL/$param');
    if (response.statusCode == 200) {
      return DetailComicResponse.fromJson(response.data)
          .detailComicModel;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<ChaptersModel> getChapter(String param) async {
    final response = await dio.get('$BASE_URL/$param');
    if (response.statusCode == 200) {
      var chapterList =
          ChapterResponse.fromJson(response.data).chapterModel;
      return chapterList[0];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
