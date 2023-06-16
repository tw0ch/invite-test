import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../ui/buttons.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons_icons.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  build(context) {
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
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext, int) {
                        return BasketItem();
                      },
                      separatorBuilder: (BuildContext, int) {
                        return Container(height: 16);
                      },
                      itemCount: 25,
                    ),
                    Align(
                      alignment: Alignment(0, 0.95),
                      child: PrimaryButton(
                        onTap: () {},
                        child: Text(
                          'Оплатить 2 004 ₽',
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
}

class BasketItem extends StatefulWidget {
  const BasketItem({super.key});

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {
  final String imgUrl =
      'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617';
  int counter = 0;
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
            child: _buildCachedImg(imgUrl),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Зеленый салат',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    '390 ₽',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' · 420г',
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
                        onTap: () {
                          setState(() {
                            counter -= 1;
                          });
                        },
                        child: SizedBox(
                          child: Icon(
                            AppIcons.decrement,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '$counter',
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
                        onTap: () {
                          setState(() {
                            counter += 1;
                          });
                        },
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
}
