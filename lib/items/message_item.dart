import 'package:flutter/material.dart';

class TextMessage extends StatefulWidget {
  @override
  _TextMessageState createState() => _TextMessageState();
}

class _TextMessageState extends State<TextMessage> {
  GlobalKey _key = GlobalKey();
  double _height;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBoxRed = _key.currentContext.findRenderObject();
      setState(() {
        _height = renderBoxRed.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(left: 5),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ritesh',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Colors.black54),
          ),
          Container(
            key: _key,
            height: _height,
            child: Stack(
              children: <Widget>[
                Text(
                  'Awesome, Joshua, it’s 204 Chinatown. Do give me a call when you reach?',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    '3:12 PM',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://www.cscbukitbatok.sg/img/play/tennis1.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            '3:12 PM',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
