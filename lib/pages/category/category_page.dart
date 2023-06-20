import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import '../../../models/dishes.dart';
import '../../../ui/dish_card.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons_icons.dart';
import '../../ui/buttons.dart';
import '../detail/detail_page.dart';
import 'bloc/category_bloc.dart';

class CategoryPage extends StatelessWidget {
  final String title;

  CategoryPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadedState) {
            return _buildLoadedBody(context, state);
          } else {
            return _buildLoadingBody();
          }
        },
      ),
    );
  }

  Widget _buildLoadedBody(
    BuildContext context,
    CategoryLoadedState state,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ClipOval(
                        child: Material(
                          color: Colors.transparent, // Button color
                          child: InkWell(
                            // Splash color
                            onTap: () {
                              context.pop();
                            },
                            child: SizedBox(
                              child: Icon(
                                AppIcons.arrow_back,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 44,
                        height: 44,
                        child: Image.asset(
                          A.assetsHomePageAvatarImg,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    clipBehavior: Clip.antiAlias,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext, int) {
                      return TagWidget(
                        index: int,
                        tags: state.tags,
                      );
                    },
                    separatorBuilder: (BuildContext, int) {
                      return Container(
                        width: 8,
                      );
                    },
                    itemCount: state.tags.length,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LayoutGrid(
                  columnSizes: [1.fr, 1.fr, 1.fr],
                  columnGap: 8,
                  rowSizes: List.generate(
                    state.dishes.dishes.length ~/ 2 + 1,
                    (index) => auto,
                  ),
                  rowGap: 14,
                  children: List.generate(
                    state.dishes.dishes.length,
                    (index) => DishWidget(
                      title: state.dishes.dishes[index].name,
                      imgUrl: state.dishes.dishes[index].imageUrl,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _buildDetailWidget(
                              context: context,
                              id: index,
                              price: state.dishes.dishes[index].price.toInt(),
                              description:
                                  state.dishes.dishes[index].description,
                              imgUrl: state.dishes.dishes[index].imageUrl,
                              title: state.dishes.dishes[index].name,
                              weight: state.dishes.dishes[index].weight.toInt(),
                              onTap: () {
                                context.read<CategoryBloc>().add(
                                      AddItemInBasketEvent(
                                        name: state.dishes.dishes[index].name,
                                        price: state.dishes.dishes[index].price
                                            .toInt(),
                                        weight: state
                                            .dishes.dishes[index].weight
                                            .toInt(),
                                        quantity: 1,
                                        imageUrl:
                                            state.dishes.dishes[index].imageUrl,
                                      ),
                                    );
                                context.pop();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }  

  Widget _buildDetailWidget({
    required int id,
    required String imgUrl,
    required String title,
    required int price,
    required int weight,
    required String description,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:
              MainAxisSize.min, // Adjusts the height based on its children
          children: [
            Stack(
              children: [
                Container(
                  height: 232,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.colorF8F7F5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: _buildCachedImg(imgUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Icon(
                                AppIcons.like,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.pop();
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Icon(
                                AppIcons.close,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${price} ₽ ',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '· ${weight}г',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Flexible(
              // Use Flexible widget to allow the text to wrap
              child: Text(
                '${description}',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 16),
            PrimaryButton(
              onTap: onTap,
              child: Text(
                'Добавить в корзину',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCachedImg(String imgUrl) {
    if (imgUrl != null) {
      return CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => Container(
          color: Colors.red,
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.red,
        ),
        height: 125,
        fit: BoxFit.fill,
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }

  Widget _buildLoadingBody() {
    return Container(color: Colors.transparent);
  }

  Widget TagWidget({required List<String> tags, required int index}) {
    final bool active = false;
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: active ? AppColors.color3364E0 : AppColors.colorF8F7F5,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Center(
          child: Text(
            tags[index],
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
