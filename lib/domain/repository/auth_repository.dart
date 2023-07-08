import 'package:ecommerce/domain/model/AuthResult.dart';

abstract class AuthRepository{
  Future<AuthResult> Login(String email , String password);
  Future<AuthResult> Register(String name , String email , String password , String repassword , String phone);
}