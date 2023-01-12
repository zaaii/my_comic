import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/utils/failure.dart';

abstract class ComicRepository {
  Future<Either<Failure, List<Comic>>> getComics();
  Future<Either<Failure, List<Comic>>> getHotComics();
  Future<Either<Failure, DetailComic>> getDetailComic(String param);
  Future<Either<Failure, Chapter>> getChapter(String param);
}
