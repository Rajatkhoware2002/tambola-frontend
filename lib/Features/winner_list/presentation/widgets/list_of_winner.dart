import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class ListofWinner extends StatelessWidget {
  final String profileImg;
  final String? prizeImg;

  const ListofWinner({
    Key? key,
    required this.profileImg,
    this.prizeImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 303.w,
        height: 75.h,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 9.h, bottom: 10.h, left: 3.w),
              child: CircleAvatar(
                radius: 32.r,
                backgroundImage: AssetImage(profileImg),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, bottom: 5.h, top: 7.h),
              child: SizedBox(
                width: 105.w,
                height: 70.h,
                child: Column(
                  children: [
                    NewCoustomText2(
                      text: "User Name".tr,
                      fontsize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: newblacklinergradient.colors,
                    ),
                    SizedBox(height: 2.h),
                    NewCoustomText2(
                      text: "User ID               ".tr,
                      fontsize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: newtamatoredliner.colors,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 104.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: newblueliner,
                        border: Border.all(color: Colors.white, width: 1.0.w),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 4),
                              blurRadius: 4.0.r),
                        ],
                      ),
                      child: Center(
                        child: NewCoustomText(
                            text: "Congratulate".tr,
                            fontsize: 8.sp,
                            fontWeight: FontWeight.bold,
                            color: newgreygradient.colors),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/winner_logo.png',
              width: 65.w,
              height: 41.h,
            ),
            Image.asset(
              prizeImg.toString(),
              width: 33.w,
              height: 45.h,
            )
          ],
        ),
      ),
    );
  }
}

class ListofWinners extends StatelessWidget {
  final String profileImg;
  final String? prizeImg;

  const ListofWinners({
    Key? key,
    required this.profileImg,
    this.prizeImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 303.w,
        height: 75.h,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 9.h, bottom: 10.h, left: 3.w),
              child: CircleAvatar(
                radius: 32.r,
                backgroundImage: AssetImage(profileImg),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 9.w, bottom: 5.h, top: 7.h),
              child: SizedBox(
                width: 105.w,
                height: 70.h,
                child: Column(
                  children: [
                    NewCoustomText2(
                      text: "User Name".tr,
                      fontsize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: newblacklinergradient.colors,
                    ),
                    SizedBox(height: 2.h),
                    NewCoustomText2(
                      text: "User ID               ".tr,
                      fontsize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: newtamatoredliner.colors,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 104.w,
                      height: 17.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: newblueliner,
                        border: Border.all(color: Colors.white, width: 1.0.w),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 4),
                              blurRadius: 4.0.r),
                        ],
                      ),
                      child: Center(
                        child: NewCoustomText(
                            text: "Congratulate".tr,
                            fontsize: 8.sp,
                            fontWeight: FontWeight.bold,
                            color: newgreygradient.colors),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 50.w),
            Image.asset(
              prizeImg.toString(),
              width: 42.w,
              height: 48.h,
            )
          ],
        ),
      ),
    );
  }
}
