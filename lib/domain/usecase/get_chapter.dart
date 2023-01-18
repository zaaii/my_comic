import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/utils/failure.dart';

class GetChapter {
  final ComicRepository repository;

  GetChapter(this.repository);

  Future<Either<Failure, Chapter>> execute(String param) async {
    return await repository.getChapter(param);
  }
}