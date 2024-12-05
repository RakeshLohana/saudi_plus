import 'dart:convert';
/// statusCode : 0
/// message : "string"
/// payload : {"accessToken":"string","refreshToken":"string","expiry":"2024-12-05T07:00:00.812Z","data":{"id":"3fa85f64-5717-4562-b3fc-2c963f66afa6","email":"string","displayName":"string"}}

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));
String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());
class LoginResponseModel {
  LoginResponseModel({
      num? statusCode, 
      String? message, 
      Payload? payload,}){
    _statusCode = statusCode;
    _message = message;
    _payload = payload;
}

  LoginResponseModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }
  num? _statusCode;
  String? _message;
  Payload? _payload;
LoginResponseModel copyWith({  num? statusCode,
  String? message,
  Payload? payload,
}) => LoginResponseModel(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  payload: payload ?? _payload,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  Payload? get payload => _payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    return map;
  }

}

/// accessToken : "string"
/// refreshToken : "string"
/// expiry : "2024-12-05T07:00:00.812Z"
/// data : {"id":"3fa85f64-5717-4562-b3fc-2c963f66afa6","email":"string","displayName":"string"}

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      String? accessToken, 
      String? refreshToken, 
      String? expiry, 
      Data? data,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _expiry = expiry;
    _data = data;
}

  Payload.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _expiry = json['expiry'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _accessToken;
  String? _refreshToken;
  String? _expiry;
  Data? _data;
Payload copyWith({  String? accessToken,
  String? refreshToken,
  String? expiry,
  Data? data,
}) => Payload(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
  expiry: expiry ?? _expiry,
  data: data ?? _data,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get expiry => _expiry;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    map['expiry'] = _expiry;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "3fa85f64-5717-4562-b3fc-2c963f66afa6"
/// email : "string"
/// displayName : "string"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? email, 
      String? displayName,}){
    _id = id;
    _email = email;
    _displayName = displayName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _displayName = json['displayName'];
  }
  String? _id;
  String? _email;
  String? _displayName;
Data copyWith({  String? id,
  String? email,
  String? displayName,
}) => Data(  id: id ?? _id,
  email: email ?? _email,
  displayName: displayName ?? _displayName,
);
  String? get id => _id;
  String? get email => _email;
  String? get displayName => _displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['displayName'] = _displayName;
    return map;
  }

}