import 'package:ecommerce/data/api/api_manager/ApiManager.dart';
import 'package:ecommerce/domain/dataSource/categories_online_dataSource.dart';
import 'package:ecommerce/domain/model/CategoryResultDto.dart';

class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<CategoryResult> getCategories({int page =1 , int limit = 20 , String? categorySlug }) async{
    var data = await apiManager.getCategories(categorySlug: categorySlug , limit: limit , page: page);
    return CategoryResult(
      categoriesList: data.data?.map((entity) => entity.toDomain()).toList(),
      paginationDto: data.pagination?.toPaginationDto()
    );
  }
}