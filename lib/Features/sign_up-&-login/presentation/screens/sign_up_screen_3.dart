import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../widgets/sign_up_card_4.dart';

class NewSignUpScreen3 extends StatefulWidget {
  final String userName;
  NewSignUpScreen3({Key? key, required this.userName}) : super(key: key);

  @override
  State<NewSignUpScreen3> createState() => _NewSignUpScreen2State();
}

class _NewSignUpScreen2State extends State<NewSignUpScreen3> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-auth-8e6e9.appspot.com/o/Page%204%20(1).mp4?alt=media&token=a2bc9e63-c07d-4419-94f7-6476a8d41d20")
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
                  top: 512.h, bottom: 30.h, left: 10.h, right: 10.h),
              child: SignUpCard4(userName: widget.userName),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
