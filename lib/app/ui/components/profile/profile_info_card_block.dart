import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:posdelivery/app/ui/components/static/info_box_style_1.dart';

class ProfileInfoCardBlock extends StatelessWidget {
  const ProfileInfoCardBlock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoBoxStyle1(
                icon: FontAwesomeIcons.shippingFast,
                valuePrefix: ''.tr,
                value: '16',
                description: 'total sales'.tr,
              ),
            ),
            Expanded(
              flex: 1,
              child: InfoBoxStyle1(
                icon: FontAwesomeIcons.cashRegister,
                valuePrefix: 'SAR'.tr,
                value: '32,999',
                description: 'Sales Amount'.tr,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoBoxStyle1(
                icon: FontAwesomeIcons.moneyBillAlt,
                valuePrefix: 'SR'.tr,
                value: '16,999',
                description: 'Credit Sale'.tr,
              ),
            ),
            Expanded(
              flex: 1,
              child: InfoBoxStyle1(
                icon: FontAwesomeIcons.moneyBill,
                valuePrefix: 'SR'.tr,
                value: '29,100',
                description: 'In hand'.tr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
