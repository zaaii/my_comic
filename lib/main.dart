import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/bloc/hotComic/hot_comics_bloc.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/presentation/pages/home_page.dart';
import 'package:my_comic/presentation/pages/main_page.dart';
import 'locator.dart' as di;

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ComicBloc>(create: (_) => di.locator<ComicBloc>(),),
        BlocProvider<HotComicsBloc>(create: (_) => di.locator<HotComicsBloc>(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => HomePage(),
              );
            case DetailComicPage.ROUTE_NAME:
              return MaterialPageRoute(
                builder: (_) => DetailComicPage(),
              );
              default:
                return MaterialPageRoute(
                  builder: (_) {
                    return Scaffold(
                      body: Center(
                        child: const Text('Page Not Found :('),
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
