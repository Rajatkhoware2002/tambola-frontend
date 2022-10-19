import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import 'reuseable_account_containers.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class AccountColunm1 extends StatelessWidget {
  const AccountColunm1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 428.w,
              height: 173.h,
              decoration: BoxDecoration(
                boxShadow: [boxShadowWallet],
                gradient: RadialGradient(
                  colors: [fromCssColor('#3DCCFE'), fromCssColor('#006177')],
                  radius: 0.9,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 11.h, right: 20.w),
                                child: SizedBox(
                                  width: 180.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: NewCoustomText2(
                                      text: "STREAK & EARN".tr,
                                      fontsize: 21.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newgreygradient.colors,
                                    ),
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                                child: SizedBox(
                                  width: 180.w,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: NewCoustomText2(
                                      text:
                                          "Maintain Streak for 30 Days GET".tr,
                                      fontsize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newgreygradient.colors,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: SizedBox(
                            width: 150.w,
                            height: 75.h,
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 9.h),
                                    child: NewCoustomText2(
                                      text: "₹ 50",
                                      fontsize: 40.sp,
                                      fontWeight: FontWeight.bold,
                                      color: newfireliner.colors,
                                    )),
                                Image.asset(
                                  'assets/images/coins.png',
                                  width: 65.w,
                                  height: 75.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, top: 5.h, bottom: 5.h, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseAbleContainer(
                            text: "MO",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          ReuseAbleContainer(
                            text: "TU",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          ReuseAbleContainer(
                            text: "WED",
                            color: fromCssColor('#FFFFFF'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 13.h),
                            child: Image.asset(
                              'assets/images/Thursaday.png',
                              height: 56.40.h,
                              width: 40.w,
                            ),
                          ),
                          ReuseAbleContainer(
                            text: "FR",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                          ReuseAbleContainer(
                            text: "SA",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                          ReuseAbleContainer(
                            text: "SU",
                            color: fromCssColor('#FFFFFF'),
                            gradient: newmetalliccard,
                          ),
                        ],
                      ),
                    )
                  ]),
            ));
  }
}

class AccountColunm2 extends StatelessWidget {
  const AccountColunm2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => SizedBox(
              width: 428.w,
              height: 177.44.h,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 5.w, top: 15.h, bottom: 15.h, right: 5.w),
                child: Center(
                  child: SizedBox(
                    width: 359.w,
                    height: 149.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(width: 1.w),
                                SizedBox(
                                  width: 155.w,
                                  height: 77.2.h,
                                  child: ReuseableGradientContainer(
                                    width: 157.w,
                                    height: 41.2.h,
                                    text1: "TOTAL MATCH".tr,
                                    text2: "555",
                                    fontsize: 13.sp,
                                    circular: 20,
                                  ),
                                ),
                                SizedBox(width: 35.w),
                                SizedBox(
                                  width: 155.w,
                                  height: 77.2.h,
                                  child: ReuseableGradientContainer(
                                    width: 145.w,
                                    height: 63.2.h,
                                    text1: "TOTAL WINNINGS".tr,
                                    text2: "44",
                                    circular: 20,
                                    fontsize: 13.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14.h),
                          SizedBox(
                            width: 356.w,
                            height: 56.h,
                            child: ReuseableGradientContainer2(
                              fontsize: 13.sp,
                              width: 303.w,
                              height: 50.2.h,
                              text1: "TOTAL AMOUNT WON".tr,
                              text2: "₹ 15000",
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ));
  }
}
