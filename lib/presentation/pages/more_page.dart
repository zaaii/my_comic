import 'package:flutter/material.dart';
import 'package:my_comic/utils/color.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
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
                  'More Page',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          )),
    );;
  }
}