import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/const/color.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/presentation/widget/caraousel_widget.dart';
import 'package:my_comic/presentation/widget/mostPopular_widget.dart';
import 'package:my_comic/presentation/widget/newRelease_widget.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ComicBloc _comicBloc;

  @override
  void initState() {
    _comicBloc = BlocProvider.of<ComicBloc>(context);
    _comicBloc.add(FetchComicEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: kSecondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kWhite, width: 1.5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/avatar.jpg',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Selamat Datang,',
                                style: TextStyle(
                                    color: kTextSecondColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                            Text('Si Wibu',
                                style: TextStyle(
                                    color: kWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.search, color: kWhite),
                        SizedBox(width: 20),
                        Icon(
                          Icons.notifications,
                          color: kWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // New Release Section
              newReleaseSub_widget(),
              NewReleaseComic(),
              // Most Popular Comic
              mostPopularSub_widget(),
              SizedBox(
                  height: MediaQuery.of(context).size.width * 0.84,
                  child: BlocBuilder<ComicBloc, ComicState>(
                    builder: (context, state) {
                      if (state is ComicHasData) {
                        return ListView(
                          padding: EdgeInsets.all(10),
                          children: [
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: state.result.length,
                            itemBuilder: (context, index) {
                              final comic = state.result[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, DetailComicPage.ROUTE_NAME,
                                      arguments: state.result[index].param);
                                },
                                child: Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      comic.thumbnail,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(200, 0, 0, 0),
                                              Color.fromARGB(50, 0, 0, 0),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                comic.title,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    color: kWhite,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                comic.latestChapter,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ]),
                              );
                            },
                          ),
                        ]);
                      } else if (state is ComicError) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
