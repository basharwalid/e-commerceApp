import 'package:ecommerce/domain/model/CategoryResultDto.dart';
import 'package:ecommerce/domain/repository/Categories_repository.dart';

class GetCategoriesUseCase{
  CategoriesRepository repository;
  GetCategoriesUseCase(this.repository);

  Future<CategoryResultDto> Invoke({String? keyword , int limit =20, int page =1}){
    return repository.getCategories();
  }
}