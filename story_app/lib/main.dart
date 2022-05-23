import 'package:flutter/material.dart';
import 'card_Scroll_Widget.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRadio = cardAspectRatio * 1.2;

class _HomeState extends State<Home> {

  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController contro = PageController(initialPage: images.length - 1);
    contro.addListener(() {
      setState(() {
        currentPage = contro.page;             
      });
    });
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 30,right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu_book,size: 30,color: Colors.white,),
                    onPressed: (){}
                  ),
                  IconButton(
                    icon: Icon(Icons.search,size: 30,color: Colors.white,),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending',
                    style: 
                    TextStyle(fontSize: 46,color: Colors.white,
                      letterSpacing: 1,fontFamily: 'Calibre-Semibold'),),
                  IconButton(icon: Icon(Icons.open_in_new_outlined,size: 30,color: Colors.white,), onPressed: (){})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:Color(0xFFff6e6e),
                      borderRadius: BorderRadius.circular(20) 
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 6),
                        child: Text('Animated',
                          style: TextStyle(color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text('25+ stories',style: TextStyle(color: Colors.blueAccent,))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child:PageView.builder(
                      itemCount: images.length,
                      controller: contro,
                      reverse: true,
                      itemBuilder: (context,index){
                        return Container(
                        );
                      }) )  
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Favourite',
                    style: 
                    TextStyle(fontSize: 46,color: Colors.white,
                      letterSpacing: 1,fontFamily: 'Calibre-Semibold'),),
                  IconButton(icon: Icon(Icons.favorite_border,size:35,color: Colors.white,), onPressed: (){})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20) 
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 6),
                        child: Text('Latest',
                          style: TextStyle(color: Colors.white,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text('9+ stories',style: TextStyle(color: Colors.blueAccent,))
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/image_02.jpg',width: 296.0,height: 222.0,)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}