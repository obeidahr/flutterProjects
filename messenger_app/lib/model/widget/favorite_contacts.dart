import 'package:flutter/material.dart';
import 'package:messenger_app/model/message_model.dart';
import 'package:messenger_app/model/widget/chat_screen.dart';

class FavoriteContacts extends StatefulWidget {
  @override
  State<FavoriteContacts> createState() => _FavoriteContactsState();
}

class _FavoriteContactsState extends State<FavoriteContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 15),
          scrollDirection: Axis.horizontal,
          itemCount: favorite.length,
          itemBuilder: (BuildContext c, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatScreen(
                              user: favorite[index],
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(favorite[index].imageUrl),
                      ),
                    ),
                    Text(
                      favorite[index].name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white38,
                          letterSpacing: 0.8),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
