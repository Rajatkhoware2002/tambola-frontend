import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import 'tambola_board.dart';

Timer? _timer;

@override
void dispose() {
  _timer?.cancel();
  dispose();
}

class GameWaiting extends StatefulWidget {
  final String matchID;
  final int activeCount;
  const GameWaiting({Key? key, this.activeCount = 2, required this.matchID})
      : super(key: key);

  @override
  State<GameWaiting> createState() => _GameWaitingState();
}

class _GameWaitingState extends State<GameWaiting> {
  bool isStart = false;
  late int _start;
  @override
  void initState() {
    super.initState();
    checkActiveCount();
    _start = 15;
  }

  void checkActiveCount() {
    if (widget.activeCount > 1) {
      setState(() {
        isStart = true;
        startTimer();
      });
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TambolaBoard(
                          matchID: widget.matchID,
                        )));
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambola"),
        backgroundColor: kBlackLinear1,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Column(children: [
          AspectRatio(
            aspectRatio: 3,
            child: Visibility(
              visible: !isStart,
              child: Center(
                child: Text(
                  "Waiting for participants to join",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          Text(
            "$_start",
            style: Theme.of(context).textTheme.headline1,
          )
        ]),
      ),
    );
  }
}
