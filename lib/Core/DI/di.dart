import 'package:ecommerce/data/api/api_manager/ApiManager.dart';
import 'package:ecommerce/data/dataSource/auth_online_dataSource.dart';
import 'package:ecommerce/data/dataSource/categories_online_dataSource_impl.dart';
import 'package:ecommerce/data/repository/auth_repository.dart';
import 'package:ecommerce/data/repository/categories_repository.dart';
import 'package:ecommerce/domain/dataSource/auth_online_datasource.dart';
import 'package:ecommerce/domain/dataSource/categories_online_dataSource.dart';
import 'package:ecommerce/domain/repository/Categories_repository.dart';
import 'package:ecommerce/domain/repository/auth_repository.dart';

ApiManager getApiManager(){
  return ApiManager.getApiManager();
}

AuthOnlineDataSource getOnlineDataSource(ApiManager apiManager){
  return AuthOnlineDataSourceImpl(apiManager);
}

AuthRepository getAuthRepository(AuthOnlineDataSource authOnlineDataSource){
  return AuthRepositoryImpl(authOnlineDataSource);
}

AuthRepository injectAuthRepo(){
  return getAuthRepository(getOnlineDataSource(getApiManager()));
}


CategoriesOnlineDataSource  getCategoryDataSource(ApiManager apiManager){
  return CategoriesOnlineDataSourceImpl(apiManager);
}

CategoriesRepository getCategoryRepository(CategoriesOnlineDataSource dataSource){
  return CategoriesRepositoryImpl(dataSource);
}

CategoriesRepository injectCategoryRepo(){
  return getCategoryRepository(getCategoryDataSource(getApiManager()));
}

