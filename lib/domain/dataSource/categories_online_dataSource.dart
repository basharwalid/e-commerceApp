import 'package:ecommerce/domain/model/CategoryResult.dart';

abstract class CategoriesOnlineDataSource{
  Future<CategoryResult> getCategories({int page =1 , int limit = 20 , String? categorySlug });
}