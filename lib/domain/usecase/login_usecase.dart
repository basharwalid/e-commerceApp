import 'package:ecommerce/api/response/Loginresponse/LoginResponse.dart';
import 'package:ecommerce/domain/model/AuthResultDto.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository repository;
  LoginUseCase(this.repository);

  Future<AuthResultDto> Invoke(String email ,String password)async{
    return repository.Login(email, password);
  }
}