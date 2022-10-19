import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/models/user.dart';
import '../../../../core/widgets/build_text_field.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../screens/sign_up_screen_3.dart';

TextEditingController _nameController = TextEditingController();

class SignUpCard1 extends StatefulWidget {
  const SignUpCard1({Key? key}) : super(key: key);

  @override
  State<SignUpCard1> createState() => _SignUpCard1State();
}

class _SignUpCard1State extends State<SignUpCard1> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        width: 398.w,
        height: 384.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            gradient: metallicGradientwithOpacity),
        child: SizedBox(
          width: 358.w,
          height: 363.h,
          child: Column(children: [
            SizedBox(
              width: 286.w,
              height: 136.h,
              child: Column(
                children: [
                  NewCoustomText2(
                    text: "Bonzo".tr,
                    fontsize: 50.sp,
                    fontFamily: 'IrishGrover',
                    fontWeight: FontWeight.w500,
                    color: newblue2liner.colors,
                  ),
                  NewCoustomText2(
                    text: "Welcome".tr,
                    fontsize: 28.sp,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    color: newblue2liner.colors,
                  ),
                  NewCoustomText(
                    text: "Sign UP".tr,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: newblue2liner.colors,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
                width: 350.w,
                height: 122.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: NewCoustomText2(
                        text: "USER NAME".tr,
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: newblue2liner.colors,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Consumer<User>(
                      builder: ((context, value, child) {
                        return Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: BuildTextField(
                                  hieght: 35.h,
                                  width: 318.w,
                                  controller: _nameController,
                                  hintText: 'Username'.tr,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.h, left: 18.w),
                                child: InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      value.user.username =
                                          _nameController.text;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  NewSignUpScreen3(
                                                    userName:
                                                        _nameController.text,
                                                  ))));
                                    }
                                  },
                                  child: CustomButton2(
                                    text: "Get Started".tr,
                                    fontsize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                    width: 218.w,
                                    width2: 188.w,
                                    height: 38.h,
                                    height2: 28.h,
                                    gradient1: blueLiner2Gradient,
                                    gradient2: metallicGradient,
                                    color: newblue2liner.colors,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 50.w),
                  NewCoustomText2(
                    text: "Already have an account ?".tr,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: newblue2liner.colors,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: NewCoustomText2(
                      text: " Login  ".tr,
                      fontsize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: newredliner.colors,
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
