import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:invite_application/utils/app_icons_icons.dart';
import 'package:shimmer/shimmer.dart';

import '../../common_setup/routes.dart';
import '../../ui/category_card.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../category/bloc/category_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial || state is HomeLoadingState) {
            return _buildLoadingBody(context);
          } else if (state is HomeLoadedState) {
            return _buildLoadedBody(context, state);
          } else {
            return _buildErrorBody();
          }
        },
      ),
    );
  }

  Widget _buildLoadedBody(BuildContext context, HomeLoadedState state) {
    DateTime date = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            AppIcons.location,
                          ),
                        ),
                        SizedBox(width: 8.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.userInfo.currentAddress}',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${date.day} ${DateFormat('MMMM').format(DateTime(0, date.month))} ${date.year}',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    child: Image.asset(A.assetsHomePageAvatarImg),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      accentColor: AppColors.colorEFEEEC,
                    ),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(RefreshItemsInDbEvent());
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext, int) {
                        return CategoryCard(
                          title: '${state.categories.categories[int].name}',
                          imgUrl:
                              '${state.categories.categories[int].imageUrl}',
                          onTap: () {
                            // context.push(Routes.category, );
                            context.push(Uri(
                                path: Routes.category,
                                queryParameters: {
                                  'title':
                                      '${state.categories.categories[int].name}'
                                }).toString());
                          },
                        );
                      },
                      separatorBuilder: (BuildContext, int) => SizedBox(
                        height: 8,
                      ),
                      itemCount: state.categories.categories.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          AppIcons.location,
                        ),
                      ),
                      SizedBox(width: 8.5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: AppColors.colorF8F7F5,
                            highlightColor:
                                AppColors.colorA5A9B2.withOpacity(0.3),
                            child: Container(
                              height: 20,
                              width: 145,
                              decoration: BoxDecoration(
                                color: AppColors.colorF8F7F5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Shimmer.fromColors(
                            baseColor: AppColors.colorF8F7F5,
                            highlightColor:
                                AppColors.colorA5A9B2.withOpacity(0.3),
                            child: Container(
                              height: 16,
                              width: 106,
                              decoration: BoxDecoration(
                                color: AppColors.colorF8F7F5,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.colorF8F7F5,
                    highlightColor: AppColors.colorA5A9B2.withOpacity(0.3),
                    child: Container(
                      width: 44,
                      height: 44,
                      child: Image.asset(A.assetsHomePageAvatarImg),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      accentColor: AppColors.colorEFEEEC,
                    ),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, int) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.colorF8F7F5,
                        highlightColor: AppColors.colorA5A9B2.withOpacity(0.3),
                        child: Container(
                          height: 148,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.colorF8F7F5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext, int) => SizedBox(
                      height: 8,
                    ),
                    itemCount: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBody() {
    return Container(
      color: Colors.red,
    );
  }
}
