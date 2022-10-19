import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../account_page/presentation/widgets/account_header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../widgets/list_of_winner.dart';

class WinnerList extends StatelessWidget {
  const WinnerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0.w.h),
                child: Container(
                  width: 360.w,
                  height: 681.h,
                  decoration: BoxDecoration(
                      color: fromCssColor("#00647B"),
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Column(children: [
                    SizedBox(height: 20.h),
                    NewCoustomText(
                        text: "List of Winners".tr,
                        fontsize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: newgreygradient.colors),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(10.w.h),
                        child: Container(
                          width: 339.w,
                          height: 601.h,
                          decoration: BoxDecoration(
                              color: fromCssColor("#FFFFFF"),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: ListView(
                              padding: EdgeInsets.only(top: 15.h),
                              children: [
                                ListofWinner(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/Winner.png',
                                ),
                                ListofWinners(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/gold.png',
                                ),
                                ListofWinners(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/silver.png',
                                ),
                                ListofWinners(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/silver.png',
                                ),
                                ListofWinners(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/bronze.png',
                                ),
                                ListofWinners(
                                  profileImg: "assets/images/face.png",
                                  prizeImg: 'assets/images/winning_icon.png',
                                ),
                              ]),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
