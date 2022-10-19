// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../../../support/presentation/screens/customer_support.dart';
import '../../../transaction_history/presentation/screens/transaction_history.dart';
import '../../add_money/presentation/screens/add_money_card.dart';
import '../../cash_out/presentation/screens/cash__out_card.dart';
import 'package:get/get.dart';

class NewWallet extends StatelessWidget {
  const NewWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: 359.w,
            height: 680.h,
            decoration: BoxDecoration(
                gradient: newmetallicGradient,
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.only(left: 22.w, top: 20.h, bottom: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User Details
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          child: Image.asset(
                            'assets/images/profile_photo.png',
                            width: 120.w,
                            height: 120.h,
                          ),
                        ),
                        SizedBox(width: 55.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 190.w,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: NewCoustomText2(
                                    text: "User Name".tr,
                                    fontsize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    color: newblacklinergradient.colors,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: NewCoustomText2(
                                  text: "User ID".tr,
                                  fontsize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: newredliner.colors,
                                ),
                              ),
                            ]),
                      ],
                    ),

                    // First colunm TOAL BALANCE AVAILABLE
                    Container(
                      width: 319.w,
                      height: 85.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: newRadial_r_1_5,
                          boxShadow: [boxShadowWallet]),
                      child: Column(children: [
                        SizedBox(height: 8.h),
                        NewCoustomText2(
                          text: "TOAL BALANCE AVAILABLE".tr,
                          fontsize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: newgreygradient.colors,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          width: 163.w,
                          height: 41.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: fromCssColor('#FFFFFF').withOpacity(0.5),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(64, 179, 177, 177)
                                    .withOpacity(0.2),
                                offset: const Offset(0.0, 6.0),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: NewCoustomText2(
                              text: "₹ 6152",
                              fontsize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: newgreygradient.colors,
                            ),
                          ),
                        ),
                      ]),
                    ),

                    // Second Colunm Entry fee
                    Container(
                      width: 319.w,
                      height: 85.h,
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowWallet],
                        borderRadius: BorderRadius.circular(20.r),
                        gradient: newRadial_r_1_5,
                      ),
                      child: Row(children: [
                        SizedBox(width: 40.w),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5.h,
                            bottom: 5.h,
                            left: 10.w,
                            right: 20.w,
                          ),
                          child: SizedBox(
                            width: 80.w,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Entry Fees".tr,
                                fontsize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Container(
                          width: 153.w,
                          height: 41.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            gradient: newfireliner,
                            boxShadow: [boxShadowWallet],
                          ),
                          child: Center(
                            child: NewCoustomText2(
                              text: "Pay        ₹ 50".tr,
                              fontsize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: newgreygradient.colors,
                            ),
                          ),
                        )
                      ]),
                    ),

                    // Third and fourth Colunm Add Money And Cash Out

                    Row(
                      children: [
                        SizedBox(width: 3.w),
                        InkWell(
                          onTap: () {
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) => AddMoneyCard());
                          },
                          child: Container(
                            width: 131.w,
                            height: 135.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: RadialGradient(
                                colors: [
                                  fromCssColor('#3DCCFE'),
                                  fromCssColor('#006177'),
                                ],
                                radius: .5,
                              ),
                              boxShadow: [boxShadowWallet],
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  SizedBox(width: 35.w),
                                  NewCoustomText2(
                                    text: "+",
                                    fontsize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: newgreygradient.colors,
                                  ),
                                  Image.asset(
                                    "assets/images/coins.png",
                                    width: 60.w,
                                    height: 60.h,
                                  ),
                                ],
                              ),
                              NewCoustomText2(
                                text: "  Add\nMoney".tr,
                                fontsize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(width: 50.w),
                        InkWell(
                          onTap: () {
                            showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (context) => CashOutCard());
                          },
                          child: Container(
                            width: 131.w,
                            height: 135.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: RadialGradient(
                                colors: [
                                  fromCssColor('#3DCCFE'),
                                  fromCssColor('#006177'),
                                ],
                                radius: .5,
                              ),
                              boxShadow: [boxShadowWallet],
                            ),
                            child: Column(children: [
                              Row(
                                children: [
                                  SizedBox(width: 35.w),
                                  NewCoustomText2(
                                    text: "-",
                                    fontsize: 30.sp,
                                    fontWeight: FontWeight.bold,
                                    color: newgreygradient.colors,
                                  ),
                                  Image.asset(
                                    "assets/images/coins.png",
                                    width: 60.w,
                                    height: 60.h,
                                  ),
                                ],
                              ),
                              NewCoustomText2(
                                text: "Cash\n  Out".tr,
                                fontsize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),

                    // Fifth Colunm Check History
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (context) => TransactionHistory());
                        },
                        child: Container(
                          width: 300.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            gradient: newRadial_r_1_5,
                            boxShadow: [boxShadowWallet],
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Check History".tr,
                                fontsize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: newgreygradient.colors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Sixth Colunm Support
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (context) => CustomerSupport());
                        },
                        child: Container(
                          width: 300.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            gradient: newRadial_r_1_5,
                            boxShadow: [boxShadowWallet],
                          ),
                          child: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: NewCoustomText2(
                                text: "Coustom Supprt".tr,
                                fontsize: 26.sp,
                                fontWeight: FontWeight.bold,
                                color: newmetallicGradient.colors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
