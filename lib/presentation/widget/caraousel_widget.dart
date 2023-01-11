import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_comic/const/color.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';

final List<String> imgList = [];

class NewReleaseComic extends StatefulWidget {
  const NewReleaseComic({super.key});

  @override
  State<NewReleaseComic> createState() => _NewReleaseComicState();
}

class _NewReleaseComicState extends State<NewReleaseComic> {
  late ComicBloc _comicBloc;

  @override
  void initState() {
    _comicBloc = BlocProvider.of<ComicBloc>(context);
    _comicBloc.add(FetchComicEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: BlocBuilder<ComicBloc, ComicState>(
      builder: (context, state) {
        if (state is ComicHasData) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemCount: state.result.length,
            itemBuilder: ((context, index, realIndex) {
              final comic = state.result[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailComicPage.ROUTE_NAME,
                      arguments: state.result[index].param);
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          comic.thumbnail,
                          fit: BoxFit.cover,
                          width: 300.0,
                          height: 300,
                        ),
                        ClipRRect(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                  color: Colors.grey.withOpacity(0.4))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(comic.title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: false,
                                        style: const TextStyle(
                                            color: kWhite,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8),
                                    Text(comic.latestChapter,
                                        style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    const Text('Synopsis:',
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 8),
                                    Text(
                                      comic.description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      softWrap: false,
                                      style: const TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      comic.thumbnail,
                                      fit: BoxFit.cover,
                                      scale: 5,
                                      height: 150,
                                      width: 100,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            }),
          );
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
    ));
  }
}
