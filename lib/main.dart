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
        child: Column(
          children: <Widget>[
            Expanded(
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
            ),
            Container(
              height: 100,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 1,
                    color: Colors.black26,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black26,
                                width: 1,
                              )),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 0, top: 10, right: 0, bottom: 0),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey,
                                ),
                                hintText: 'Type message',
                                hintStyle: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 2,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.send,
                            color: Colors.grey,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
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
          Expanded(child: messageWidget)
        ],
      ),
    );
  }
}
