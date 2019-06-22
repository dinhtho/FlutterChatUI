import 'package:flutter/material.dart';
import 'package:flutter_chat_app/items/message_item.dart';

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
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              return _buildMessage(i);
            }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _buildMessage(int i) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'https://s3.ap-southeast-1.amazonaws.com/dev.rovo.co/profiles/pictures/small/4_1560159781663.jpeg',
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.topStart,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: Colors.black26,
                  )),
              child: i % 2 == 0 ? TextMessage() : ImageMessage(),
            ),
          )
        ],
      ),
    );
  }
}
