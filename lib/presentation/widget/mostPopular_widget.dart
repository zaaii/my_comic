import 'package:flutter/material.dart';
import 'package:my_comic/const/color.dart';

class mostPopularSub_widget extends StatelessWidget {
  const mostPopularSub_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Most Popular Comics',
                  style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(
                'Lots of interesting comics here ~',
                style: TextStyle(color: kTextSecondColor),
              ),
            ],
          ),
          InkWell(
            child: Row(
              children: [
                Text('Show more', style: TextStyle(color: kTextSecondColor)),
                Icon(Icons.navigate_next_outlined, color: kWhite)
              ],
            ),
          ),
        ],
      ),
    );
  }
}