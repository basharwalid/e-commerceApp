import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Core/DI/di.dart';
import 'package:ecommerce/domain/usecase/getCategoriesUseCase.dart';
import 'package:ecommerce/ui/components/GenericErrorWidget.dart';
import 'package:ecommerce/ui/components/infiniteLoadingWidget.dart';
import 'package:ecommerce/ui/home/tabs/home_tab/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'home_tab_viewModel.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel =
      HomeTabViewModel(GetCategoriesUseCase(injectCategoryRepo()));
  @override
  void initState() {
    super.initState();
    viewModel.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabViewState>(
      bloc: viewModel,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return InfiniteLoadingWidget(state.LoadingMessage ?? "");
        }
        if (state is FailState) {
          return GenericErrorWidget(
              state.message ?? state.exception.toString());
        }
        if (state is SuccessState) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ImageSlideshow(
                  width: double.infinity,
                    height: 250,
                    isLoop: true,
                    children: state.categoriesList
                        .map((e) => Image.network(e.image! , fit: BoxFit.cover,))
                        .toList()

                ),
                CategoryListWidget(state.categoriesList)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
