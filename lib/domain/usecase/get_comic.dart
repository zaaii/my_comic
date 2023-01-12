import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/utils/failure.dart';

class GetComic {
  final ComicRepository repository;

  GetComic(this.repository);

  Future<Either<Failure, List<Comic>>> execute() {
    return repository.getComics();
  }
}