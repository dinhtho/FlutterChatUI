import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app_util.dart';
import 'package:flutter_chat_app/items/message_item.dart';
import 'package:flutter_chat_app/model/chat_response.dart';
import 'package:flutter_chat_app/model/message_type.dart';
import 'package:flutter_chat_app/model/messages.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Messages>> getAssets() async {
    final stringRes =
        await DefaultAssetBundle.of(context).loadString('assets/chats.json');
    final response = ChatResponse.fromJsonMap(jsonDecode(stringRes));
    return response.messages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tennis buddies',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getAssets(),
          initialData: [],
          builder: (context, snapshot) {
            return ListView.builder(
                reverse: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return _buildMessage(snapshot.data[i]);
                });
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildMessage(Messages message) {
    Widget messageWidget;
    if (message.type == MessageType.TEXT) {
      messageWidget = TextMessage(message);
    } else if (message.type == MessageType.PHOTO) {
      messageWidget = ImageMessage(message);
    } else {
      messageWidget = SystemMessage(message);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          message?.sender?.name != AppUtil.ME &&
                  message.type != MessageType.SYSTEM
              ? ClipOval(
                  child: Image.network(
                    message.sender.picture,
                    width: 30,
                    height: 30,
                  ),
                )
              : Container(),
          messageWidget
        ],
      ),
    );
  }
}
