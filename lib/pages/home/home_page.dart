import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invite_application/utils/app_icons_icons.dart';

import '../../common_setup/routes.dart';
import '../../ui/category_card.dart';
import '../../utils/app_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(context) {
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
                    child: Image.asset(A.assetsHomePageAvatarImg),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, int) {
                    return CategoryCard(
                      title: 'Пекарни \nи кондитерские',
                      imgUrl:
                          'https://lh3.googleusercontent.com/fife/APg5EOZwXlSvVv7qAPzCjMLni5B6UOj2rqnQxbVcUixlPdm0nDPChMh8SmfbyhGOQXXTw9eQlySJ6XO34ix7DimTqUDcnB6MRb_GS6O8z4lD8vyM3h67V5rgFyFgeJ5anUUivDGRJrRCPvsmvSauRFvzv9QwQR3BfMQaECH70N5SW2oiFGS-MJBhuoAR3-kEVBgpAel2P4tfdNcD0PBHe-P9xgsl-fITrk9XWimTNFQA_zManQaDtaPT4w8lVS-jqwWXizGBJ31kCn_nxV6D4K3klF5DCKaK63JnTAx4AiwvMj88Vp2-BhK3WgEwJsW8cDCaapvV1-XFb3SFARRKfrLesXiJCVq6IuEllQzkcU81D-BFYIxLc_tfw9d7NA5QR2s_JnOtd1VK2plQfo_D7JEQDoXCmeMM-6L8C9D2b5YtUoc73cv7KUrYuZCP9jymc21HgPSiTXpmFo7kLhrCLn3ePivaDoGIL7xzaQEKRnXX5tCOeHFlIhq78TeZwIWIVWxSwaWs65RCVo98LuZiOfCcu3u69hKVme5bHVHQNpolqHw6RgXInDcSO-1c-HY4TAyaPhtpLWxE5bd_XwGnso6YEdHg3kFqANZwXEv9hb7DY39CasubzAwYnCsOOq07b0uFF1jRAvgjejxJJcXiE88XIs9QpwwaQCrtGuHbmDIzbGlx17a6-XommGe2cobC4MZ9jqfW6lCOi22tAix7g5J3194RHXyb1cVs5Pt-U0l88Z0WAX_rLyxogDIFVQc0fhm7A7BZOrDSAaH-Ii8ZEOe3IGtz4IbVYRmMUWBKM5FXrcKBpxNenheeBj3ifFYtJHsXdW_eK3JRsHGY4IZPODRF16EqiemMQKHNo3IRI73QsKAIcgsHd6SZJrh9OxDbRNHC6ZXVuIYqzFf_UVzLLmCx-9xWfXVBwN5sMh38u2Yq1jPNv2VQqQgzCrQTtvheMjo28Z00rc6JQ7KFo-3LsG45dXR74B6dprRwYZb1HK9XMzo2hYh2dwU0VSOkO4DIjzoeAhstr37PLpFxUYmuQi8HTxm_SOdov2LQs_ZS2gLk7WqHIQjALu67M6MtifU0aGivw_oV24I8CdBpP_4JsupRFOTrOKlcjPtYYJGCPjXTzsF2gbc3N_g-f45lS1FKltDWY1DNnc2sE4pmlPaeQG52EfLFiw6tdAZfzkuFBbCED4-GMUNIhhnwYl3lO1EL1NMt7W09fC6pdebC5JqCtnKwrhPsQmVaEIc18oOlVsK3ZHJNacu7MzsB9moZgZDb4IXFm71-ad7Vdu3l5eyN-533i1U7ikpbc8v9JpShD9Exd6QHyPWcEaVk-TuAwz4509t1ioDTEp_rSVDhxli2k0IzhODBtb6ChBMmhHP_MO8NdTvU_y5hKpg7cj3YgJ26aizvQi0Qq5koz5fVEFBtaXXw5ok_rwFqagW_LmKGIRqyydVb2BRILFv6D3bp-NC1hBnvYUS4VGXD4YGRVP3eK-dQ4kDVWd1RZ5gllZHgA8OTuzGgxGOGmGaOmkiSJHpx2Xt1XU8r86iHo6EzjyibiQxGsBfNrhtHXf5IxyOwNR5P76lhdTB_TOc9t8MQ0Pc86wZWye8F-9W7tDZ_GsyPWUYzlfWU174gOObTmnKcWY5IfeEJr073IB-l=w1366-h617',
                      onTap: () {
                        context.push(Routes.category);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext, int) => SizedBox(
                    height: 8,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
