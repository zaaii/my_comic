import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/widget/RecommendationHeader_widget.dart';
import 'package:my_comic/presentation/widget/Recommendation_widget.dart';
import 'package:my_comic/presentation/widget/hotRelease_widget.dart';
import 'package:my_comic/utils/color.dart';
import 'package:my_comic/presentation/widget/hotReleaseHeader_widget.dart';

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
              const SizedBox(
                height: 20,
              ),
              // New Release Section
              const HotReleaseHeaderWidget(),
              const HotReleaseWidget(),
              
              // Most Popular Comic
              const RecommendationHeaderWidget(),
              const RecommendationWidget(),
            ]),
          ),
        ),
      ),
    );
  }
}
