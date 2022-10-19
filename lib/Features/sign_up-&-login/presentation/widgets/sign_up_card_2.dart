import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/models/user.dart';
import '../../../../core/widgets/build_text_field.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../screens/sign_up_screen_3.dart';

TextEditingController _numberController = TextEditingController();

class SignUpCard2 extends StatefulWidget {
  const SignUpCard2({Key? key}) : super(key: key);

  @override
  State<SignUpCard2> createState() => _SignUpCard2State();
}

class _SignUpCard2State extends State<SignUpCard2> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 384.w,
              height: 385.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  gradient: metallicGradientwithOpacity),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, left: 13.w, right: 13.w),
                child: SizedBox(
                  width: 358.w,
                  height: 333.h,
                  child: Column(children: [
                    SizedBox(
                      width: 326.w,
                      height: 66.h,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-up-1');
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 30.0.sp,
                            color: fromCssColor('#003240'),
                          ),
                          SizedBox(width: 10.w),
                          NewCoustomText2(
                              text: "Tambola".tr,
                              fontsize: 55.sp,
                              fontFamily: 'IrishGrover',
                              fontWeight: FontWeight.normal,
                              color: newblue2liner.colors)
                        ],
                      ),
                    ),
                    NewCoustomText(
                      text: "Sign UP".tr,
                      fontsize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: newblue2liner.colors,
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 358.w,
                      height: 153.h,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12.w, top: 15.h),
                              child: NewCoustomText2(
                                text: "MOBILE NUMBER".tr,
                                fontFamily: 'Montserrat',
                                fontsize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: newblue2liner.colors,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Consumer<User>(
                              builder: ((context, value, child) {
                                return Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: BuildTextField(
                                          width: 335.w,
                                          hieght: 30.h,
                                          controller: _numberController,
                                          type: TextInputType.number,
                                          hintText:
                                              'ENTER 10 DIGIT MOBILE NUMBER'.tr,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.h, left: 5.w),
                                        child: InkWell(
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              value.user.mobile = int.parse(
                                                  _numberController.text);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          NewSignUpScreen3(
                                                            userName: "",
                                                          ))));
                                            }
                                          },
                                          child: CustomButton2(
                                            text: "Next".tr,
                                            fontsize: 21.sp,
                                            fontWeight: FontWeight.bold,
                                            width: 173.w,
                                            width2: 150.w,
                                            height: 45.h,
                                            height2: 35.h,
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
                            Padding(
                              padding: EdgeInsets.only(left: 73.w, top: 10.h),
                              child: InkWell(
                                onTap: () {
                                  debugPrint(
                                      "This is the user pressed answer ${_numberController.text}");
                                },
                                child: NewCoustomText2(
                                  text: "Aready have an account ?".tr,
                                  fontsize: 15.sp,
                                  //fontfamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  color: newblue2liner.colors,
                                ),
                              ),
                            )
                          ]),
                    )
                  ]),
                ),
              ),
            ));
  }
}
