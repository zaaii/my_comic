import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_comic/utils/color.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({super.key});

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  late ComicBloc _comicBloc;

  @override
  void initState() {
    _comicBloc = BlocProvider.of<ComicBloc>(context);
    _comicBloc.add(FetchComicEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      child: BlocBuilder<ComicBloc, ComicState>(
        builder: (context, state) {
          if (state is ComicHasData) {
            return ListView(padding: const EdgeInsets.all(10), children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  final comic = state.result[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailComicPage.ROUTE_NAME,
                          arguments: state.result[index].param);
                    },
                    child: Stack(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: comic.thumbnail,
                            fit: BoxFit.cover,
                            height: 150,
                            width: 150,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    comic.title,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    comic.latestChapter,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                        color: Colors.white60, fontSize: 10),
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
              child: Text(state.message, style: const TextStyle(color: kWhite)),
            );
          } else if (state is ComicEmpty) {
            return const Center(
              child: Text('Tidak Ada Data', style: TextStyle(color: kWhite)),
            );
          } else {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(color: kWhite, size: 70),
            );
          }
        },
      ),
    );
  }
}
