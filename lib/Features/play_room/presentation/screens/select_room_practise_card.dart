// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class PractiseRoomCard extends StatefulWidget {
  const PractiseRoomCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PractiseRoomCard> createState() => _PractiseRoomCardState();
}

class _PractiseRoomCardState extends State<PractiseRoomCard> {
  @override
  Widget build(BuildContext context) {
    //SocketMethods socketMethods = SocketMethods();

    return ScreenUtilInit(
      builder: (context, child) => Container(
        height: 175.h,
        width: 364.12.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            gradient: newblacklinergradient,
            boxShadow: [boxShadowWallet],
            borderRadius: BorderRadius.circular(30.r)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 5.0.h),
          Row(
            children: [
              SizedBox(width: 100.w),
              SizedBox(
                width: 160.w,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: NewCoustomText2(
                      text: 'open only Weekends'.tr,
                      fontsize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: newmetalliccard.colors),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 58.h),
            child: SizedBox(
              width: 253.w,
              height: 23.h,
              child: RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Image(
                  height: 30.h,
                  width: 30.w,
                  image: AssetImage('assets/images/coin-small.png'),
                )),
                WidgetSpan(
                    child: NewCoustomText(
                  text: "0.02   -   ",
                  fontsize: 25.sp,
                  fontWeight: FontWeight.w500,
                  color: newmetalliccard.colors,
                )),
                WidgetSpan(
                    child: Image(
                  height: 30.h,
                  width: 30.w,
                  image: AssetImage('assets/images/coin-small.png'),
                )),
                WidgetSpan(
                  child: NewCoustomText(
                    text: "1 ",
                    fontsize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: newmetalliccard.colors,
                  ),
                )
              ])),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 22.w, top: 7.h),
            child: SizedBox(
              width: 332.w,
              height: 35.h,
              child: NewCoustomText2(
                text: "Pracise & Play with friends".tr,
                fontsize: 20.sp,
                fontWeight: FontWeight.bold,
                color: newmetalliccard.colors,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 332.w,
              height: 52.h,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/PlayroomVector.png'),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                      onTap: () async {
                        // SharedPreferences pref = await SharedPreferences.getInstance();
                        // final userID =  pref.getString("userID");
                        // print("CREATING A NEW MATCH${userID} ");
                        // GameServices().createMatch(createdID: userID!);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const AddMoneyScreen()));
                      },
                      child: CustomButton2(
                          text: "Play Now".tr,
                          fontsize: 23.sp,
                          fontWeight: FontWeight.bold,
                          width: 200.w,
                          width2: 170.w,
                          height: 52.h,
                          height2: 42.h,
                          gradient1: newmetalliccard,
                          gradient2: newblacklinergradient,
                          color: newmetalliccard.colors)),
                  SizedBox(width: 10.w),
                  Image(
                    height: 40.h,
                    width: 31.w,
                    image: AssetImage('assets/images/PlayroomVector.png'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
