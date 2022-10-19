// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tambola_frontend/lang/localization_service.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../../../support/presentation/screens/customer_support.dart';

class SettingCard extends StatefulWidget {
  const SettingCard({Key? key}) : super(key: key);

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 359.w,
              height: 680.h,
              decoration: BoxDecoration(
                  gradient: metallicGradient,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  SettingCardProfilePic(),
                  SizedBox(height: 30.h),
                  CoustomSettingRow(
                      text: "User Name".tr, icon: Icon(Icons.edit)),
                  SizedBox(height: 20.h),
                  CoustomSettingRow(text: "Email".tr, icon: Icon(Icons.edit)),
                  SizedBox(height: 20.h),
                  CoustomSettingRow(
                      text: "Mobile Number".tr, icon: Icon(Icons.edit)),
                  SizedBox(height: 20.h),
                  SettingSwitchButton(text: "Music".tr),
                  SizedBox(height: 20.h),
                  SettingSwitchButton(text: "Sound".tr),
                  SizedBox(height: 20.h),
                  SettingLangDown(),
                  SizedBox(height: 20.h),
                  SettingSwitchButton(text: "Security".tr),
                  SizedBox(height: 60.h),
                  CustomButton2(
                      text: "Reset Password".tr,
                      fontsize: 23.sp,
                      fontWeight: FontWeight.bold,
                      width: 290.w,
                      width2: 260.w,
                      height: 49.h,
                      height2: 35.h,
                      gradient1: newblue2liner,
                      gradient2: blueGradient,
                      color: metallicGradient.colors),
                  SizedBox(height: 15.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => CustomerSupport())));
                    },
                    child: CustomButton2(
                        text: "Support".tr,
                        fontsize: 23.sp,
                        fontWeight: FontWeight.bold,
                        width: 290.w,
                        width2: 260.w,
                        height: 49.h,
                        height2: 35.h,
                        gradient1: newblue2liner,
                        gradient2: blueGradient,
                        color: metallicGradient.colors),
                  ),
                ],
              ),
            ),
          )),
      designSize: const Size(428, 926),
    );
  }
}

class SettingCardProfilePic extends StatefulWidget {
  const SettingCardProfilePic({Key? key}) : super(key: key);

  @override
  State<SettingCardProfilePic> createState() => _SettingCardProfilePicState();
}

class _SettingCardProfilePicState extends State<SettingCardProfilePic> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => CircleAvatar(
        radius: 50.0.r,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Stack(
            children: <Widget>[
              Image.asset('assets/images/profile_photo.png'),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 32.h,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50.h,
                    width: 30.w,
                    color: const Color.fromARGB(129, 0, 0, 0),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Row(
                        children: [
                          SizedBox(width: 25.w),
                          InkWell(
                            onTap: () {},
                            child: Icon(Icons.edit,
                                color: Colors.white, size: 13.sp),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 30.w,
                            child: Text(
                              "Edit".tr,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 13.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class CoustomSettingRow extends StatefulWidget {
  final String text;
  final Icon? icon;

  const CoustomSettingRow({
    Key? key,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  State<CoustomSettingRow> createState() => _CoustomSettingRowState();
}

class _CoustomSettingRowState extends State<CoustomSettingRow> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w),
              child: NewCoustomText2(
                text: widget.text,
                fontsize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: newblacklinergradient.colors,
              ),
            ),
            Icon(Icons.edit, size: 23.sp)
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingSwitchButton extends StatefulWidget {
  final String text;

  const SettingSwitchButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<SettingSwitchButton> createState() => _SettingSwitchButtonState();
}

class _SettingSwitchButtonState extends State<SettingSwitchButton> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NewCoustomText2(
              text: widget.text,
              fontsize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: newblacklinergradient.colors,
            ),
            FlutterSwitch(
                width: 37.w,
                height: 20.h,
                padding: 2.5.h.w,
                toggleSize: 16,
                activeColor: Color.fromARGB(255, 2, 47, 83),
                inactiveColor: Color.fromARGB(216, 32, 32, 32),
                value: status,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                })
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingLanguageDropDown extends StatelessWidget {
  final List<String> languages;
  final String language;
  final Function(dynamic) onChanged;

  // ignore: use_key_in_widget_constructors
  const SettingLanguageDropDown({
    required this.languages,
    required this.language,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        height: 25.0.h,
        width: 104.w,
        decoration: BoxDecoration(
          gradient: metallicGradientwithOpacity,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Color.fromARGB(255, 131, 131, 131),
            icon: Icon(Icons.arrow_drop_down_circle,
                color: Colors.grey, size: 18.sp),
            value: language,
            items: LocalizationService.langs
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: <Widget>[
                          NewCoustomText(
                              text: value.tr,
                              fontsize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: newblacklinergradient.colors)
                        ],
                      ),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class SettingLangDown extends StatefulWidget {
  const SettingLangDown({Key? key}) : super(key: key);

  @override
  State<SettingLangDown> createState() => _SettingLangDownState();
}

class _SettingLangDownState extends State<SettingLangDown> {
  String _language = "English";
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 300.w,
        height: 29.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NewCoustomText(
              text: "Language".tr,
              fontsize: 20.sp,
              fontWeight: FontWeight.bold,
              color: newblacklinergradient.colors,
              shadowoffset: Offset(2.0, 4.0),
              shawdowcolor: Color.fromARGB(33, 51, 51, 51),
              shawdowradius: .5.r,
            ),
            SettingLanguageDropDown(
              languages: [],
              language: _language,
              onChanged: (val) {
                setState(() {
                  this._language = val;
                  LocalizationService().changeLocale(val);
                });
              },
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
