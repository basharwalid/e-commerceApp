import 'package:ecommerce/domain/model/AuthResultDto.dart';

abstract class AuthRepository{
  Future<AuthResultDto> Login(String email , String password);
  Future<AuthResultDto> Register(String name , String email , String password , String repassword , String phone);
}