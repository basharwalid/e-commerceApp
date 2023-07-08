import '../model/AuthResultDto.dart';

abstract class AuthOnlineDataSource{
  Future<AuthResultDto> Login(String email , String password);
  Future<AuthResultDto> Register(String name , String email , String password , String repassword , String phone);
}