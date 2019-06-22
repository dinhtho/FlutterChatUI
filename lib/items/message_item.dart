import 'package:flutter/material.dart';
import 'package:flutter_chat_app/app_util.dart';
import 'package:flutter_chat_app/model/messages.dart';

class TextMessage extends StatelessWidget {
  final Messages message;
  bool _isMe = false;

  TextMessage(this.message);

  @override
  Widget build(BuildContext context) {
    _isMe = message.sender.name != AppUtil.ME;

    // TODO: implement build
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(5),
            decoration: _isMe
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.black26,
                    ))
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.teal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _isMe
                    ? Text(
                        message.sender.firstName,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Colors.black54),
                      )
                    : Container(),
                Container(
                  child: Wrap(
                    children: <Widget>[
                      Text(
                        message.content.text,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: _isMe ? Colors.black : Colors.white),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          AppUtil.convertDateTime2HH(message.updatedAt),
                          style: TextStyle(
                              color: _isMe ? Colors.black45 : Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  final Messages message;
  bool _isMe = false;

  ImageMessage(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.all(10),
      decoration: _isMe
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: Colors.black26,
              ))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.teal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              message.content.url,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            AppUtil.convertDateTime2HH(message.updatedAt),
            style: TextStyle(
                color: _isMe ? Colors.black45 : Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class SystemMessage extends StatelessWidget {
  final Messages message;

  SystemMessage(this.message);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppUtil.convertDateTime(message.updatedAt),
            style: TextStyle(
                color: Colors.black26,
                fontSize: 15,
                fontWeight: FontWeight.w800),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              message.content.text,
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
