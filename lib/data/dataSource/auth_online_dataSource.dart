
import 'package:ecommerce/data/api/api_manager/ApiManager.dart';
import 'package:ecommerce/domain/dataSource/auth_online_datasource.dart';
import 'package:ecommerce/domain/model/AuthResult.dart';

class AuthOnlineDataSourceImpl implements AuthOnlineDataSource{
  ApiManager apiManager;
  AuthOnlineDataSourceImpl(this.apiManager); //dependency
  @override
  Future<AuthResult> Login(String email, String password) async{
      var response  = await apiManager.login(email, password);
      return response.toDomain();
  }

  @override
  Future<AuthResult> Register(String name, String email, String password, String repassword, String phone) async{
      var response = await apiManager.register(name, email, phone, password, repassword);
      return response.toAuthResultDto();
  }

}