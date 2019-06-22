
class Sender {

  String name;
  String pulseLevel;
  int id;
  String firstName;
  String lastName;
  int pulsePoints;
  String picture;
  String city;
  String status;
  String username;

	Sender.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		pulseLevel = map["pulseLevel"],
		id = map["id"],
		firstName = map["firstName"],
		lastName = map["lastName"],
		pulsePoints = map["pulsePoints"],
		picture = map["picture"],
		city = map["city"],
		status = map["status"],
		username = map["username"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['pulseLevel'] = pulseLevel;
		data['id'] = id;
		data['firstName'] = firstName;
		data['lastName'] = lastName;
		data['pulsePoints'] = pulsePoints;
		data['picture'] = picture;
		data['city'] = city;
		data['status'] = status;
		data['username'] = username;
		return data;
	}
}
