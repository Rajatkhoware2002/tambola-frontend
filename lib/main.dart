import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'Features/play_room/presentation/screens/select_room_screen.dart';
import 'Features/sign_up-&-login/presentation/screens/login_screen.dart';
import 'Features/sign_up-&-login/presentation/screens/sign_up_screen_1.dart';
import 'Features/sign_up-&-login/presentation/screens/sign_up_screen_2.dart';
import 'Features/sign_up-&-login/presentation/screens/sign_up_screen_3.dart';
import 'Features/sign_up-&-login/presentation/screens/sign_up_screen_4.dart';
import 'Features/sign_up-&-login/presentation/screens/sign_up_start.dart';
import 'Features/support/presentation/screens/customer_support.dart';
import 'Features/support/presentation/screens/customer_support_3.dart';
import 'Features/support/presentation/screens/t_and_c.dart';
import 'core/models/user.dart';
import 'core/providers/game_provider.dart';
import 'core/providers/user_provider.dart';
import 'core/widgets/navbar/new_nav_bar.dart';
import 'lang/localization_service.dart';

Widget _initialHomeRoute = SignUpStart();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,,
      );
  // bool result = await AuthService.isLoggedIn();
  // if (result) {
  //   _initialHomeRoute = SplashScreen();
  // }
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider()),
      ChangeNotifierProvider<User>(
          create: (_) => User(token: "", user: UserClass())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService().getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),
      title: 'Tambola',
      initialRoute: '/',
      routes: {
        '/': ((context) => _initialHomeRoute),
        //'/register': (context) => const SignUpStart(),
        '/login': ((context) => const LoginScreen()),
        '/select-room': (context) => const SelectRoomScreen(),
        // '/add-money': ((context) => const AddMoneyScreen()),
        // '/play-game': ((context) => const TambolaBoard()),
        '/bottom-bar': ((context) => const NewNavBar()),
        '/sign-up-start': (context) => SignUpStart(),
        '/sign-up-1': (context) => const NewSignUpScreen(),
        '/sign-up-2': ((context) => const NewSignUpScreen2()),
        '/sign-up-3': ((context) => NewSignUpScreen3(
              userName: '',
            )),
        '/sign-up-4': ((context) => const NewSignUpScreen4()),
        '/customer-support': ((context) => const CustomerSupport()),
        '/t&c': ((context) => const TandCCard()),
      },
    );
  }
}
