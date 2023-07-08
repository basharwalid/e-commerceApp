import 'package:ecommerce/domain/model/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserProvider extends Cubit<CurrentUserState>{
  UserProvider():super(LoggedOutState());
  void Login(LoggedInState){
    emit(LoggedInState);
  }
  bool isUserLoggedIn(){
    return state is LoggedInState;
  }
  void Loggedout(LoggedOutState){
    emit(LoggedOutState);
  }
}

abstract class CurrentUserState{}
class LoggedInState extends CurrentUserState{
  String token;
  User user;
  LoggedInState(this.user , this.token);
}
class LoggedOutState extends CurrentUserState {}