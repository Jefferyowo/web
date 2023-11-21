import 'package:flutter/material.dart';
import 'package:chatroom/utils/constants.dart';
// import 'package:chatroom/views/setup/setup_page.dart';
import 'package:chatroom/views/chatlist.dart';
import 'package:chatroom/views/chat/chat_page.dart';

void main() {
  runApp(const QuickChatApp());
}

class QuickChatApp extends StatelessWidget {
  const QuickChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // routes: {'/ChatPage': (context) => ChatPage()},
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ChatListView());
  }
}
