// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/core/models/user.dart'  as user_model;
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/utils/showSnackBar.dart';
import '../../../../core/widgets/build_text_field.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../screens/sign_up_screen_4.dart';

class SignUpCard3 extends StatefulWidget {
  //final User user;
  final String? mobile;
  const SignUpCard3({
    Key? key,
    this.mobile,
  }) : super(key: key);

  @override
  State<SignUpCard3> createState() => _SignUpCard3State();
}

class _SignUpCard3State extends State<SignUpCard3> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String _verifID = "";
  int screenState = 0;

  @override
  void initState() {
   
    //get the phone number from user object before build method to verify the number
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user_model.User currentUser =
          Provider.of<user_model.User>(context, listen: false);
      debugPrint(currentUser.user.mobile.toString());
      //call method to verify the phone number
      _verifyPhone(currentUser.user.mobile.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              width: 370.w,
              height: 355.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  gradient: metallicGradientwithOpacity),
              child: SizedBox(
                width: 358.w,
                height: 328.h,
                child: Column(children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
                    child: SizedBox(
                      width: 358.w,
                      height: 74.h,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign-up-2');
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                            iconSize: 30.0.sp,
                            color: fromCssColor('#003240'),
                          ),
                          NewCoustomText2(
                              text: "Play & Earn".tr,
                              fontsize: 46.sp,
                              fontFamily: 'IrishGrover',
                              fontWeight: FontWeight.normal,
                              color: newblue2liner.colors)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                 
                  NewCoustomText2(
                    text: "Resend otp : 00:10".tr,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: newblue2liner.colors,
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 358.w,
                    height: 150.h,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 28.w, top: 20.h),
                            child: NewCoustomText2(
                              text: "CONFIRM OTP".tr,
                              fontsize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: newblue2liner.colors,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Consumer<user_model.User>(
                              builder: (context, value, child) {
                            return Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: BuildTextField(
                                      hieght: 30.h,
                                      controller: _otpController,
                                      type: TextInputType.number,
                                      maxLength: 6,
                                      hintText: 'ENTER OTP'.tr,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 15.h, left: 20.w),
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          value.user.username =
                                              _otpController.text;
                                        }
                                        _verifyOTP(_otpController);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const NewSignUpScreen4())));
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
                          // Padding(
                          //   padding: EdgeInsets.only(left: 6.w),
                          //   child: CoustomTextformfield(
                          //       labeltext: "Enter 6 Digit OTP Here"),
                          // ),
                        ]),
                  )
                ]),
              ),
            ));
  }

//firebase method to verify the phone number and send the otp
  _verifyPhone(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) {
          //signing the user
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              showSnackBarText(context, "User Authenticated!");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackBarText(context, "Authentication Failed");
        },
        codeSent: (String verficationID, int? resendToken) {
          showSnackBarText(context, "OTP sent to the number");
          setState(() {
            _verifID = verficationID;
            screenState = 1;
          });
        },
        codeAutoRetrievalTimeout: (String verifID) {
          setState(() {
            _verifID = verifID;
          });
          showSnackBarText(context, "Timeout!");
        });
  }

//verifying the entered otp against the user entered otp
  Future<void> _verifyOTP(value) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verifID, smsCode: _otpController.text))
        .whenComplete(() {
      showSnackBarText(context, "OTP verified!");
    });
  }
}
