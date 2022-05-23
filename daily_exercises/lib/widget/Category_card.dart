import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function press;
  const CategoryCard({
    Key key, this.title, this.icon,this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
            offset: Offset(0,17),
            blurRadius: 17,
            spreadRadius: -23,
            color: kShadowColor,
            
            ),
          ]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  //SvgPicture.asset("assets/icons/Hamburger.svg")
                  Spacer(),
                  Icon(icon.icon,size: 70,),
                  Spacer(),
                  Text(title,
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),),                                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}