import 'package:ecommerce/domain/model/CategoryResultDto.dart';

abstract class CategoriesRepository{
  Future<CategoryResult> getCategories({int page =1 , int limit = 20 , String? categorySlug });
}