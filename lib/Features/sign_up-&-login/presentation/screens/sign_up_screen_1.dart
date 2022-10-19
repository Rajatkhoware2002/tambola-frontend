import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../widgets/sign_up_card_1.dart';

class NewSignUpScreen extends StatefulWidget {
  const NewSignUpScreen({Key? key}) : super(key: key);

  @override
  State<NewSignUpScreen> createState() => _NewSignUpScreenState();
}

class _NewSignUpScreenState extends State<NewSignUpScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/flutter-firebase-auth-8e6e9.appspot.com/o/Page%202%20(part%201).mp4.mp4?alt=media&token=8ac0ae09-e324-4579-ae2a-d52c074a3c0b")
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
                  top: 512.h, bottom: 20.h, right: 15.w, left: 15.w),
              child: SignUpCard1(),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}
