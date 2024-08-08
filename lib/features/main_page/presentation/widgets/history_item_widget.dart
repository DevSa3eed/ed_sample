import 'package:ed_sample/core/domain/entity/top_up_entity.dart';
import 'package:ed_sample/core/util/extensions/extension_on_context.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/util/colors.dart';

class HistoryItemWidget extends StatelessWidget {
  final TopUpEntity topUpEntity;

  const HistoryItemWidget({super.key, required this.topUpEntity});

  @override
  Widget build(BuildContext context) {
    return Material(
      /// Here i used Material just to change the fontFamily for the all widget
      /// children from one place...

      textStyle: TextStyle(fontFamily: "Montserrat"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
        child: SizedBox(
          width: context.w,
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        topUpEntity.beneficiaryEntity.nickName,
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
                      Text(topUpEntity.beneficiaryEntity.phoneNumber,
                          style: TextStyle(
                              fontSize: 9.5.sp,
                              color: TEXT_FIELD_HINT_COLOR,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        gradient:
                            // LinearGradient(colors: [Color(0xff5269B3), Color(0XFF6E8ECD)])
                            LinearGradient(colors: [Colors.green, Colors.teal]),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black12,
                              offset: Offset(0, 3))
                        ]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 8.0),
                        child: Text(
                          topUpEntity.amount ==
                                  topUpEntity.amount.roundToDouble()
                              ? "AED ${topUpEntity.amount}"
                              : "AED ${topUpEntity.amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
