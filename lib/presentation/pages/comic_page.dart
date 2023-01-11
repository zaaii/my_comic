import 'package:flutter/material.dart';
import 'package:my_comic/const/color.dart';

class ComicPage extends StatefulWidget {
  const ComicPage({super.key});

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.only(top: 300),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Under Construction',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  'Discover Page',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          )),
    );
  }
}
