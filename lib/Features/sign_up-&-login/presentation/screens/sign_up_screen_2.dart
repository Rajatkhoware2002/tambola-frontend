import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../widgets/sign_up_card_2.dart';

class NewSignUpScreen2 extends StatefulWidget {
  const NewSignUpScreen2({Key? key}) : super(key: key);

  @override
  State<NewSignUpScreen2> createState() => _NewSignUpScreen2State();
}

class _NewSignUpScreen2State extends State<NewSignUpScreen2> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-auth-8e6e9.appspot.com/o/Page%203%20(1).mp4?alt=media&token=1ccf4620-8247-4d61-9f47-2f22e63f9c44")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(false);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 512.h, left: 10.w, right: 10.w, bottom: 30.h),
              child: SignUpCard2(),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
