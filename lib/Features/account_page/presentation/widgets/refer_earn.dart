import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../refer/presentation/screens/refer_earn_card.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class ReferContainer extends StatelessWidget {
  const ReferContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => InkWell(
              onTap: () {
                showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (context) => ReferEarnCard());
              },
              child: Container(
                width: 428.w,
                height: 147.h,
                decoration: BoxDecoration(
                  gradient: blueGradient,
                  boxShadow: [boxShadowWallet],
                ),
                child: SizedBox(
                  width: 428.w,
                  height: 144.h,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 15.h, left: 25.w),
                            child: SizedBox(
                              height: 33.h,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: NewCoustomText2(
                                  text: "REFER & EARN".tr,
                                  fontsize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: newgreygradient.colors,
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 360.w,
                          height: 96.h,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 55.h,
                                  width: 180.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: NewCoustomText2(
                                      text:
                                          "Refer a Friend and GET\n When they play or add \n      money in wallet"
                                              .tr,
                                      fontsize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newgreygradient.colors,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 155.w,
                                  height: 107.h,
                                  child: Row(children: [
                                    NewCoustomText2(
                                      text: "₹ 10",
                                      fontsize: 35.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newfireliner.colors,
                                    ),
                                    Image.asset(
                                      'assets/images/coins.png',
                                      width: 70.w,
                                      height: 131.h,
                                      scale: 0.1,
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ));
  }
}
