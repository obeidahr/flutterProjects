import 'package:flutter/material.dart';

import '../constants.dart';

class Session extends StatelessWidget {
  final String title;
  final Function press;
  const Session({
    Key key, this.title, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.transparent,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: kShadowColor,
            
            ),
          ],
              borderRadius: BorderRadius.circular(20)
            ),
            child: InkWell(
              onTap: press,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.video_collection),
                  Text(title)
                ],
              ),
            ),
          ),
      ),
    );
  }
}