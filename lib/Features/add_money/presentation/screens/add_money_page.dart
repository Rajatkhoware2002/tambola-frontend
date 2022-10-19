import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/constants/new_gradints.dart';
import '../../../../core/widgets/header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../../../waiting_room/waiting_room/presentation/screens/waiting_room_screen.dart';
import '../../../wallet/presentation/screens/wallet_card.dart';

class AddMoneyScreen extends StatefulWidget {
  final String matchID;
  final bool isCreater;
  const AddMoneyScreen(
      {Key? key, required this.matchID, required this.isCreater})
      : super(key: key);

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  String name = "";
  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        // name = context.read<UserProvider>().user.name!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            HeaderWidget(
              gradient1: whitegradient,
              gradient2: whitegradient,
              gradient3: greenLinear,
              gradient4: whitegradient,
              gradient5: whitegradient,
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                height: 627.h,
                width: 359.w,
                decoration: BoxDecoration(
                    gradient: newblue2liner,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 191, 191, 191),
                          offset: Offset(8, 8),
                          spreadRadius: 8,
                          blurRadius: 8)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile_photo.png'),
                      radius: 50.r,
                    ),
                    SizedBox(height: 9.h),
                    NewCoustomText2(
                      text: "User Name".tr,
                      fontsize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                    ),
                    NewCoustomText2(
                      text: "User ID".tr,
                      fontsize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: newredliner.colors,
                    ),
                    SizedBox(height: 9.h),
                    NewCoustomText2(
                      text: "BUY TICKET".tr,
                      fontsize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                    ),
                    SizedBox(height: 10.h),
                    NewCoustomText2(
                      text: "Entry Fees".tr,
                      fontsize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: metallicGradient.colors,
                    ),
                    SizedBox(height: 10.h),
                    NewCoustomText2(
                      text: "₹ 50",
                      fontsize: 70.sp,
                      fontWeight: FontWeight.bold,
                      color: newfireliner.colors,
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (context) => NewWallet());
                      },
                      child: CustomButton2(
                          onTap: () async {
                            if (!widget.isCreater) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaitingRoomScreen(
                                            matchID: widget.matchID,
                                            isCreater: false,
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WaitingRoomScreen(
                                            matchID: widget.matchID,
                                            isCreater: true,
                                          )));
                            }
                          },
                          text: "Add Money".tr,
                          fontsize: 23.sp,
                          fontWeight: FontWeight.bold,
                          width: 300.w,
                          width2: 269.w,
                          height: 50.h,
                          height2: 35.h,
                          gradient1: newdarkgreenliner,
                          gradient2: newgreenliner,
                          color: newgreygradient.colors),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
