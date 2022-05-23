import 'package:daily_exercises/constants.dart';
import 'package:daily_exercises/widget/session.dart';
import 'package:flutter/material.dart';

class Meditation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration( 
              //color: Colors.deepPurple[200],
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png")
                //,fit: BoxFit.fitWidth
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: Row(
                      children: [
                        Text('Meditation',
                          style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 130),
                    child: Text('3-10 MIN Courses',
                    style: Theme.of(context).textTheme.title.copyWith(fontSize: 15)),
                  ),
                  SizedBox(height: 20,),
                  Text('Live happier and healthier by learning the\nfundament of meditation and\nmindfuness'),
                  Padding(
                    padding: const EdgeInsets.only(top:25.0,right: 100),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: 210,
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,size: 35,),
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8),
                      child: GridView.count(
                        childAspectRatio: .99,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2,
                        children: [
                          Session(title: 'Session 01',press: (){},),
                          Session(title: 'Session 02',),
                          Session(title: 'Session 03',),
                          Session(title: 'Session 04',),
                          Session(title: 'Session 05',),
                          Session(title: 'Session 06',),
                          
                        ],
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20,right: 150),
                    child: Expanded(
                      child: Text('Medidation',style: Theme.of(context).textTheme.title.copyWith(fontSize: 20))),
                  )
                ],
              ),
            ),
          )
        ],),
    );
  }
}