import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/data/api/interceptor/LoggingInterceptor.dart';
import 'package:ecommerce/data/model/request/LoginRequest.dart';
import 'package:ecommerce/data/model/request/RegisterRequest.dart';
import 'package:ecommerce/data/model/response/Loginresponse/LoginResponse.dart';
import 'package:ecommerce/data/model/response/categories/CategoriesResponse.dart';
import 'package:ecommerce/data/model/response/register/RegisterResponse.dart';
import 'package:ecommerce/domain/customException/NewtorkException.dart';
import 'package:ecommerce/domain/customException/ServerErrorException.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class ApiManager{

  static ApiManager? _instance;
  ApiManager._();
  static getApiManager(){
    _instance??= ApiManager._();
    return _instance;
  }

  static const String baseurl = "route-ecommerce.onrender.com";
  http.Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor()
  ]);
  Future<RegisterResponse>register(String name , String email, String phone, String password , String repassword)async{
      var uri = Uri.https(baseurl , "api/v1/auth/signup");
      try{
        var requestBody = RegisterRequest(name: name, email: email, phone: phone, password: password, repassword: repassword);
        var response = await client.post(uri , body:requestBody.toJson());
        var registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
        if(!registerResponse.isSucces()){
          throw ServerErrorException(errormessage: registerResponse.getErrorMessage() , httpResponseCode: response.statusCode);
        }
        return registerResponse;
      }on TimeoutException catch(e){
        throw NetworkException(errorMessage: "Timeout: please check your internet connection");
      } on HttpException catch(e){
        throw NetworkException(errorMessage: "Http exception: Couldn't reach server");
      }

  }
  Future<LoginResponse>login(String email, String password)async{
    var uri = Uri.https(baseurl , "api/v1/auth/signin");
    try{
      var requestBody = LoginRequest (email: email, password: password,);
      var response = await client.post(uri , body:requestBody.toJson());
      var loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      if(!loginResponse.isSuccess()){
        throw ServerErrorException(errormessage: loginResponse.message , statusMsg: loginResponse.statusMsg , httpResponseCode: response.statusCode);
      }
      return loginResponse;
    }on TimeoutException catch(e){
        throw NetworkException(errorMessage: "Timeout: please check your internet connection");
    } on HttpException catch(e){
      throw NetworkException(errorMessage: "Http exception: Couldn't reach server");
    }

  }
  Future<CategoriesResponse> getCategories({int page =1 , int limit = 20 , String? categorySlug })async{
    var uri = Uri.https(baseurl , "api/v1/categories" , {
        'limit' : '$limit',
        'page' :  '$page'
      }
    );
    try{
        var response  = await client.get(uri);
        return CategoriesResponse.fromJson(jsonDecode(response.body));

    }on TimeoutException catch(e){
      throw NetworkException(errorMessage: "Timeout: please check your internet connection");
    } on HttpException catch(e){
      throw NetworkException(errorMessage: "Http exception: Couldn't reach server");
    }
  }
}