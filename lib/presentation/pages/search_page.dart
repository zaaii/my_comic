import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_comic/domain/usecase/get_pencarian.dart';
import 'package:my_comic/presentation/bloc/pencarian/pencarian_bloc.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/utils/color.dart';

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_outlined, color: kWhite),
              ),
              const Text('Search',
                  style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (query) {
                context.read<PencarianBloc>().add(OnQueryChanged(query));
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kWhite),
                  ),
                  hintText: 'Masukan Judul ...',
                  hintStyle: const TextStyle(color: kTextSecondColor),
                  prefixIcon: const Icon(Icons.search, color: kWhite),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kWhite),
                  ),
                  contentPadding: const EdgeInsets.all(12)),
              textInputAction: TextInputAction.search,
              style: const TextStyle(color: kWhite),
            ),
          ),
          const Flexible(flex: 1, child: PencarianResult()),
        ],
      )),
    );
  }
}

class PencarianResult extends StatelessWidget {
  const PencarianResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PencarianBloc, PencarianState>(
        builder: (context, state) {
      if (state is PencarianLoading) {
        return Center(child: LoadingAnimationWidget.fallingDot(color: kWhite, size: 60));
      } else if (state is PencarianHasData) {
        final result = state.result;
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: result.length,
                  itemBuilder: ((context, index) {
                    final pencarian = result[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailComicPage.ROUTE_NAME,
                            arguments: pencarian.param);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                      imageUrl: pencarian.thumbnail,
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) {
                                        return Center(
                                            child: LoadingAnimationWidget.discreteCircle(color: kWhite, size: 20));
                                      },),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(pencarian.title,
                                          style: const TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      const SizedBox(height: 5),
                                      Text(pencarian.latestChapter,
                                          style: const TextStyle(
                                              color: kTextSecondColor,
                                              fontSize: 14)),
                                      const SizedBox(height: 5),
                                      Text(pencarian.description,
                                          style: const TextStyle(
                                              color: kTextSecondColor,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: kWhite, thickness: 2,),
                          ],
                        ),
                      ),
                    );
                  })),
            )
          ],
        );
      } else if (state is PencarianEmpty) {
        return Row(
          children: const [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Belum Ada Hasil Pencarian",
                    style: TextStyle(color: kWhite),
                  ),
                ))
          ],
        );
      } else if (state is PencarianError) {
        return Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    state.message,
                    style: TextStyle(color: kWhite),
                  ),
                ))
          ],
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
