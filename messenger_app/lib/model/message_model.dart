import 'package:messenger_app/model/user_model.dart';

class Message {
  final User sender;
  final String text;
  final String time;
  final bool isLike;
  final bool unread;

  Message({
    this.sender,
    this.unread,
    this.isLike,
    this.text,
    this.time,
  });
}

final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/image01.jpg');
final User zezo = User(id: 1, name: 'zezo', imageUrl: 'assets/images/image01.jpg');
final User johan =
    User(id: 2, name: 'johan', imageUrl: 'assets/images/image03.jpg');
final User sara = User(id: 3, name: 'sara', imageUrl: 'assets/images/image02.jpg');
final User mohamad =
    User(id: 4, name: 'mohamad', imageUrl: 'assets/images/image04.jpg');
final User ahmad =
    User(id: 5, name: 'ahmad', imageUrl: 'assets/images/image05.jpg');

List<User> favorite = [mohamad, ahmad, sara, zezo, johan];

List<Message> chats = [
  Message(
      sender: johan,
      time: '7:03 PM',
      text: 'hello how are you? ',
      isLike: true,
      unread: false),
  Message(
      sender: zezo,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: false,
      unread: true),
  Message(
      sender: ahmad,
      time: '7:03 PM',
      text: 'hello how are you!',
      isLike: false,
      unread: false),
  Message(
      sender: sara,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: true,
      unread: true),
  Message(
      sender: mohamad,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: true,
      unread: false),
];

List<Message> messages = [
  Message(
      sender: johan,
      time: '7:03 PM',
      text: 'hello how are you? ',
      isLike: true,
      unread: false),
  Message(
      sender: currentUser,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: false,
      unread: true),
  Message(
      sender: currentUser,
      time: '7:03 PM',
      text: 'hello how are you!',
      isLike: false,
      unread: false),
  Message(
      sender: sara,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: true,
      unread: true),
  Message(
      sender: currentUser,
      time: '7:03 PM',
      text: 'hello how are you',
      isLike: true,
      unread: false),
];