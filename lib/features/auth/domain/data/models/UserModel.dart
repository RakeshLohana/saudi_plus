import 'dart:convert';
/// email : "string"
/// password : "string"

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      String? email, 
      String? password,}){
    _email = email;
    _password = password;
}

  UserModel.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
  }
  String? _email;
  String? _password;
UserModel copyWith({  String? email,
  String? password,
}) => UserModel(  email: email ?? _email,
  password: password ?? _password,
);
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}