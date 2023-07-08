
import '../model/AuthResult.dart';

abstract class AuthOnlineDataSource{
  Future<AuthResult> Login(String email , String password);
  Future<AuthResult> Register(String name , String email , String password , String repassword , String phone);
}