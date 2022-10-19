import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/account_colunms.dart';
import '../widgets/account_header.dart';
import '../widgets/bottom_buttons.dart';
import '../widgets/ellipse.dart';
import '../widgets/refer_earn.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            AccountScreenHeader(),
            Ellipse(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  AccountColunm1(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: AccountColunm2(),
                  ),
                  ReferContainer(),
                  CircularButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
