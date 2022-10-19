import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../account_page/presentation/widgets/account_header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class CustomerSupport3 extends StatefulWidget {
  const CustomerSupport3({Key? key}) : super(key: key);

  @override
  State<CustomerSupport3> createState() => _CustomerSupport3State();
}

class _CustomerSupport3State extends State<CustomerSupport3> {
  String casse = "";
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText(
                      text: "We are here to help you".tr,
                      fontsize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: newblue2liner.colors),
                ),
                SizedBox(height: 40.h),
                Container(
                    width: 378.w,
                    height: 417.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white,
                      boxShadow: [boxShadowCoustomer],
                      border: Border.all(
                        width: 3.w,
                        color: Color.fromARGB(255, 1, 36, 65),
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 358.w,
                        height: 333.h,
                        child: Column(children: [
                          NewCoustomText2(
                            text: "Dispute".tr,
                            fontsize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: newblue2liner.colors,
                          ),
                          SizedBox(height: 40.h),
                          SizedBox(
                            width: 358.w,
                            height: 56.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NewCoustomText2(
                                  text: "     SELECT YOUR CASE".tr,
                                  fontsize: 13.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: newblue2liner.colors,
                                  shadowoffset: Offset(0.0, 4.0),
                                  shawdowcolor: Color.fromARGB(108, 0, 0, 0),
                                  shawdowradius: 10.r,
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  width: 356.w,
                                  height: 23.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    gradient: newmetalliccard,
                                    boxShadow: [boxShadowCoustomer],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 13.sp),
                                      decoration: InputDecoration(
                                        hintText: "Desposit is Not Working".tr,
                                        hintStyle: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: fromCssColor("#000000"),
                                        ),
                                        border: InputBorder.none,
                                        errorStyle: TextStyle(fontSize: 12.sp),
                                      ),
                                      onChanged: (value) {
                                        casse = value;
                                        setState(() {});
                                      },
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "Please Enter your case".tr;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                          SizedBox(
                            width: 358.w,
                            height: 56.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NewCoustomText2(
                                  text: "     MESSAGE".tr,
                                  fontsize: 13.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: newblue2liner.colors,
                                  shadowoffset: Offset(0.0, 4.0),
                                  shawdowcolor: Color.fromARGB(97, 0, 0, 0),
                                  shawdowradius: 10.r,
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  width: 356.w,
                                  height: 23.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9.r),
                                    gradient: newmetalliccard,
                                    boxShadow: [boxShadowCoustomer],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 13.sp),
                                      decoration: InputDecoration(
                                        hintText: "Type Here".tr,
                                        hintStyle: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: fromCssColor("#000000"),
                                        ),
                                        border: InputBorder.none,
                                        errorStyle: TextStyle(fontSize: 12.sp),
                                      ),
                                      onChanged: (value) {
                                        casse = value;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50.h),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 230.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30.r),
                                  boxShadow: [boxShadowCoustomer]),
                              child: CustomButton2(
                                text: "Submit".tr,
                                fontsize: 23.sp,
                                fontWeight: FontWeight.bold,
                                width: 230.w,
                                width2: 193.w,
                                height: 58.h,
                                height2: 42.h,
                                gradient1: newblue2liner,
                                gradient2: blueGradient,
                                color: newgreygradient.colors,
                                shadowoffset: Offset(0.0, 4.0),
                                shawdowcolor: Color.fromARGB(57, 0, 0, 0),
                                shawdowradius: 10.r,
                              ),
                            ),
                          )
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
