import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatService {
  static final _chatinstance = ChatService._internal();
  WebSocket? _socket;

  factory ChatService() => _chatinstance;

  ChatService._internal();
  final _searchResultCOntroller = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultController =>
      _searchResultCOntroller.stream;
  Stream<Map<String, dynamic>> get contentController =>
      _contentController.stream;
  void connect() {
    _socket = WebSocket(Uri.parse("ws://localhost:8000/ws"));

    _socket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_results') {
        _searchResultCOntroller.add(data);
      } else if (data['type'] == 'response') {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({"query": query}));
  }
}
