import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/gradients.dart';
import '../../../../core/services/game_services.dart';
import '../../../../core/widgets/header.dart';
import '../../../select_match/presentation/widgets/coustom_button_text.dart';
import '../Widgets/room_cards.dart';


class SelectMatchRoom extends StatelessWidget {
  const SelectMatchRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(104, 0, 0, 0)),
          child: Column(children: [
            HeaderWidget(
              gradient1: whitegradient,
              gradient2: greenLinear,
              gradient3: whitegradient,
              gradient4: whitegradient,
              gradient5: whitegradient,
            ),
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
                      child: NewCoustomText(
                          text: "Room of 10",
                          fontsize: 24.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          color: metallicGradient.colors),
                    ),
                    SizedBox(width: 5.w),
                    Image.asset(
                      "assets/icons/i.png",
                      width: 8.w,
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: FutureBuilder(
              future: GameServices().allMatch(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    itemBuilder: (context, index) {
                      // final MatchData matchData = snapshot.data;
                      final data = snapshot.data![index];
                      return RoomCard(
                        activeuser: 20,
                        entryfee: 5,
                        matchID: data.id,
                        // activePlayerCount: data.members!.length.toString(),
                        // entryFee: data.type ?? 5,
                        // rowCoinWins: 40,
                        // tambolaCoinWins: 150
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return SizedBox();
                }
              },
            )

                // ListView(
                //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                //   children: [

                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //     RoomCard(
                //       activeuser: 20,
                //       entryfee: 5,
                //     ),
                //     SizedBox(height: 10),
                //   ],
                // ),
                ),
          ]),
        ),
      ),
      designSize: const Size(428, 915),
    );
  }
}
