import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import '../../../models/dishes.dart';
import '../../../ui/dish_card.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons_icons.dart';

class CategoryPage extends StatelessWidget {
  final String title;

  CategoryPage({
    super.key,
    required this.title,
  });

  final List<String> tags =
      List<String>.from(Teg.values.map((x) => tegValues.reverse[x]));
  @override
  Widget build(BuildContext context) {
    final List<Widget> tmp = [
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
      DishWidget(
        title: 'Рулеты из ветчины',
        imgUrl:
            'https://lh3.googleusercontent.com/fife/APg5EOatxUXJokFvtqIboC2jyGK_BR7S7v55SPTSaq48QfB2ECOWf-JFr_iL--ZMfyk6tP-r1q6bYeINzsIl2bVOzkXeR1yS6o_FvAxRj7hrDCsxU52SyTTszdJs72UTGKWcZPIr2QytxvDirzD_dPy-Ui1t_-9t4l5PqGvTsELUQRd-ApeA64BjqTVUNTUgXbS060O9HeBuYeA4Y12oo1eWukk2ykWQxWAPc3XMO4oYMoK0cKJoMhIzjqQx2OwZCc90NoDX7hu3NIaFrYoQN7car5pO1Lq0xxhs1JeaxMOwafrFhGyE78_1X8-4NrjL5o4QMUPHVcH_AK9U9hQXnjWYaQa4ZxMsV1NseECKI8ky4RsPyHSydXS9zde6XswY4ntTAD8M4oz0lrKC_g22L5VjQ3cffcIR3xnxLjQa-V5HhXN5A2apzELglBpSZV5OimCEXhknZ968-NBk_4BLUe2POAsdO71hMfeEg5pDTrkf2We-e76q8qE6xpKygVHDY-R69X46XgSp7tvRBiJrhdcB7Pd3b13NaUx4bQecV1MxnTGbb46xIX-VYP1urGSZcdN7rpp7AUKtYSOjUtWj2qvOQb04B29jV35CZt9gbgve-fiBfTjBXLX0zILxEQ9US4QsgTkxMRWSYfJpkVHSn9Mb9Pfp_8N5nr2BHh4859IofVHcZTWug_q5wcpBQ5rjpQJYJ6XCv6TAPUA7o5mNq0ee3j7GloJyghECqaRYSlkucuU43Gt8jkblx1uW3GCsU_Mr83mjJzdagl3tHn5O_XXXsGw5uTnDwfmjeW1YuuTI9AaID1cLCzu42X0eqNEaLwp8Onn9OnntKYCKJr3gvlnLtt-JN8h-epkMnADcP4KTYumUMznwzEzBY9_G0Sf5e_viXEef1LlHKx-QavgNz8QpinOVMHmuDhqzlp7Saa-WcPLEKBzzzMQR2slEsZZd_xUTrLqjPPUey402sYwmOKB6Rpk4UG7pKLmzKJEk3e-U1Qn6OCPldPAzHtvOVjvPaDs8TxnBmPsTy1g9iDsX_9ueNCKqGn5NVV-rogJC28UdTdFK1FguysN1T_iRj_R-99jo-O04-S67ZG2nZpExrkPj6e3EfVdfrEXVcRhNKD1g8BQpXHwBMRu4jBEGytN3p8VovOMzluBABVRpjo74ciCpNdQKxizyvgCJok7MY0-JLPEglTYHIJwXcsOiv8SmfFpboSus_Luft1jCriw_4uGkzaitZHsF4i3BDaWsaZdatm98dSxVXzwNmPa6YRz00yXtxNLdbB38POD8bPqKwt8SO3K4s8HHXQC9NJs9RI00WR8J48U3rrxu_LqWz7J6RlX0Hw9Wn0LdrOfO6sl_vkvGbyGj0mXIHrsDSKOhZvcQhUNxKa2mqyDiCA6Deivf95jX1Pyyr8LnbHFTYL_-xzhh5p0Kag16Jo8P_hi_gI99tvjZ2pecaNlhoPMWVKWHnkCKzNCPkpB5kMYFAlX3AmUHsN70tVdu8ZQ0QA1wyvI2oZ1zix-8IcvpCsNomRMH2E_EMPHcSp5sYg6eRmPmhykrH9g79iradOBLG7ghulAWr-jfZAHD2ssxu5UBdhW1Wbg6Uw9yCtjHQOYQQ3qTTIo8huBViKQ_WiBiy0Rp9NGpAgsLXKWdmHVn=w1366-h617',
      ),
    ];

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
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        iconSize: 32,
                        icon: Icon(
                          AppIcons.arrow_back,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
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
                        tags: tags,
                      );
                    },
                    separatorBuilder: (BuildContext, int) {
                      return Container(
                        width: 8,
                      );
                    },
                    itemCount: tags.length,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LayoutGrid(
                  columnSizes: [1.fr, 1.fr, 1.fr],
                  columnGap: 8,
                  rowSizes: List.generate(
                    tmp.length ~/ 2 + 1,
                    (index) => auto,
                  ),
                  rowGap: 14,
                  children: tmp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
