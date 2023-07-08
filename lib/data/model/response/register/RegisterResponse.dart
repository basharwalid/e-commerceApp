import 'package:ecommerce/data/model/UserDTO.dart';
import 'package:ecommerce/domain/model/AuthResult.dart';


import 'ServerErrorEntity.dart';
class RegisterResponse {
  RegisterResponse({
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? UserDTO.fromJson(json['data']) : null;
    token = json['token'];
    error =  json['errors'] != null ? ServerErrorEntity.fromJson(json["errors"]):null;
  }
  UserDTO? user;
  String? token;
  String? message;
  String? statusMsg;
  ServerErrorEntity? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  bool isSucces(){
    return statusMsg!= 'fail' && error == null;
  }
  String getErrorMessage(){
    return (message ?? error?.msg) ?? "";
  }

  AuthResult toAuthResultDto(){
    return AuthResult(
      user: user?.toUserDTo(),
      token: token
    );
  }
}