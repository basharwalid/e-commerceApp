
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/model/Pagination.dart';

class CategoryResult{
  Pagination? paginationDto;
  List<Category>? categoriesList;
  CategoryResult({this.categoriesList, this.paginationDto});
}