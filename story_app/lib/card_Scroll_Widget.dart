import 'dart:math';
import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';

// ignore: must_be_immutable
class CardScrollWidget extends StatelessWidget {

  var currentPage;
  var padding = 20.0;
  var verticalInset = 30.0;

  CardScrollWidget(this.currentPage);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRadio,
      child: LayoutBuilder(
        builder:(context,contraints){
        var width = contraints.maxWidth;
        // ignore: unused_local_variable
        var height = contraints.maxHeight;

        var safeWidth = width - 3 * padding;
        var safeHeight = width - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = cardAspectRatio * heightOfPrimaryCard;
      
        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        // ignore: deprecated_member_use
        List<Widget> cardList = new List();

        for(var i = 0;i < images.length; i++){
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta,0.0),
            bottom: padding + verticalInset * max(-delta,0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3, 6),
                      blurRadius: 10,
                    )
                  ]
                ),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(images[i],fit: BoxFit.cover,),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                              child: Text(title[i],style: TextStyle(color: Colors.white,fontSize: 25),),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 12,bottom: 12),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 22,vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)

                                ),
                                child: Text('Read Later',style: TextStyle(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                  ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}