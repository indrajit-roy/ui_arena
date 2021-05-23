import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_arena/Instagram/Providers/Auth.dart';

import 'package:socket_io_client/socket_io_client.dart' as IOClient;

class ChatView extends StatefulWidget {
  final QueryDocumentSnapshot<Object> user;
  ChatView({Key key, this.user}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  IOClient.Socket socket;
  List<Map<String, String>> chatMessages = [];
  String message;

  void connectWithSocketServer() {
    socket = IOClient.io('http://10.0.2.2:3001', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    print(socket.connected);

    socket.onConnect((onConnectData) {
      print(socket.connected);
      print("SOCKET CONNECTED : $onConnectData");

      socket.emit('signIn',
          Provider.of<Auth>(context, listen: false).instance.currentUser.uid);

      socket.on('message', (data) {
        print('Receiving message $data');
        setState(() {
          chatMessages
              .add({'source': data['sourceId'], 'message': data['message']});
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    connectWithSocketServer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // socket.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: chatMessages[index]['source'] ==
                            Provider.of<Auth>(context, listen: false)
                                .instance
                                .currentUser
                                .uid
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                        "${chatMessages[index]['source']} : ${chatMessages[index]['message']}"),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter chat here'),
                  onChanged: (value) {
                    message = value;
                  },
                ),
              ),
              TextButton.icon(
                  onPressed: () {
                    socket.emit('message', {
                      'message': message,
                      'sourceId': Provider.of<Auth>(context, listen: false)
                          .instance
                          .currentUser
                          .uid,
                      'targetId': widget.user['uid']
                    });
                    setState(() {
                      chatMessages.add({
                        'source': context.read<Auth>().instance.currentUser.uid,
                        'message': message
                      });
                    });
                  },
                  icon: Icon(Icons.send),
                  label: Text('SEND'))
            ],
          )
        ],
      ),
    );
  }
}
