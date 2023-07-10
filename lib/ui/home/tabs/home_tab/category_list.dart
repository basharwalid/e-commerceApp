import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/ui/home/tabs/home_tab/category_item.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  List<Category> categories;
  CategoryListWidget(this.categories);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: GridView.builder(
        physics:const BouncingScrollPhysics(),
        padding:const EdgeInsets.all(20),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2 ,
          childAspectRatio:1.5,
          crossAxisSpacing: 20 ,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => CategoryItemWidget(categories[index]),
        itemCount: categories.length,
      ),
    );
  }
}
