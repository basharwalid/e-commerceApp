import 'dart:math';

import 'package:ecommerce/api/api_manager/ApiManager.dart';
import 'package:ecommerce/api/response/Loginresponse/LoginResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/dataSource/auth_online_dataSource.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/customException/NewtorkException.dart';
import '../../domain/customException/ServerErrorException.dart';
import '../../domain/dataSource/auth_online_datasource.dart';
import '../../domain/model/AuthResultDto.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginViewModel extends Cubit<LoginViewState>{
  late ApiManager apiManager = ApiManager();
  late AuthRepository authRepository = authRepositoryimpl(onlineDataSource);
  late AuthOnlineDataSource onlineDataSource = AuthOnlineDataSourceImpl(apiManager);
  late LoginUseCase loginUseCase;
  LoginViewModel():super(InitialState()){
    apiManager = apiManager;
    authRepository = authRepositoryimpl(onlineDataSource);
    onlineDataSource = AuthOnlineDataSourceImpl(apiManager);
    loginUseCase = LoginUseCase(authRepository);
  }

  void login(String email , String password)async{
    try{
      emit(LoadingState(LoadingMessage: "Loading..."));
      var response = await loginUseCase.Invoke(email, password);
      emit(SuccessState(response));
  }on ServerErrorException catch (ex) {
      emit(FailState(message: ex.errormessage , exception: ex));
    }on NetworkException catch (ex){
      emit(FailState(message: "please Check your internet connection" , exception: ex));
    }

  }
}

abstract class LoginViewState{}
class InitialState extends LoginViewState{}
class LoadingState extends LoginViewState{
  String? LoadingMessage;
  LoadingState({this.LoadingMessage});
}
class SuccessState extends LoginViewState{
  AuthResultDto response;
  SuccessState(this.response);
}
class FailState extends LoginViewState{
  String? message;
  Exception? exception;
  FailState({this.message , this.exception});
}
