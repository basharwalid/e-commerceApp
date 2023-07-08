import 'package:ecommerce/domain/repository/auth_repository.dart';

import '../model/AuthResultDto.dart';

class RegisterUseCase{
  AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<AuthResultDto> Invoke(String name , String email ,  String phone , String password , String repassword)async{
     return repository.Register(name, email, password, repassword, phone);
  }
}
