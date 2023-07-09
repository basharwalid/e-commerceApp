import 'package:ecommerce/domain/model/CategoryResult.dart';
import 'package:ecommerce/domain/repository/Categories_repository.dart';

class GetCategoriesUseCase{
  CategoriesRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<CategoryResult> Invoke({String? keyword , int limit =20, int page =1}){
    return repository.getCategories();
  }
}