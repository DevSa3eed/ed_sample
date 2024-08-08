import 'package:ed_sample/core/domain/entity/beneficiary_entity.dart';
import 'package:ed_sample/core/domain/entity/top_up_entity.dart';
import 'package:ed_sample/core/util/colors.dart';
import 'package:ed_sample/core/util/extensions/extension_on_context.dart';
import 'package:ed_sample/core/util/generate_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BeneficiaryCard extends StatelessWidget {
  final BeneficiaryEntity beneficiaryEntity;
  final Function(TopUpEntity) onTopUpAdded;

  const BeneficiaryCard(
      {super.key, required this.beneficiaryEntity, required this.onTopUpAdded});

  @override
  Widget build(BuildContext context) {
    return Material(
      /// Here i used Material just to change the fontFamily for the all widget
      /// children from one place...

      textStyle: TextStyle(fontFamily: "Montserrat"),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.w * 0.015, vertical: 8.0),
        child: SizedBox(
          width: context.w * 0.35,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.black12,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    beneficiaryEntity.nickName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 10.5.sp,
                        color: MAIN1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(beneficiaryEntity.phoneNumber,
                      style: TextStyle(
                          fontSize: 9.5.sp,
                          color: TEXT_FIELD_HINT_COLOR,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 8,
                  ),
                  beneficiaryTopUpBtn(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget beneficiaryTopUpBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Screens.TOP_UP_BENEFICIARY,
            arguments: {"beneficiary": beneficiaryEntity}).then((value) {
          if (value != null && (value as Map)["historyItem"] != null) {
            onTopUpAdded((value)["historyItem"]);
          }
        });
      },
      child: Container(
        width: context.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient:
                // LinearGradient(colors: [Color(0xff5269B3), Color(0XFF6E8ECD)])
                LinearGradient(colors: [Color(0xff5269B3), Color(0XFF6E8ECD)]),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black12, offset: Offset(0, 3))
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
            child: Text(
              "Recharge now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
