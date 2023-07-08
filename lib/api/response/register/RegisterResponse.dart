import 'package:ecommerce/domain/model/AuthResultDto.dart';

import '../../User.dart';
import 'ServerErrorEntity.dart';
class RegisterResponse {
  RegisterResponse({
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    error =  json['errors'] != null ? ServerErrorEntity.fromJson(json["errors"]):null;
  }
  User? user;
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

  AuthResultDto toAuthResultDto(){
    return AuthResultDto(
      user: user?.toUserDTo(),
      token: token
    );
  }
}