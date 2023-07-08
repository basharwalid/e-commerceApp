import 'package:ecommerce/domain/repository/auth_repository.dart';

import '../model/AuthResult.dart';

class RegisterUseCase{
  AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<AuthResult> Invoke(String name , String email ,  String phone , String password , String repassword)async{
     return repository.Register(name, email, password, repassword, phone);
  }
}
