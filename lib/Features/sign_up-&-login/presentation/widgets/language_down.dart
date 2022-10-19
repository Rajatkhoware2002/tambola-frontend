import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/lang/localization_service.dart';

import '../../../../core/constants/gradients.dart';

class LanguageDropDown extends StatelessWidget {
  final List<String> languages;
  final String language;
  final Function(dynamic) onChanged;

  // ignore: use_key_in_widget_constructors
  const LanguageDropDown({
    required this.languages,
    required this.language,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              height: 34.0.w,
              width: 159.h,
              decoration: BoxDecoration(
                gradient: blackLinear,
                borderRadius: BorderRadius.circular(30.0.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  dropdownColor: Color.fromARGB(255, 39, 39, 39),
                  icon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.grey,
                    size: 22.sp,
                  ),
                  items: LocalizationService.langs
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10.w),
                                GradientText(
                                  value,
                                  style: TextStyle(
                                   color: Colors.white,
                                    fontSize: 17.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  gradientType: GradientType.linear,
                                  gradientDirection: GradientDirection.ttb,
                                  radius: .5,
                                  colors: [
                                    fromCssColor('#FFFFFF'),
                                    fromCssColor('#909090'),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                  value: this.language.isEmpty ? language : language,
                  onChanged: onChanged,
                ),
              ),
            ));
  }
}
