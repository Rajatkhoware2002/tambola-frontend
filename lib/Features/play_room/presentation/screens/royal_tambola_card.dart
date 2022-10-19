import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/screens/select_room.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../../../select_match_new/presentation/screen/select_room.dart';

class RoyalTambolaCard extends StatelessWidget {
  const RoyalTambolaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        // height: 261.h,
        width: 368.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        decoration: BoxDecoration(
            gradient: newblacklinergradient,
            boxShadow: [boxShadowWallet],
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(children: [
          SizedBox(height: 5.0.h),
          Row(
            children: [
              SizedBox(width: 70.w),
              SizedBox(
                width: 105.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText2(
                      text: 'Total Active players     '.tr,
                      fontsize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: newfireliner.colors),
                ),
              ),
              NewCoustomText2(
                  text: '11142',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.w700,
                  color: newfireliner.colors),
            ],
          ),
          SizedBox(height: 24.h),
          NewCoustomText2(
              text: "ROYAL TAMBOLA".tr,
              fontsize: 23.sp,
              fontWeight: FontWeight.bold,
              color: newfireliner.colors),
          NewCoustomText2(
              text: "WINNING PRIZE".tr,
              fontsize: 24.sp,
              fontWeight: FontWeight.bold,
              color: newfireliner.colors),
          SizedBox(height: 24.h),
          RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Image(
              height: 30.h,
              width: 30.w,
              image: AssetImage('assets/images/coin-small.png'),
            )),
            WidgetSpan(
                child: NewCoustomText(
                    text: "4 - ",
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: newfireliner.colors)),
            WidgetSpan(
                child: Image(
              height: 30.h,
              width: 30.w,
              image: AssetImage('assets/images/coin-small.png'),
            )),
            WidgetSpan(
                child: NewCoustomText(
                    text: "3,00,000",
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: newfireliner.colors))
          ])),
          SizedBox(height: 24.h),
          Container(
            width: 332.w,
            height: 52.h,
            child: Row(
              children: [
                SizedBox(width: 15.w),
                Image(
                  height: 40.h,
                  width: 25.w,
                  image: AssetImage('assets/images/PlayroomVector2.png'),
                ),
                SizedBox(width: 10.w),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectRoom()));
                    },
                    child: CustomButton2(
                        text: "Play Now".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 200.w,
                        width2: 170.w,
                        height: 52.h,
                        height2: 42.h,
                        gradient1: newfireliner,
                        gradient2: newblacklinergradient,
                        color: newfireliner.colors)),
                SizedBox(width: 10.w),
                Image(
                  height: 40.h,
                  width: 25.w,
                  image: AssetImage('assets/images/PlayroomVector2.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.w),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectMatchRoom()));
              },
              child: CustomButton2(
                  text: "Join Now",
                  fontsize: 23.sp,
                  fontWeight: FontWeight.bold,
                  width: 200.w,
                  width2: 170.w,
                  height: 52.h,
                  height2: 42.h,
                  gradient1: newfireliner,
                  gradient2: newblacklinergradient,
                  color: newfireliner.colors)),
        ]),
      ),
    );
  }
}
