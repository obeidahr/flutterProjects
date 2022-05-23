import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  title: 'Flutter Landing Page',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: Home(),
);
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD)
          ]
        )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
          ],
        ),
      ),
      
    );
  }
}

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFC86DD7),
                  Color(0xFF3023AE),
                ],
                begin: Alignment.bottomRight,end: Alignment.topLeft
              )
            ),
            child: Center(
              child: Text("T",style: TextStyle(fontSize: 30,color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}