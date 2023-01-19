import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_comic/domain/entities/chapter.dart';
import 'package:my_comic/presentation/bloc/chapter/chapter_bloc.dart';
import 'package:my_comic/utils/color.dart';

class ReadPage extends StatefulWidget {
  static const String ROUTE_NAME = '/readPage';

  final String param;
  const ReadPage({Key? key, required this.param}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ChapterBloc>().add(FetchChapterEvent(widget.param));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: 
        PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
        ),
        body: BlocBuilder<ChapterBloc, ChapterState>(builder: (context, state) {
          if (state is ChapterLoading) {
            return Center(
              child: LoadingAnimationWidget.fallingDot(color: kWhite, size: 70),
            );
          } else if (state is ChapterHasData) {
            return ListView.builder(
                itemCount: state.result.data.length,
                itemBuilder: (context, index) {
                  final chapter = state.result;
                  return CachedNetworkImage(
                    imageUrl:  chapter.data[index],
                    placeholder: (context, url) => Center(
                      child: LoadingAnimationWidget.waveDots(color: kWhite, size: 30)
                    ),
                  );
                },);
          } else if (state is ChapterEmpty) {
            return const Center(
              child: Text("Detail Komik Tidak Ditemukan",
                  style: TextStyle(color: kWhite)),
            );
          } else if (state is ChapterError) {
            return Center(
              child: Text(state.message,
                  style: const TextStyle(color: kWhite)),
            );
          } else {
            return const Center(
              child: Text('Oops, Coba kembali ya ;(',
                  style: TextStyle(color: kWhite)),
            );
          }
        }));
  }
}
