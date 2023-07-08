
import 'package:ecommerce/domain/dataSource/auth_online_datasource.dart';
import 'package:ecommerce/domain/model/AuthResult.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthOnlineDataSource onlineDataSource;
  AuthRepositoryImpl(this.onlineDataSource);

  @override
  Future<AuthResult> Login(String email, String password) async{
    var response = await  onlineDataSource.Login(email, password);
    return response;
  }

  @override
  Future<AuthResult> Register(String name, String email, String password, String repassword, String phone) async{
    var response = await onlineDataSource.Register(name, email, password, repassword, phone);
    return response;
  }
}