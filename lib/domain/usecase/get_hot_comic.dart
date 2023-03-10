import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/utils/failure.dart';

class GetHotComic {
  final ComicRepository repository;

  GetHotComic(this.repository);

  Future<Either<Failure, List<Comic>>> execute() {
    return repository.getHotComics();
  }
}