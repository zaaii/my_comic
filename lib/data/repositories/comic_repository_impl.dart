import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/data/datasources/comic_remote_datasource.dart';
import 'package:my_comic/utils/exception.dart';
import 'package:my_comic/utils/failure.dart';

class ComicRepositoryImpl implements ComicRepository {
  final ComicRemoteDataSource remoteDataSource;

  ComicRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Comic>>> getComics() async {
    try {
      final result = await remoteDataSource.getComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

    @override
  Future<Either<Failure, List<Comic>>> getHotComics() async {
    try {
      final result = await remoteDataSource.getHotComics();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailComic>> getDetailComic(String param) async {
    try {
      final result = await remoteDataSource.getDetailComic(param);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Chapter>> getChapter(String param) async {
    try {
      final result = await remoteDataSource.getChapter(param);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Gagal Terhubung Ke Internet'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));

    }
  }
}