import 'package:ecommerce/api/api_manager/ApiManager.dart';
import 'package:ecommerce/api/response/register/RegisterResponse.dart';
import 'package:ecommerce/data/dataSource/auth_online_dataSource.dart';
import 'package:ecommerce/domain/customException/NewtorkException.dart';
import 'package:ecommerce/domain/customException/ServerErrorException.dart';
import 'package:ecommerce/domain/dataSource/auth_online_datasource.dart';
import 'package:ecommerce/domain/model/AuthResultDto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repository.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/register_usecase.dart';


class RegisterViewModel extends Cubit<RegisterViewState>{
  late ApiManager apiManager = ApiManager();
  late AuthRepository authRepository = authRepositoryimpl(onlineDataSource);
  late AuthOnlineDataSource onlineDataSource = AuthOnlineDataSourceImpl(apiManager);
  late RegisterUseCase registerUseCase;
  RegisterViewModel():super(InitialState()){
   apiManager = apiManager;
   authRepository = authRepositoryimpl(onlineDataSource);
   onlineDataSource = AuthOnlineDataSourceImpl(apiManager);
   registerUseCase = RegisterUseCase(authRepository);
  }

  void Register(String name , String email , String password , String repassword , String phone)async {
    try {
      emit(LoadingState(LoadingMessage: "Loading..."));
      var response = await registerUseCase.Invoke(name, email, phone, password, repassword);
      emit(SuccessState(response));
    }on ServerErrorException catch (ex) {
      emit(FailState(message: ex.errormessage , exception: ex));
    }on NetworkException catch (ex){
      emit(FailState(message: "please Check your internet connection" , exception: ex));
    }
  }
}

abstract class RegisterViewState{}
class InitialState extends RegisterViewState{}
class LoadingState extends RegisterViewState{
  String? LoadingMessage;
  LoadingState({this.LoadingMessage});
}
class SuccessState extends RegisterViewState{
  AuthResultDto response;
  SuccessState(this.response);
}
class FailState extends RegisterViewState{
  String? message;
  Exception? exception;
  FailState({this.message , this.exception});
}
