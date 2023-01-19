import 'package:flutter/material.dart';
import 'package:my_comic/utils/color.dart';

class HotReleaseHeaderWidget extends StatelessWidget {
  const HotReleaseHeaderWidget({
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
              Text('Hot Release !',
                  style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text(
                'Read latest hot comics',
                style: TextStyle(color: kTextSecondColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}