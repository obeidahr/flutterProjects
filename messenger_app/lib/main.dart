import 'package:flutter/material.dart';
import 'package:messenger_app/model/widget/category_selector.dart';
import 'model/widget/favorite_contacts.dart';
import 'model/widget/menu_chats.dart';

void main() {
  runApp(MyApp());
}

final Color backgroundColor = Color(0xFF283F4D);
final Color containerbackgroundColor = Color(0xFF112734);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          onPressed: () {},
          color: Colors.white,
        ),
        title: Text('chats',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            )),
        actions: [
          IconButton(icon: Icon(Icons.search), iconSize: 30, onPressed: () {})
        ],
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: containerbackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Favorite Contacts',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white54,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.8),
                        ),
                        IconButton(
                            icon: Icon(Icons.more_horiz),
                            iconSize: 40,
                            color: Colors.white54,
                            onPressed: () {})
                      ],
                    ),
                  ),
                  FavoriteContacts(),
                  MenuChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}