import 'package:ecommerce/domain/model/User.dart';

class AuthResult{
  User? user;
  String? token;
  AuthResult({this.user , this.token});
}