import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/data/datasources/comic_remote_datasource.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicRemoteDataSource remoteDataSource;

  ComicRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, List<Comic>>> getComics() async {
    try {
      final result = await remoteDataSource.getComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return Left(SocketException('No Internet connection'));
    } on Exception {
      return Left(Exception('Error'));
    }
  }

    @override
  Future<Either<Exception, List<Comic>>> getHotComics() async {
    try {
      final result = await remoteDataSource.getHotComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return Left(SocketException('No Internet connection'));
    } on Exception {
      return Left(Exception('Error'));
    }
  }

  @override
  Future<Either<Exception, DetailComic>> getDetailComic(String param) async {
    try {
      final result = await remoteDataSource.getDetailComic(param);
      return Right(result.toEntity());
    } on SocketException {
      return Left(SocketException('No Internet connection'));
    } on Exception {
      return Left(Exception('Error'));
    }
  }

  @override
  Future<Either<Exception, Chapter>> getChapter(String param) async {
    try {
      final result = await remoteDataSource.getChapter(param);
      return Right(result.toEntity());
    } on SocketException {
      return Left(SocketException('No Internet connection'));
    } on Exception {
      return Left(Exception('Error'));
    }
  }
}