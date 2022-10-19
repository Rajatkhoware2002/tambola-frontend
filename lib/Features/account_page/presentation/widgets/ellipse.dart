import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class Ellipse extends StatelessWidget {
  const Ellipse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 23.w, top: 10.h, bottom: 10.h),
                  child: Container(
                    width: 145.w,
                    height: 142.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: newfireliner,
                      boxShadow: [boxShadowWallet],
                    ),
                    child: Image.asset(
                      'assets/images/face.png',
                      width: 136.w,
                      height: 134.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    width: 150.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "User Name".tr,
                                fontsize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreytextgradient.colors,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          NewCoustomText2(
                            text: "User ID".tr,
                            fontsize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: newtamatoredliner.colors,
                          ),
                        ]),
                  ),
                )
              ],
            ));
  }
}
