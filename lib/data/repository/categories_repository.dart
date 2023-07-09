
import 'package:ecommerce/domain/model/CategoryResult.dart';
import 'package:ecommerce/domain/repository/Categories_repository.dart';

import '../../domain/dataSource/categories_online_dataSource.dart';

class CategoriesRepositoryImpl implements CategoriesRepository{
  CategoriesOnlineDataSource dataSource;
  CategoriesRepositoryImpl(this.dataSource);
  @override
  Future<CategoryResult> getCategories({int page = 1, int limit = 20, String? categorySlug}) {
    return dataSource.getCategories(
      page: page,
      limit: limit,
      categorySlug: categorySlug
    );
  }

}