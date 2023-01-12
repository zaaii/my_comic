import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/domain/entities/chapter.dart';

abstract class ComicRepository {
  Future<Either<Exception, List<Comic>>> getComics();
  Future<Either<Exception, List<Comic>>> getHotComics();
  Future<Either<Exception, DetailComic>> getDetailComic(String param);
  Future<Either<Exception, Chapter>> getChapter(String param);
}
