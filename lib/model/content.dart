
class Content {

  String text;
  String url;

	Content.fromJsonMap(Map<String, dynamic> map){
		text = map["text"];
		url = map["url"];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = text;
		return data;
	}
}
