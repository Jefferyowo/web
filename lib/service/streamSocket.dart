import 'dart:async';
import 'package:chatroom/model/chat.dart';
import 'package:chatroom/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter/material.dart';
import 'notification_service.dart';

class StreamSocket {
  static final StreamController<Object> _socketResponse =
      StreamController<Object>();
  static Stream<Object> get getResponse => _socketResponse.stream;

  static final io.Socket _socket = io.io('http://163.22.17.145:3000',
      io.OptionBuilder().setTransports(['websocket']).build());

  static connectAndListen() async {
    print('CONNECT AND LISTEN');
    try {
      _socket.connect();
      _socket.onConnect((_) {
        print('============\nSOCKET 連線 成功\n============');
      });
      // 傳投票結果
      _socket.on('voteMessage', (data) {
        print(data);
        NotificationService().showNotificationAndroid('系統訊息', data.toString());
      });
    } catch (error) {
      print('ERROR :\n$error');
    }
  }
}
