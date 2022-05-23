import 'package:flutter/material.dart';
import 'package:messenger_app/main.dart';
import 'package:messenger_app/model/user_model.dart';
import 'package:messenger_app/model/message_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          widget.user.name,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 38,
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                    color: containerbackgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 20),
                  itemCount: chats.length,
                  itemBuilder: (BuildContext c, int index) {
                    final Message message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;

                    return Container(
                        margin: isMe
                            ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
                            : EdgeInsets.only(top: 8, bottom: 8, right: 80),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                            color: isMe
                                ? backgroundColor.withOpacity(.5)
                                : backgroundColor.withOpacity(.3),
                            borderRadius: isMe
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))
                                : BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.time,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white24,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              message.text,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  letterSpacing: 1.2),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            color: containerbackgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.photo_library,
                        ),
                        iconSize: 25,
                        color: Colors.white54,
                        onPressed: () {}),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'send your message',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white24,
                              letterSpacing: 1,
                            )),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.send,
                        ),
                        iconSize: 25,
                        color: Colors.white54,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}