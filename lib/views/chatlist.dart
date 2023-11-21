import 'package:chatroom/views/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'setup/setup_page.dart';
import 'package:chatroom/service/socket_service.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  final String name = '這裡是使用者名稱 userMall';
  final List<String> chatRooms = ["Chat Room 1", "Chat Room 2", "Chat Room 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Rooms")),
      body: ListView.builder(
        itemCount: chatRooms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chatRooms[index]),
            onTap: () {
              SocketService.setUserName(name);
              SocketService.setChatRoomId(chatRooms[index]); // 設定聊天室 ID
              SocketService.connectAndListen();
              _navigateToNameInput(context, chatRooms[index]);
            },
          );
        },
      ),
    );
  }

  void _navigateToNameInput(BuildContext context, String chatRoomName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(
          chatRoomId: chatRoomName,
        ),
      ),
    );
  }
}
