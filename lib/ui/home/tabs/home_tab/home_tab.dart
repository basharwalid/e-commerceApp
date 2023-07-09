import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/domain/usecase/getCategoriesUseCase.dart';
import 'package:ecommerce/ui/components/GenericErrorWidget.dart';
import 'package:ecommerce/ui/components/infiniteLoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_tab_viewModel.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel(GetCategoriesUseCase(injectCategoryRepo()));
  @override
  void initState() {
    super.initState();
    viewModel.getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel , HomeTabViewState>(
      bloc: viewModel,
      listener: (context, state) {

      },
      builder: (context, state) {
          if(state is LoadingState){
            return InfiniteLoadingWidget(state.LoadingMessage??"");
          }
          if(state is FailState){
            return GenericErrorWidget(state.message??state.exception.toString());
          }
          if(state is SuccessState) {
            return Column(
              children: [
                SizedBox(
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
                    itemBuilder: (context, index) => Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.categoriesList[index].image??"",
                          imageBuilder: (context, imageProvider) => Container(
                            width: 80 , height: 80,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(80),
                              image: DecorationImage(image: NetworkImage(state.categoriesList[index].image??"") , fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, error) =>const Center(child: Icon(Icons.error , color: Colors.red,),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            state.categoriesList[index].name??"" ,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500  , fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    itemCount: state.categoriesList.length,
                  ),
                ),
              ],
            );
          }
          return Container();
      },
    );
  }
}
