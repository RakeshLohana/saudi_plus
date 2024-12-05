import 'dart:convert';
/// email : "string"
/// password : "string"
/// displayName : "string"
/// username : "string"
/// phoneNumber : "string"
/// address : "string"
/// deviceToken : "string"
/// dateOfBirth : "2024-12-05T10:16:28.969Z"
/// gender : 0
/// cityId : 0

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      String? email, 
      String? password, 
      String? displayName, 
      String? username, 
      String? phoneNumber, 
      String? address, 
      String? deviceToken, 
      String? dateOfBirth, 
      num? gender, 
      num? cityId,}){
    _email = email;
    _password = password;
    _displayName = displayName;
    _username = username;
    _phoneNumber = phoneNumber;
    _address = address;
    _deviceToken = deviceToken;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _cityId = cityId;
}

  RegisterModel.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _displayName = json['displayName'];
    _username = json['username'];
    _phoneNumber = json['phoneNumber'];
    _address = json['address'];
    _deviceToken = json['deviceToken'];
    _dateOfBirth = json['dateOfBirth'];
    _gender = json['gender'];
    _cityId = json['cityId'];
  }
  String? _email;
  String? _password;
  String? _displayName;
  String? _username;
  String? _phoneNumber;
  String? _address;
  String? _deviceToken;
  String? _dateOfBirth;
  num? _gender;
  num? _cityId;
RegisterModel copyWith({  String? email,
  String? password,
  String? displayName,
  String? username,
  String? phoneNumber,
  String? address,
  String? deviceToken,
  String? dateOfBirth,
  num? gender,
  num? cityId,
}) => RegisterModel(  email: email ?? _email,
  password: password ?? _password,
  displayName: displayName ?? _displayName,
  username: username ?? _username,
  phoneNumber: phoneNumber ?? _phoneNumber,
  address: address ?? _address,
  deviceToken: deviceToken ?? _deviceToken,
  dateOfBirth: dateOfBirth ?? _dateOfBirth,
  gender: gender ?? _gender,
  cityId: cityId ?? _cityId,
);
  String? get email => _email;
  String? get password => _password;
  String? get displayName => _displayName;
  String? get username => _username;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;
  String? get deviceToken => _deviceToken;
  String? get dateOfBirth => _dateOfBirth;
  num? get gender => _gender;
  num? get cityId => _cityId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['displayName'] = _displayName;
    map['username'] = _username;
    map['phoneNumber'] = _phoneNumber;
    map['address'] = _address;
    map['deviceToken'] = _deviceToken;
    map['dateOfBirth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['cityId'] = _cityId;
    return map;
  }

}