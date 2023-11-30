import 'package:chatroom/service/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:chatroom/utils/constants.dart';
// import 'package:chatroom/views/setup/setup_page.dart';
import 'package:chatroom/views/chatlist.dart';
import 'package:chatroom/views/chat/chat_page.dart';
import 'package:chatroom/service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:chatroom/service/streamSocket.dart';

void main() async {
  await NotificationService().init(); // 最新這行要加在最一開始main()的地方

  runApp(StreamProvider(
      create: (BuildContext context) {
        return StreamSocket.getResponse;
      },
      initialData: '',
      child: const QuickChatApp()));
  // 最新要runAPP()的時候要加StreanProvider這段
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
