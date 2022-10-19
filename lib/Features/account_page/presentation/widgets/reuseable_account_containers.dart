// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';

import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';

//This resueable container are for small circle with days name !
//THis one is for golden circles.
class ReuseAbleContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Gradient? gradient;
  const ReuseAbleContainer({
    Key? key,
    required this.text,
    required this.color,
    this.gradient = fireLinearGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 38.w,
              height: 38.63.h,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, gradient: gradient),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      shadows: const <Shadow>[
                        Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10.0,
                          color: Color.fromARGB(123, 51, 51, 51),
                        ),
                      ],
                      color: color),
                ),
              ),
            ));
  }
}

//This resueable container are for Circular Buttons !.
class ReuseAbleCircularButtons extends StatelessWidget {
  final VoidCallback ontap;
  final Icon icon;

  const ReuseAbleCircularButtons({
    Key? key,
    required this.ontap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 65.w,
              height: 68.44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: fireLinearGradient,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(211, 64, 65, 66),
                    offset: Offset(0.0, 7.0),
                    blurRadius: 4.0.r,
                  ),
                ],
              ),
              child: Center(
                  child: IconButton(
                onPressed: ontap,
                icon: icon,
                iconSize: 45.sp,
                color: fromCssColor('#FFFFFF'),
              )),
            ));
  }
}

//This reuseablecontainer are for colunm view.
class ReuseableGradientContainer extends StatelessWidget {
  final double width;
  final double height;
  final String text1;
  final String text2;
  final double fontsize;

  const ReuseableGradientContainer({
    Key? key,
    required int circular,
    required this.width,
    required this.height,
    required this.text1,
    required this.text2,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: width.w,
              height: height.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: blueGradient,
                boxShadow: [boxShadowWallet],
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 7.h, bottom: 11.h),
                  child: SizedBox(
                    width: 150.w,
                    height: 18.26.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: NewCoustomText2(
                        text: text1,
                        overflow: TextOverflow.ellipsis,
                        fontsize: fontsize.sp,
                        fontWeight: FontWeight.bold,
                        color: newgreygradient.colors,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 147.w,
                  height: 35.65.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: fromCssColor('#FFFFFF').withOpacity(0.5)),
                  child: Center(
                      child: NewCoustomText(
                    text: text2,
                    fontsize: fontsize.sp,
                    fontWeight: FontWeight.bold,
                    color: newblue2liner.colors,
                    shadowoffset: Offset(4.0, 4.0),
                    shawdowcolor: Color.fromARGB(90, 51, 51, 51),
                    shawdowradius: 10.0.r,
                  )),
                )
              ]),
            ));
  }
}

//This reuseablecontainer are for row view.
class ReuseableGradientContainer2 extends StatelessWidget {
  final double width;
  final double height;
  final String text1;
  final String text2;
  final double fontsize;
  const ReuseableGradientContainer2({
    Key? key,
    required this.width,
    required this.height,
    required this.text1,
    required this.text2,
    required this.fontsize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: width.w,
              height: height.h,
              decoration: BoxDecoration(
                boxShadow: [boxShadowWallet],
                borderRadius: BorderRadius.circular(20.r),
                gradient: blueGradient2,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w),
                        child: SizedBox(
                          width: 159.w,
                          height: 18.28.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: NewCoustomText2(
                              text: text1,
                              fontsize: fontsize.sp,
                              fontWeight: FontWeight.bold,
                              color: newgreygradient.colors,
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Container(
                        width: 170.w,
                        height: 41.65.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: fromCssColor('#FFFFFF').withOpacity(0.6)),
                        child: Center(
                            child: NewCoustomText(
                          text: text2,
                          fontsize: fontsize.sp,
                          fontWeight: FontWeight.bold,
                          color: newblue2liner.colors,
                          shadowoffset: Offset(4.0, 4.0),
                          shawdowcolor: Color.fromARGB(85, 51, 51, 51),
                          shawdowradius: 10.0.r,
                        )),
                      ),
                    ),
                  ]),
            ));
  }
}
