import 'package:ecommerce/domain/model/AuthResultDto.dart';

import '../../User.dart';


/// message : "success"
/// user : {"name":"bashar walid","email":"basharwalid2002@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YTM4NmY5OTVmY2UwNDQxZDc4Y2ZmMSIsIm5hbWUiOiJiYXNoYXIgd2FsaWQiLCJyb2xlIjoidXNlciIsImlhdCI6MTY4ODQ0MDcwNiwiZXhwIjoxNjk2MjE2NzA2fQ.jj4lQFLCZjYfkXd1Ir5qJDEDRN-dGnndvRqG4EKsMeQ"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  bool isSuccess(){
    return statusMsg != 'fail';
  }

  AuthResultDto toAuthResultDto(){
  return AuthResultDto(
    user: user?.toUserDTo(),
    token: token,
  );
}
}