import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../account_page/presentation/widgets/account_header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class CustomerSupport2 extends StatelessWidget {
  const CustomerSupport2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            SizedBox(
              width: 428.w,
              height: 713.h,
              child: Column(children: [
                SizedBox(height: 130.h),
                NewCoustomText(
                    text: "Select your Case".tr,
                    fontsize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: newblue2liner.colors),
                SizedBox(height: 40.h),
                Container(
                    width: 368.w,
                    height: 372.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [boxShadowCoustomer],
                      border: Border.all(
                        width: 3.w,
                        color: Color.fromARGB(255, 1, 36, 65),
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 300.w,
                        height: 284.h,
                        child: Column(children: [
                          InkWell(
                            onTap: () {},
                            child: NewCoustomText2(
                              text: "Report Error".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 45.h),
                          Container(
                            width: 300.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              gradient: newblue2liner,
                              boxShadow: [boxShadowCoustomer],
                            ),
                          ),
                          SizedBox(height: 45.h),
                          InkWell(
                            onTap: () {},
                            child: NewCoustomText2(
                              text: "Dispute".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 45.h),
                          Container(
                            width: 300.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              gradient: newblue2liner,
                              boxShadow: [boxShadowCoustomer],
                            ),
                          ),
                          SizedBox(height: 45.h),
                          InkWell(
                            onTap: () {},
                            child: NewCoustomText2(
                              text: "Other".tr,
                              fontsize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: newblue2liner.colors,
                            ),
                          ),
                        ]),
                      ),
                    ))
              ]),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
