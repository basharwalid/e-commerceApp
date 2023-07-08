import 'package:ecommerce/api/api_manager/ApiManager.dart';
import 'package:ecommerce/domain/model/CategoryResultDto.dart';

import '../../domain/dataSource/categories_online_dataSource.dart';

class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<CategoryResultDto> getCategories({int page =1 , int limit = 20 , String? categorySlug }) async{
    var data = await apiManager.getCategories(categorySlug: categorySlug , limit: limit , page: page);
    return CategoryResultDto(
      categoriesList: data.data?.map((entity) => entity.toCategoryDto()).toList(),
      paginationDto: data.pagination?.toPaginationDto()
    );
  }
}