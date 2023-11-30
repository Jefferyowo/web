import 'package:chatroom/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<dynamic>> selectAll(
      {required Map<String, dynamic> content, required String chatID}) async {
    final url = Uri.parse(
        "http://163.22.17.145:3000/api/message/getAllMessage/$chatID");
    final response = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(content),
    );
    final serverJourney = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      print('成功抓到歷史訊息');
      return serverJourney;
    } else {
      print('成功抓到歷史訊息');
      print('失敗 $serverJourney response.statusCode ${response.statusCode}');
      return serverJourney;
    }
  }
}
