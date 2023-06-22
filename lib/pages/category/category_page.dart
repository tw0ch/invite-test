import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../ui/dish_card.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons_icons.dart';
import '../../ui/buttons.dart';
import '../../ui/cached_img.dart';
import 'bloc/category_bloc.dart';

import 'package:flutter/foundation.dart';

class CategoryPage extends StatelessWidget {
  final String title;

  const CategoryPage({
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
            return _buildLoadingBody(context);
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
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                accentColor: AppColors.colorEFEEEC,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
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
                              child: const SizedBox(
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
                          style: const TextStyle(
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
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch(
                          accentColor: AppColors.colorEFEEEC,
                        ),
                      ),
                      child: ListView.separated(
                        clipBehavior: Clip.antiAlias,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          return TagWidget(
                            index: i,
                            tags: state.tags,
                            isActive: _checkIsActiveTag(
                              activeTagsIndexes: state.activeTagsIndexes,
                              index: i,
                            ),
                            onTap: () {
                              if (allowChanges(
                                  activeTagsIndexes: state.activeTagsIndexes,
                                  index: i)) {
                                final activeTagsIndexes =
                                    _changeActiveTagIndexes(
                                  activeTagsIndexes: state.activeTagsIndexes,
                                  index: i,
                                );
                                context.read<CategoryBloc>().add(
                                      FilterItemsByTagEvent(
                                        activeTagsIndexes: activeTagsIndexes,
                                        tags: state.tags,
                                      ),
                                    );
                              }
                            },
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
                  ),
                  const SizedBox(
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
                                price: state.dishes.dishes[index].price
                                    .toInt(),
                                description:
                                    state.dishes.dishes[index].description,
                                imgUrl: state.dishes.dishes[index].imageUrl,
                                title: state.dishes.dishes[index].name,
                                weight: state.dishes.dishes[index].weight
                                    .toInt(),
                                onTap: () {
                                  context.read<CategoryBloc>().add(
                                        AddItemInBasketEvent(
                                          id: state.dishes.dishes[index].id,
                                          name: state
                                              .dishes.dishes[index].name,
                                          price: state
                                              .dishes.dishes[index].price
                                              .toInt(),
                                          weight: state
                                              .dishes.dishes[index].weight
                                              .toInt(),
                                          quantity: 1,
                                          imageUrl: state.dishes
                                              .dishes[index].imageUrl,
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
      ),
    );
  }

  bool allowChanges({
    required List<int> activeTagsIndexes,
    required int index,
  }) {
    return true;
  }

  List<int> _changeActiveTagIndexes({
    required List<int> activeTagsIndexes,
    required int index,
  }) {
    if (activeTagsIndexes.contains(index) && activeTagsIndexes.length != 1) {
      activeTagsIndexes.remove(index);
      return activeTagsIndexes;
    } else if (activeTagsIndexes.contains(0) && index != 0) {
      activeTagsIndexes.remove(0);
      activeTagsIndexes.add(index);
      return activeTagsIndexes;
    } else if (!activeTagsIndexes.contains(0) && index == 0) {
      activeTagsIndexes.clear();
      activeTagsIndexes.add(0);
      return activeTagsIndexes;
    } else if (activeTagsIndexes.contains(index) &&
        activeTagsIndexes.length == 1) {
      activeTagsIndexes.clear();
      activeTagsIndexes.add(0);
      return activeTagsIndexes;
    } else {
      activeTagsIndexes.add(index);
      return activeTagsIndexes;
    }
  }

  bool _checkIsActiveTag({
    required int index,
    required List<int> activeTagsIndexes,
  }) {
    bool isActive = false;
    for (int i = 0; i < activeTagsIndexes.length; i++) {
      if (activeTagsIndexes[i] == index) {
        isActive = !isActive;
      }
    }
    return isActive;
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
      insetPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:
              MainAxisSize.min, // Adjusts the height based on its children
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 232,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.colorF8F7F5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CathedNetworkImgWidget(imgUrl: imgUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
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
                            child: const Icon(
                              AppIcons.like,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                            child: const Icon(
                              AppIcons.close,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${price} ₽ ',
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '· ${weight}г',
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Flexible(
              // Use Flexible widget to allow the text to wrap
              child: Text(
                '${description}',
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              onTap: onTap,
              child: Text(
                'Добавить в корзину',
                style: const TextStyle(
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

  Widget _buildLoadingBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.fromSwatch(
                accentColor: AppColors.colorEFEEEC,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 7,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipOval(
                          child: Material(
                            color: Colors.transparent, // Button color
                            child: InkWell(
                              // Splash color
                              onTap: () {},
                              child: const SizedBox(
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
                          style: const TextStyle(
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
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch(
                          accentColor: AppColors.colorEFEEEC,
                        ),
                      ),
                      child: ListView.separated(
                        clipBehavior: Clip.antiAlias,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int i) {
                          return Shimmer.fromColors(
                            baseColor: AppColors.colorF8F7F5,
                            highlightColor:
                                AppColors.colorA5A9B2.withOpacity(0.3),
                            child: Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                color: AppColors.colorF8F7F5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext, int) {
                          return Container(
                            width: 8,
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        accentColor: AppColors.colorEFEEEC,
                      ),
                      splashColor: AppColors.colorEFEEEC,
                    ),
                    child: GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: AppColors.colorEFEEEC,
                      child: LayoutGrid(
                        columnSizes: [1.fr, 1.fr, 1.fr],
                        columnGap: 8,
                        rowSizes: List.generate(
                          3,
                          (index) => auto,
                        ),
                        rowGap: 14,
                        children: List.generate(
                          5,
                          (index) => Shimmer.fromColors(
                            baseColor: AppColors.colorF8F7F5,
                            highlightColor:
                                AppColors.colorA5A9B2.withOpacity(0.3),
                            child: Container(
                              width: double.infinity,
                              height: 109,
                              decoration: BoxDecoration(
                                color: AppColors.colorF8F7F5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatefulWidget {
  final int index;
  final VoidCallback onTap;
  final List<String> tags;
  final bool isActive;

  const TagWidget({
    super.key,
    required this.index,
    required this.onTap,
    required this.tags,
    required this.isActive,
  });

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: widget.isActive ? AppColors.color3364E0 : AppColors.colorF8F7F5,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Center(
              child: Text(
                widget.tags[widget.index],
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  color: widget.isActive ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
