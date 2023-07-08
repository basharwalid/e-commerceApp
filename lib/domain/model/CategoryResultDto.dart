import 'package:ecommerce/domain/model/CategoryDto.dart';
import 'package:ecommerce/domain/model/paginationDto.dart';

class CategoryResultDto{
  PaginationDto? paginationDto;
  List<CategoryDto>? categoriesList;
  CategoryResultDto({this.categoriesList, this.paginationDto});
}