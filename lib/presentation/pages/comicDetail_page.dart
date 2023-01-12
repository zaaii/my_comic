import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_comic/utils/color.dart';

class DetailComicPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail_comic';
  const DetailComicPage({super.key});

  @override
  State<DetailComicPage> createState() => _DetailComicPageState();
}

class _DetailComicPageState extends State<DetailComicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: kWhite,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: kWhite,
                      size: 30,
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 300),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Under Construction',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Text(
                          'Detail Comic Page',
                          style: TextStyle(
                              color: kWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
