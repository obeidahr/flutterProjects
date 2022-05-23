import 'package:flutter/material.dart';
import 'package:messenger_app/main.dart';
import 'package:messenger_app/model/message_model.dart';
import 'package:messenger_app/model/widget/chat_screen.dart';

class MenuChats extends StatefulWidget {
  @override
  State<MenuChats> createState() => _MenuChatsState();
}

class _MenuChatsState extends State<MenuChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.2),
        ),
        child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: chats.length,
            itemBuilder: (BuildContext c, int index) {
              final Message chat = chats[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChatScreen(
                                  user: chat.sender,
                                )));
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: chat.unread
                          ? backgroundColor.withOpacity(.5)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage(chat.sender.imageUrl),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                      letterSpacing: 0.8),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  chat.text,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                      letterSpacing: 0),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    chat.time,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  chat.unread
                                      ? Container(
                                          height: 30,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Text('NEW',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white))))
                                      : Text('')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
