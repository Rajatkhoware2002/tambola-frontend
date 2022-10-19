import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../widgets/start_card.dart';

class SignUpStart extends StatefulWidget {
  const SignUpStart({Key? key}) : super(key: key);

  @override
  State<SignUpStart> createState() => _SignUpStartState();
}

class _SignUpStartState extends State<SignUpStart> {
  late VideoPlayerController _controller;
  final String uri =
      "https://www.googleapis.com/drive/v3/files/1EnZzEBoPH98BuZiV-_1uacBZy9Qcgt2c?alt=media&key=AIzaSyBESCVqgXk5Y4c9vexeamg8FAit3xSM3fY";
     // https://firebasestorage.googleapis.com/v0/b/flutter-firebase-auth-8e6e9.appspot.com/o/1%20(2).mp4?alt=media&token=62ab01fa-8dd6-40a0-b37f-4281cea44bbd
  //https://www.googleapis.com/drive/v3/files/1EnZzEBoPH98BuZiV-_1uacBZy9Qcgt2c?alt=media&key=AIzaSyBESCVqgXk5Y4c9vexeamg8FAit3xSM3fY
  // http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4
  //https://drive.google.com/file/d/1nULpd1_JU8mWp4lh9awDhtuSZFk6y46w/view?usp=sharing
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(uri)
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
                  top: 512.h, bottom: 30.h, left: 15.w, right: 15.w),
              child: StartCard0(),
            ),
          ],
        ),
      ),
      designSize: const Size(428, 926),
    );
  }
}


// class VideoPlayerWidget extends StatelessWidget {
//   final VideoPlayerController controller;
//   const VideoPlayerWidget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  controller.value.isInitialized
//         ? Container(
//             alignment: Alignment.topCenter,
//             child: buildVideo(),
//           )
//         : Container(
//             height: 200, child: Center(child: CircularProgressIndicator()));
//   }

//   Widget buildVideo() => buildVideoPlayer();

//   Widget buildVideoPlayer() => VideoPlayer(controller);
// }

// class SignUpStart extends StatefulWidget {
//   const SignUpStart({Key? key}) : super(key: key);

//   @override
//   State<SignUpStart> createState() => _SignUpStartState();
// }

// class _SignUpStartState extends State<SignUpStart> {
//   // initializing video player
//   final VideoPlayerController videoPlayerController =
//       VideoPlayerController.network(" https://firebasestorage.googleapis.com/v0/b/flutter-firebase-auth-8e6e9.appspot.com/o/1%20(2).mp4?alt=media&token=62ab01fa-8dd6-40a0-b37f-4281cea44bbd");

//   ChewieController? chewieController;

//   // init State
//   @override
//   void initState() {
//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       aspectRatio: 12 / 22,
//       autoPlay: true,
//       looping: false,
//       autoInitialize: true,
//       showControls: false,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     videoPlayerController.dispose();
//     chewieController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Chewie(
//               controller: chewieController!,
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                   top: 512.h, bottom: 30.h, left: 15.w, right: 15.w),
//               child: StartCard0(),
//             ),
//           ],
//         ),
//       ),
//       designSize: const Size(428, 926),
//     );
//   }
// }
