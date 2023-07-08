import 'package:ecommerce/api/response/Loginresponse/LoginResponse.dart';
import 'package:ecommerce/api/response/register/RegisterResponse.dart';
import 'package:ecommerce/domain/dataSource/auth_online_datasource.dart';
import 'package:ecommerce/domain/model/AuthResultDto.dart';
import '../../domain/repository/auth_repository.dart';


class authRepositoryimpl implements AuthRepository{
  AuthOnlineDataSource onlineDataSource;
  authRepositoryimpl(this.onlineDataSource);

  @override
  Future<AuthResultDto> Login(String email, String password) {
    return onlineDataSource.Login(email, password);
  }

  @override
  Future<AuthResultDto> Register(String name, String email, String password, String repassword, String phone) {
    return onlineDataSource.Register(name, email, password, repassword, phone);
  }
}