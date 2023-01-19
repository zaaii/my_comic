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
import 'package:my_comic/domain/usecase/get_pencarian.dart';
import 'package:my_comic/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/bloc/detail_comic/detail_comic_bloc.dart';
import 'package:my_comic/presentation/bloc/hotComic/hot_comics_bloc.dart';
import 'package:my_comic/presentation/bloc/pencarian/pencarian_bloc.dart';

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
  locator.registerFactory<ComicBloc>(() => ComicBloc(locator()));
  locator.registerFactory<HotComicsBloc>(() => HotComicsBloc(locator()));
  locator.registerFactory<DetailComicBloc>(() => DetailComicBloc(locator()));
  locator.registerFactory<ChapterBloc>(() => ChapterBloc(locator()));
  locator.registerFactory<PencarianBloc>(() => PencarianBloc(locator()));

  // Usecase
  locator.registerLazySingleton<GetComic>(() => GetComic(locator()));
  locator.registerLazySingleton<GetHotComic>(() => GetHotComic(locator()));
  locator.registerLazySingleton<GetDetailComic>(() =>  GetDetailComic(locator()));
  locator.registerLazySingleton<GetChapter>(() => GetChapter(locator()));
  locator.registerLazySingleton<GetPencarian>(() => GetPencarian(locator()));

  // Helper
  locator.registerLazySingleton<Dio>(() => Dio());
}
