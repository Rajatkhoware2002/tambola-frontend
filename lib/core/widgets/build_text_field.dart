import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';

import '../constants/colors.dart';
import '../constants/gradients.dart';
import '../constants/new_gradints.dart';

class BuildTextField extends StatefulWidget {
  final bool isHide;
  final String? label;
  final String hintText;
  final TextInputType type;
  final Color color;
  final int maxLength;
  final Gradient textGradient;
  final TextEditingController controller;
  final double? width;
  final double? hieght;

  const BuildTextField({
    Key? key,
    this.label,
    this.isHide = false,
    required this.hintText,
    this.type = TextInputType.text,
    this.color = textFieldColor,
    this.maxLength = 10,
    this.textGradient = blueLiner2Gradient,
    required this.controller,
    this.width = 335,
    this.hieght = 38,
  }) : super(key: key);

  @override
  State<BuildTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<BuildTextField> {
  bool isVisible = true;
  setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.w),
            width: widget.width,
            height: widget.hieght,
            decoration: BoxDecoration(
                gradient: newblacklinergradient,
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              expands: false,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 12.sp,
                foreground: Paint()..shader = textlinearGradient,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field can't be left empty";
                }
                if (value.length < 4) {
                  return "Enter min. 4 characters";
                } else {
                  return null;
                }
              },
              obscureText: widget.isHide,
              keyboardType: widget.type,
              maxLength:
                  widget.type == TextInputType.number ? widget.maxLength : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0.h, bottom: 5.h),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()..shader = textlinearGradient,
                ),
                suffixIcon: widget.type == TextInputType.visiblePassword
                    ? IconButton(
                        icon: Icon(!isVisible
                            ? Icons.visibility
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          setVisibility();
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildTextField2 extends StatefulWidget {
  final bool isHide;
  final String? label;
  final String hintText;
  final TextInputType type;
  final Color color;
  final int maxLength;
  final Gradient textGradient;
  final TextEditingController controller;

  const BuildTextField2({
    Key? key,
    this.label,
    this.isHide = false,
    required this.hintText,
    this.type = TextInputType.text,
    this.color = textFieldColor,
    this.maxLength = 10,
    this.textGradient = blueLiner2Gradient,
    required this.controller,
  }) : super(key: key);

  @override
  State<BuildTextField2> createState() => _InputTextField2State();
}

class _InputTextField2State extends State<BuildTextField2> {
  bool isVisible = true;
  setVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.w),
            width: 356.w,
            height: 23.h,
            decoration: BoxDecoration(
                color: fromCssColor("#FFFFFF").withOpacity(0.30),
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              expands: false,
              controller: widget.controller,
              style: TextStyle(
                fontSize: 11.sp,
                foreground: Paint()..shader = textlinearGradient,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field can't be left empty";
                }
                if (value.length < 4) {
                  return "Enter min. 4 characters";
                } else {
                  return null;
                }
              },
              obscureText: widget.isHide,
              keyboardType: widget.type,
              maxLength:
                  widget.type == TextInputType.number ? widget.maxLength : null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15.h),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()..shader = textlinearGradient2,
                ),
                suffixIcon: widget.type == TextInputType.visiblePassword
                    ? IconButton(
                        padding: EdgeInsets.only(bottom: 1.h),
                        icon: Icon(
                          !isVisible
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: Colors.black.withOpacity(0.70),
                        ),
                        onPressed: () {
                          setVisibility();
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
