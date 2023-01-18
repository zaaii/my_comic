import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_comic/data/datasources/comic_remote_datasource.dart';
import 'package:my_comic/data/repositories/comic_repository_impl.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/domain/repositories/comic_repository.dart';
import 'package:my_comic/domain/usecase/get_chapter.dart';
import 'package:my_comic/domain/usecase/get_comic.dart';
import 'package:my_comic/domain/usecase/get_detail_comic.dart';
import 'package:my_comic/domain/usecase/get_hot_comic.dart';
import 'package:my_comic/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/bloc/detail_comic/detail_comic_bloc.dart';
import 'package:my_comic/presentation/bloc/hotComic/hot_comics_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Repository
  locator.registerLazySingleton<ComicRepository>(
    () => ComicRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // Data source
  locator.registerLazySingleton<ComicRemoteDataSource>(
      () => ComicRemoteDataSourceImpl(dio: locator()));

  // Bloc
  locator.registerLazySingleton<ComicBloc>(() => ComicBloc(locator()));
  locator.registerLazySingleton<HotComicsBloc>(() => HotComicsBloc(locator()));
  locator.registerLazySingleton<DetailComicBloc>(() => DetailComicBloc(locator()));
  locator.registerFactory(() => ChapterBloc(locator()));

  // Usecase
  locator.registerLazySingleton<GetComic>(() => GetComic(locator()));
  locator.registerLazySingleton<GetHotComic>(() => GetHotComic(locator()));
  locator.registerLazySingleton<GetDetailComic>(() =>  GetDetailComic(locator()));
  locator.registerLazySingleton<GetChapter>(() => GetChapter(locator()));

  // Helper
  locator.registerLazySingleton<Dio>(() => Dio());
}
