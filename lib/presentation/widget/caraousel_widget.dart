import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_comic/const/color.dart';
import 'package:my_comic/presentation/pages/comicDetail_page.dart';
import 'package:my_comic/presentation/bloc/comic/comic_bloc.dart';

final List<String> imgList = [
  'https://www.xtrafondos.com/wallpapers/vertical/my-hero-academia-personajes-poster-3390.jpg',
  'https://i.pinimg.com/564x/62/51/d0/6251d02def34ea13ba96a0485ebe6dc1.jpg',
  'https://i.pinimg.com/564x/c3/9c/65/c39c6563b5729cd414c091fae63eb07a.jpg',
  'https://i.pinimg.com/564x/f1/3f/b1/f13fb17006a956e9c46b98e49e763657.jpg'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 300.0),
                ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(color: Colors.grey.withOpacity(0.4))),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Anime Title',
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('Action, Adventure, Comedy',
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          Text('Rating:',
                              style: TextStyle(
                                  color: kWhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                '8.0',
                                style: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),
                )
              ],
            )),
      ),
    )
    .toList();


class NewReleaseComic extends StatelessWidget {
  late ComicBloc _comicBloc;
  
  @override
  void initState() {
    _comicBloc = BlocProvider.of<ComicBloc>(context);
    _comicBloc.add(FetchComicEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: imgList.isEmpty 
      ? Center(child: CircularProgressIndicator(),)
      : CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imgList.map((url){
          return Builder(
            builder: (BuildContext context){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ComicDetailPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber
                  ),
                  child: Image.network(url, fit: BoxFit.cover),
                ),
              );
            },
          );
        }).toList()
      ),
    );
  }
}
