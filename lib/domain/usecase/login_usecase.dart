
import 'package:ecommerce/domain/model/AuthResult.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class LoginUseCase{
  AuthRepository repository;
  LoginUseCase(this.repository);

  Future<AuthResult> Invoke(String email ,String password)async{
    return repository.Login(email, password);
  }
}