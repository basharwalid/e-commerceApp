
import 'package:ecommerce/data/api/api_manager/ApiManager.dart';
import 'package:ecommerce/data/dataSource/categories_online_dataSource_impl.dart';
import 'package:ecommerce/data/repository/categories_repository.dart';
import 'package:ecommerce/domain/customException/ServerErrorException.dart';
import 'package:ecommerce/domain/dataSource/categories_online_dataSource.dart';
import 'package:ecommerce/domain/model/CategoryResult.dart';
import 'package:ecommerce/domain/repository/Categories_repository.dart';
import 'package:ecommerce/domain/usecase/getCategoriesUseCase.dart';
import 'package:ecommerce/ui/login/login_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/customException/NewtorkException.dart';
import '../../../../domain/model/Category.dart';

class HomeTabViewModel extends Cubit<HomeTabViewState>{
  GetCategoriesUseCase getCategoriesUseCase;
  HomeTabViewModel(this.getCategoriesUseCase):super(InitialState());
  CategoryResult? _categoryResult;
  getAllCategories()async{
    emit(LoadingState());
      try{
        var result  = await getCategoriesUseCase.Invoke();
        _categoryResult = result;
        emit(SuccessState(result.categoriesList!));
      }on ServerErrorException catch (ex) {
        emit(FailState(message: ex.errormessage , exception: ex));
      }on NetworkException catch (ex){
        emit(FailState(message: "please Check your internet connection" , exception: ex));
      }
  }
}

abstract class HomeTabViewState{}
class InitialState extends HomeTabViewState{}
class LoadingState extends HomeTabViewState{
  String? LoadingMessage;
  LoadingState({this.LoadingMessage});
}
class SuccessState extends HomeTabViewState{
  List<Category> categoriesList;
  SuccessState(this.categoriesList);
}
class FailState extends HomeTabViewState{
  String? message;
  Exception? exception;
  FailState({this.message , this.exception});
}
