import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import '../../Features/select_match/presentation/widgets/coustom_button_text.dart';
import '../constants/gradients.dart';
import '../constants/new_gradints.dart';
import 'coustom_gradient_text.dart';

class HeadingText extends StatelessWidget {
  final double fontSize;
  final Gradient textGradient;

  const HeadingText({
    this.fontSize = 34.0,
    this.textGradient = fireLinearGradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        height: 45.8.h,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText2(
                      text: "Tambola".tr,
                      fontsize: 34.sp,
                      fontFamily: 'IrishGrover',
                      fontWeight: FontWeight.w500,
                      color: newfireliner.colors),
                ),
                SizedBox(width: 2.w),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(left: 23.w),
                width: 70.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  gradient: LinearGradient(
                    colors: [
                      fromCssColor('#FFFFFF').withOpacity(0.5),
                      fromCssColor('#E7E7E7').withOpacity(0.5),
                      fromCssColor('#CACACA').withOpacity(0.5),
                      fromCssColor('#C0C0C0').withOpacity(0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Image.asset('assets/images/coin.png'),
                    ),
                    CoustomGradintText(
                        text: "6128",
                        fontsize: 12.0.sp,
                        fontweight: FontWeight.bold,
                        firstgradientcolor: '#FF9900',
                        secondgradientcolor: '#FFF500')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
