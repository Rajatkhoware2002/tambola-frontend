import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tambola_frontend/Features/play_room/presentation/screens/royal_tambola_card.dart';
import 'package:tambola_frontend/Features/play_room/presentation/screens/select_room_practise_card.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/resources/socket_methods.dart';
import '../../../account_page/presentation/widgets/account_header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  get metallicGradient => null;

  @override
  void initState() {
    super.initState();
    SocketMethods().connectToServer(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(gradient: newmetallicGradient),
          child: Column(children: [
            AccountScreenHeader(),
            SizedBox(height: 10.h),
            InkWell(
              onTap: () {},
              child: Container(
                width: 218.15.w,
                height: 50.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: blueLiner2Gradient),
                child: Row(
                  children: [
                    SizedBox(width: 15.w),
                    SizedBox(
                      width: 154.w,
                      height: 30.h,
                      child: NewCoustomText2(
                        text: "Select Game".tr,
                        fontsize: 24.sp,
                        fontWeight: FontWeight.w500,
                        color: newmetallicGradient.colors,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      "assets/icons/i.png",
                      width: 8.w,
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                children: [
                  SizedBox(height: 10.h),
                  PractiseRoomCard(),
                  SizedBox(height: 20.h),
                  RoyalTambolaCard(),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ]),
        ),
        // bottomNavigationBar: NewNavBar(),
      ),
      designSize: const Size(428, 915),
    );
  }
}
