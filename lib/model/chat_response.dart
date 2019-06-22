import 'package:flutter_chat_app/model/messages.dart';

class ChatResponse {

  List<Messages> messages;

	ChatResponse.fromJsonMap(Map<String, dynamic> map): 
		messages = List<Messages>.from(map["messages"].map((it) => Messages.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['messages'] = messages != null ? 
			this.messages.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
