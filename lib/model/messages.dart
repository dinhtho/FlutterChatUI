import 'package:flutter_chat_app/model/content.dart';
import 'package:flutter_chat_app/model/sender.dart';

class Messages {
  int id;
  int groupId;
  String type;
  int position;
  Content content;
  String createdAt;
  String updatedAt;
  int senderId;
  Sender sender;

  Messages.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        groupId = map["groupId"],
        type = map["type"],
        position = map["position"],
        content = Content.fromJsonMap(map["content"]),
        createdAt = map["createdAt"],
        updatedAt = map["updatedAt"],
        senderId = map["senderId"],
        sender =
            map["sender"] != null ? Sender.fromJsonMap(map["sender"]) : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['groupId'] = groupId;
    data['type'] = type;
    data['position'] = position;
    data['content'] = content == null ? null : content.toJson();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['senderId'] = senderId;
    data['sender'] = sender == null ? null : sender.toJson();
    return data;
  }
}
