// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Features/account_page/presentation/screens/account_screen.dart';
import '../../../Features/leader_board/presentation/screens/leaderboard_screen.dart';
import '../../../Features/play_room/presentation/screens/select_room_screen.dart';
import '../../../Features/wallet/presentation/screens/wallet_card.dart';
import '../../constants/gradients.dart';

class NewNavBar extends StatefulWidget {
  const NewNavBar({Key? key}) : super(key: key);

  @override
  State<NewNavBar> createState() => _NewNavBarState();
}

class _NewNavBarState extends State<NewNavBar> {
  int index = 0;
  final screens = [
    SelectRoomScreen(),
    NewWallet(),
    LeaderboardScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: screens[index],
        bottomNavigationBar: Container(
          height: 99.h,
          decoration: BoxDecoration(gradient: blueLiner2Gradient),
          child: NavigationBar(
              backgroundColor: Colors.transparent,
              height: 94.h,
              selectedIndex: index,
              animationDuration: Duration(seconds: 15),
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NewNavBarItems(
                    icon: (Icons.play_circle),
                    selectedIcon: (Icons.play_circle)),
                NewNavBarItems(
                    icon: (Icons.wallet), selectedIcon: (Icons.wallet)),
                NewNavBarItems(
                    icon: (Icons.analytics), selectedIcon: (Icons.analytics)),
                NewNavBarItems(
                    icon: (Icons.account_box),
                    selectedIcon: (Icons.account_box))
              ]),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}

class NewNavBarItems extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  const NewNavBarItems({
    Key? key,
    required this.icon,
    required this.selectedIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Padding(
        padding:
            EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w, bottom: 5.h),
        child: Container(
          width: 63.w,
          height: 74.h,
          decoration: BoxDecoration(
              gradient: blackLinear, borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: NavigationDestination(
              icon: Icon(
                icon,
                size: 50.sp,
                color: Color.fromARGB(255, 199, 192, 192),
              ),
              label: "",
              selectedIcon: Container(
                  decoration: BoxDecoration(),
                  child: Icon(
                    selectedIcon,
                    size: 58.sp,
                    color: Color.fromARGB(255, 255, 166, 0),
                  )),
            ),
          ),
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
