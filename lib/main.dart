import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_comic/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/bloc/detail_comic/detail_comic_bloc.dart';
import 'package:my_comic/presentation/bloc/hotComic/hot_comics_bloc.dart';
import 'package:my_comic/presentation/bloc/pencarian/pencarian_bloc.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/presentation/pages/home_page.dart';
import 'package:my_comic/presentation/pages/main_page.dart';
import 'package:my_comic/presentation/pages/readPage_page.dart';
import 'package:my_comic/presentation/pages/search_page.dart';
import 'package:my_comic/utils/routes.dart';
import 'locator.dart' as di;

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ComicBloc>(
          create: (_) => di.locator<ComicBloc>(),
        ),
        BlocProvider<HotComicsBloc>(
          create: (_) => di.locator<HotComicsBloc>(),
        ),
        BlocProvider<DetailComicBloc>(
          create: (_) => di.locator<DetailComicBloc>(),
        ),
        BlocProvider<ChapterBloc>(
          create: (_) => di.locator<ChapterBloc>(),
        ),
        BlocProvider<PencarianBloc>(
          create: (_) => di.locator<PencarianBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'My Zencomic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => HomePage(),
              );
            case DetailComicPage.ROUTE_NAME:
              final param = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => DetailComicPage(
                  param: param,
                ),
                settings: settings,
              );
            case ReadPage.ROUTE_NAME:
              final param = settings.arguments as String;
              return MaterialPageRoute(
                builder: (_) => ReadPage(
                  param: param,
                ),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => SearchPage(),
                settings: settings,
              );
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page Not Found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
