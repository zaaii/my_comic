import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/domain/entities/detail_comic.dart';
import 'package:my_comic/utils/failure.dart';

class GetDetailComic {
  final ComicRepository repository;

  GetDetailComic(this.repository);

  Future<Either<Failure, DetailComic>> execute(String param) async {
    return await repository.getDetailComic(param);
  }
}