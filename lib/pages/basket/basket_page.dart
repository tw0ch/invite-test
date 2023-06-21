import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/basket_item.dart';
import '../../ui/buttons.dart';
import '../../ui/cached_img.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons_icons.dart';
import 'bloc/basket_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  build(context) {
    return BlocProvider(
      create: (context) => BasketBloc(),
      child: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          if (state is BasketLoadedState && state.basketItems.isNotEmpty) {
            return _buildLoadedBody(
              basketItems: state.basketItems,
              state: state,
            );
          } else {
            return _buildEmptyBody();
          }
        },
      ),
    );
  }

  Widget _buildEmptyBody() {
    return Scaffold(
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
                              'Санкт-Петербург',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '12 Августа, 2023',
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
                    child: Image.asset(
                      A.assetsHomePageAvatarImg,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Корзина пуста',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
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

  Widget _buildLoadedBody({
    required List<BasketItem> basketItems,
    required BasketLoadedState state,
  }) {
    int finalCoast = _getFinalCost(items: basketItems);
    return Scaffold(
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
                              'Санкт-Петербург',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '12 Августа, 2023',
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
                    child: Image.asset(
                      A.assetsHomePageAvatarImg,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      // height: double.infinity,
                      child: ListView.separated(
                        // shrinkWrap: true,
                        itemBuilder: (BuildContext context, i) {
                          return BasketItemWidget(
                            // id: state.basketItems[i].id,
                            imageUrl: state.basketItems[i].imageUrl,
                            name: state.basketItems[i].name,
                            price: state.basketItems[i].price,
                            quantity: state.basketItems[i].quantity,
                            weight: state.basketItems[i].weight,
                            onAddTap: () {
                              context.read<BasketBloc>().add(
                                    BaksetItemAddQuantityEvent(
                                      itemIndex: i,
                                      items: state.basketItems,
                                    ),
                                  );
                            },
                            onRemoveTap: () {
                              context.read<BasketBloc>().add(
                                    BaksetItemRemoveQuantityEvent(
                                      itemIndex: i,
                                      items: state.basketItems,
                                    ),
                                  );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext, int) {
                          return Container(height: 16);
                        },
                        itemCount: state.basketItems.length,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.95),
                      child: PrimaryButton(
                        onTap: () {},
                        child: Text(
                          'Оплатить ${finalCoast} ₽',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int _getFinalCost({required List<BasketItem> items}) {
    double counter = 0.0;
    for (int i = 0; i < items.length; i++) {
      counter += items[i].price.toDouble() * items[i].quantity;
    }
    return counter.ceil();
  }
}

class BasketItemWidget extends StatefulWidget {
  // final int id;
  final String name;
  final int price;
  final int weight;
  final int quantity;
  final String imageUrl;
  final VoidCallback onAddTap;
  final VoidCallback onRemoveTap;

  const BasketItemWidget({
    super.key,
    // required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.quantity,
    required this.imageUrl,
    required this.onAddTap,
    required this.onRemoveTap,
  });

  @override
  State<BasketItemWidget> createState() => _BasketItemWidgetState();
}

class _BasketItemWidgetState extends State<BasketItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: AppColors.colorF8F7F5,
              borderRadius: BorderRadius.circular(6),
            ),
            child: CathedNetworkImgWidget(imgUrl: widget.imageUrl),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.name}',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.price} ₽',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' · ${widget.weight}г',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 100,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.colorEFEEEC,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.transparent, // Button color
                      child: InkWell(
                        // Splash color
                        onTap: widget.onRemoveTap,
                        child: SizedBox(
                          child: Icon(
                            AppIcons.decrement,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${widget.quantity}',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Colors.transparent, // Button color
                      child: InkWell(
                        // Splash color
                        onTap: widget.onAddTap,
                        child: SizedBox(
                          child: Icon(
                            AppIcons.increment,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
