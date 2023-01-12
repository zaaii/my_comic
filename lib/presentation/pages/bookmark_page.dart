import 'package:flutter/material.dart';
import 'package:my_comic/utils/color.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
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
                  'Bookmark Page',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          )),
    );
  }
}