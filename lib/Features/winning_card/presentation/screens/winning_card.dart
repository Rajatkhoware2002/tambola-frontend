import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class WinningCard extends StatelessWidget {
  const WinningCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.brown,
        body: Center(
            child: Container(
          width: 388.w,
          height: 584.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: newgreycarddarkliner),
          child: Center(
              child: Container(
            width: 356.w,
            height: 537.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: newblue2liner),
            child: Column(children: [
              SizedBox(height: 30.h),
              Image.asset(
                'assets/images/winning_icon.png',
                width: 136.w,
                height: 129.h,
              ),
              SizedBox(height: 25.h),
              NewCoustomText(
                text: "CONGRATULATIONS".tr,
                fontsize: 28.sp,
                fontFamily: "Latto",
                fontWeight: FontWeight.bold,
                color: newmetallicGradient.colors,
              ),
              SizedBox(height: 3.h),
              NewCoustomText(
                text: "YOU WON FIRST FIVE".tr,
                fontsize: 25.sp,
                fontFamily: "Latto",
                fontWeight: FontWeight.bold,
                color: newmetallicGradient.colors,
              ),
              SizedBox(height: 50.h),
              NewCoustomText(
                text: "₹400",
                fontsize: 40.sp,
                fontWeight: FontWeight.bold,
                color: newmetallicGradient.colors,
              ),
              SizedBox(height: 15.h),
              NewCoustomText(
                text: " YOUR REWARD WILL BE\nADDED IN YOUR WALLET".tr,
                fontsize: 20.sp,
                fontFamily: "Latto",
                fontWeight: FontWeight.bold,
                color: newgreycarddarkliner.colors,
              ),
              SizedBox(height: 20.h),
              CustomButton2(
                  text: "WELL PLAYED".tr,
                  fontsize: 15.sp,
                  fontWeight: FontWeight.w500,
                  width: 136.w,
                  width2: 124.w,
                  height: 47.h,
                  height2: 41.h,
                  gradient1: newblue2liner,
                  gradient2: blueGradient,
                  color: newmetallicGradient.colors)
            ]),
          )),
        )),
      ),
      designSize: const Size(428, 926),
    );
  }
}
