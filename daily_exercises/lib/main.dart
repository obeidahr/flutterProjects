import 'package:daily_exercises/constants.dart';
import 'package:daily_exercises/screen/meditation.dart';
import 'package:daily_exercises/widget/Category_card.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.deepOrange[100],
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"))
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      //child: SvgPicture.asset(),
                    ),
                  ),
                  Text("Good Mornine Shichpin",
                    style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: Container(
                      padding: EdgeInsets.symmetric( vertical: 5,horizontal: 30),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,size: 30,),
                          hintText: "Search",
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          CategoryCard(
                            icon: Icon(Icons.cake),
                            title: "Diet Recommendation",
                            press: (){},
                          ),
                          CategoryCard(
                            icon: Icon(Icons.deck_sharp),
                            title: "deck_sharp Recommendation",
                            press: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Meditation()));
                            },
                          ),
                          CategoryCard(
                            icon: Icon(Icons.sports_handball),
                            title: "sports_handball Recommendation",
                            press: (){},
                          ),
                          CategoryCard(
                            icon: Icon(Icons.local_grocery_store_sharp),
                            title: "store_sharp Recommendation",
                            press: (){},
                          ),  
                        ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}