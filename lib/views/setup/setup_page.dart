// import 'package:flutter/material.dart';
// import 'package:chatroom/service/socket_service.dart';
// import 'package:chatroom/utils/constants.dart';
// import 'package:chatroom/views/chat/chat_page.dart';

// class SetupPage extends StatelessWidget {
//   final String chatRoomId;
//   const SetupPage({Key? key, required this.chatRoomId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var name = '';

//     proceed() {
//       if (name.length < 3) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text('Please Input at least 3 characters!')));
//       } else {
//         SocketService.setUserName(name);
//         SocketService.setChatRoomId(chatRoomId); // 設定聊天室 ID
//         SocketService.connectAndListen();
//         // SocketService.getChatMessages();
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => ChatPage(
//             chatRoomId: chatRoomId,
//           ),
//         ));
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text(appName)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 50,
//               width: size.width * 0.6,
//               child: TextField(
//                 textAlign: TextAlign.center,
//                 autofocus: true,
//                 onChanged: (s) {
//                   name = s;
//                 },
//                 onSubmitted: (s) => proceed(),
//                 decoration: const InputDecoration(
//                     hintText: 'Enter Your Name',
//                     border: OutlineInputBorder(),
//                     focusedBorder: OutlineInputBorder()),
//               ),
//             ),
//             const SizedBox(height: 12),
//             ElevatedButton(
//                 onPressed: () => proceed(), child: const Text('Proceed')),
//             SizedBox(height: size.height * 0.3),
//             const Text(
//               'Made with Flutter and Node.js',
//               style: TextStyle(fontSize: 11, color: Colors.grey),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
