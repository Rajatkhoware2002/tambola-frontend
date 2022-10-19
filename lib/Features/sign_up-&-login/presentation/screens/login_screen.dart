import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/widgets/build_text_field.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          height: 926.h,
          width: 428.w,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          decoration: const BoxDecoration(gradient: blueLiner2Gradient),
          child: Column(children: [
            SizedBox(height: 150.h),
            SizedBox(
              width: 280.w,
              height: 78.h,
              child: Image.asset(
                "assets/icons/Tambola.png",
              ),
            ),
            SizedBox(height: 30.h),
            Center(
                child: NewCoustomText2(
                    text: "WELCOME".tr,
                    fontsize: 25.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    color: newmetalliccard.colors)),
            SizedBox(height: 30.h),
            NewCoustomText2(
                text: "Login / Sign UP".tr,
                fontsize: 19.sp,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                color: newmetalliccard.colors),
            SizedBox(height: 50.h),
            SizedBox(
              width: 369.w,
              height: 250.h,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewCoustomText2(
                        text: "   Email / Mobile No.".tr,
                        fontsize: 13.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: newmetalliccard.colors),
                    SizedBox(height: 10.h),
                    BuildTextField2(
                      label: 'EMAIL / MOBILE NO.'.tr,
                      hintText: 'ENTER YOUR EMAIL OR MOBILE NUMBER'.tr,
                      textGradient: fireLinearGradient,
                      controller: _usernameController,
                    ),
                    SizedBox(height: 25.h),
                    NewCoustomText2(
                        text: "   PASSWORD".tr,
                        fontsize: 13.sp,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        color: newmetalliccard.colors),
                    SizedBox(height: 10.h),
                    BuildTextField2(
                      label: 'PASSWORD'.tr,
                      hintText: 'PASSWORD'.tr,
                      type: TextInputType.visiblePassword,
                      textGradient: fireLinearGradient,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _auth.signInWithUsernameOrPhone(
                                username: _usernameController.text,
                                password: _passwordController.text,
                                context: context);
                          },
                          child: CustomButton2(
                              text: "Login".tr,
                              fontsize: 23.sp,
                              fontWeight: FontWeight.bold,
                              width: 145.w,
                              width2: 118.w,
                              height: 58.h,
                              height2: 42.h,
                              gradient1: newblacklinergradient,
                              gradient2: newmetalliccard,
                              color: newblacklinergradient.colors),
                        ),
                        SizedBox(width: 30.w),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/sign-up-start');
                          },
                          child: CustomButton2(
                              text: "Sign UP".tr,
                              fontsize: 23.sp,
                              fontWeight: FontWeight.w500,
                              width: 145.w,
                              width2: 118.w,
                              height: 58.h,
                              height2: 42.h,
                              gradient1: newmetalliccard,
                              gradient2: newblacklinergradient,
                              color: newmetalliccard.colors),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: 5.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/bottom-bar');
              },
              child: CustomButton2(
                  text: "Guest".tr,
                  fontsize: 23.sp,
                  fontWeight: FontWeight.w500,
                  width: 180.w,
                  width2: 150.w,
                  height: 58.h,
                  height2: 42.h,
                  gradient1: newfireliner,
                  gradient2: newblacklinergradient,
                  color: newfireliner.colors),
            ),
            SizedBox(height: 30.h),
            Center(
              child: NewCoustomText2(
                  text: "SIGN UP /LOGIN IN WITH".tr,
                  fontsize: 16.sp,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  color: newmetalliccard.colors),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 23.r,
                  backgroundImage: AssetImage("assets/logos/google.jpg"),
                  backgroundColor: Colors.white,
                ),
                SizedBox(width: 25.w),
                CircleAvatar(
                  radius: 23.r,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/logos/fb.png"),
                ),
              ],
            )
          ]),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
