import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/model/Category.dart';

import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  Category category;
  CategoryItemWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            width: 80 , height: 80,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(80),
              image: DecorationImage(image: NetworkImage(category.image??"") , fit: BoxFit.cover),
            ),
          ),
          imageUrl: category.image??"",
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) =>const Center(child: Icon(Icons.error , color: Colors.red,),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            category.name??"" ,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500  , fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
