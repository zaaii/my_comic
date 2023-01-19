import 'package:my_comic/domain/repositories/comic_repository.dart';

import 'package:fpdart/fpdart.dart';
import 'package:my_comic/domain/entities/comic.dart';
import 'package:my_comic/utils/failure.dart';


class GetPencarian {
  final ComicRepository repository;
  GetPencarian(this.repository);

  Future<Either<Failure, List<Comic>>> execute(String query) {
    return repository.getPencarian(query);
  }
}