// ignore_for_file:  use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tambola_frontend/Features/game/presentation/screens/tambola_ticket.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/providers/game_provider.dart';
import '../../../../core/resources/socket_methods.dart';
import '../../../../core/services/game_services.dart';
import '../../../../core/utils/showSnackBar.dart';
import '../widgets/countdown.dart';
import '../../../winner_list/presentation/screens/winner_list.dart';

class TambolaBoard extends StatefulWidget {
  final String matchID;
  const TambolaBoard({Key? key, required this.matchID}) : super(key: key);

  @override
  State<TambolaBoard> createState() => _TambolaBoardState();
}

//all the claims
enum ClaimType { firstFive, topRow, middleRow, bottomRow, tambola }

//list of all the numbers on the board
List<dynamic> allNumbers = [];
//initializing a list of numbers which are called from the backend
List<int> calledNumbers = [];
//list of numbers the user has striked from their ticket
List<int> crossedNumbers = [];
int currentNumber = 0;
//numbers striked in the rows
List<int> row1 = [];
List<int> row2 = [];
List<int> row3 = [];
bool showTable = true;

class _TambolaBoardState extends State<TambolaBoard> {
  @override
  void initState() {
    log("TAMBOLA BOARD INIT STATE");
    super.initState();
    allNumbers = Provider.of<GameProvider>(context, listen: false).draw;
    //! Provider.of<GameProvider>(context).gameTicket = randomTicket;
    Provider.of<GameProvider>(context, listen: false)
        .setGameState(matchID: widget.matchID);
    int counter = 0;
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Provider.of<GameProvider>(context, listen: false)
          .updateCurrentValue(value: allNumbers[counter]);
      //! Provider.of<GameProvider>(context, listen: false)
      //     .gameCalledNumbers
      //     .add(allNumbers[counter]);

      log("updating current value state ${allNumbers[counter].toString()}");
      currentNumber =
          Provider.of<GameProvider>(context, listen: false).currentValue;
      getNextNumber();
      debugPrint("THE TICKETS ARE ${randomTicket.toString()}");
      if (randomTicket.first.contains(currentNumber) &&
          !row1.contains(currentNumber)) {
        row1.add(currentNumber);
        log("ADDED TO FIRST ROW");
      } else if (randomTicket[1].contains(currentNumber) &&
          !row2.contains(currentNumber)) {
        row2.add(currentNumber);
        log("ADDED TO SECOND ROW");
      } else if (randomTicket.last.contains(currentNumber) &&
          !row3.contains(currentNumber)) {
        row3.add(currentNumber);
        log("ADDED TO THIRD ROW");
      } else {
        log(currentNumber.toString());
      }
      log("LENGTH OF THE RUNNING TICKETS ${row1.length.toString()} %  ${row2.length.toString()} %  ${row3.length.toString()}");
      readytoClaim();
      //todo: call the next random number from the backend number array
      counter++;

      if (counter == 90) {
        timer.cancel();

        Future.delayed(Duration(seconds: 6)).then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => WinnerList(),
              ),
              (route) => false);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    SocketMethods().finishGame(roomID: widget.matchID);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        body: Consumer<GameProvider>(
            builder: (context, gameState, _) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: greyLinerGradient),
                  child: Column(children: [
                    //to show/hide the expanded ticket widget
                    // IconButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       showTable = !showTable;
                    //     });
                    //   },
                    //   icon: Icon(
                    //     showTable
                    //         ? Icons.keyboard_arrow_up
                    //         : Icons.keyboard_arrow_down,
                    //     color: Colors.amber,
                    //     size: 60,
                    //   ),
                    // ),
                    SizedBox(height: 24.h),
                    Visibility(
                      visible: showTable,
                      child: Container(
                        height: 323.h,
                        width: 363.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: kWalletCardGradient2, width: 5),
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 4,
                                  color: Color.fromARGB(141, 1, 20, 31))
                            ]),
                        //   padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                        //creating a table of list<row> with each individual circular chip
                        child: SizedBox(
                          height: 303.h,
                          width: 337.w,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10.h, right: 10.w, left: 10.w),
                              child: Table(
                                children: createChips(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 33.h),
                    Center(
                        child: GestureDetector(
                            onTap: getNextNumber,
                            child: Container(
                                width: 339.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                    gradient: blueLiner2Gradient,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 15.w, right: 21.w),
                                      child: GradientText(
                                        "Number",
                                        style: const TextStyle(
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w500,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(4.0, 4.0),
                                              blurRadius: 10.0,
                                              color: Color.fromARGB(
                                                  123, 51, 51, 51),
                                            ),
                                          ],
                                        ),
                                        gradientType: GradientType.linear,
                                        gradientDirection:
                                            GradientDirection.ttb,
                                        radius: .5,
                                        colors: [
                                          fromCssColor('#FFFFFF'),
                                          fromCssColor('#C0C0C0'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 21.w, top: 10.h),
                                      child: CountDownPage(),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 12.w),
                                      child: Icon(
                                        Icons.volume_up,
                                        color: Color.fromARGB(255, 255, 187, 0),
                                      ),
                                    ),
                                    Icon(
                                      Icons.volume_off,
                                      color: Colors.white,
                                    ),

                                    //       Countdown(seconds: 02, build:  (_, double time) => Text(
                                    //   ""
                                    // ),
                                    // interval: Duration(seconds: 02),
                                    // onFinished: getNextNumber(), ),
                                  ],
                                ),
                              ),
                            )),
                    SizedBox(
                      height: 38.h,
                    ),
                    SizedBox(
                      height: 64.83.h,
                      width: 272.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 64.h,
                            width: 68.w,
                            decoration: BoxDecoration(
                                gradient: fireLinearGradient,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 6,
                                      color: Color.fromARGB(141, 1, 20, 31))
                                ]),
                            //displaying the current number
                            child: Center(
                              child: Text(
                                currentNumber.toString(),
                                style: TextStyle(
                                    fontSize: 30.sp,
                                    color: Color.fromARGB(220, 31, 31, 31),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),

                          //displaying the last 4 numbers from the called numbers
                          for (var i = calledNumbers.length - 2;
                              i >= 0 && i > calledNumbers.length - 6;
                              i--)
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Container(
                                height: 43.83.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                    gradient: redLinear,
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 3),
                                          blurRadius: 4,
                                          color: Color.fromARGB(143, 1, 20, 31))
                                    ]),
                                child: Center(
                                  child: Text(calledNumbers[i].toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Expanded(
                        flex: 8,
                        child: TambolaTicket(
                          checkWin: checkClaim,
                        )),
                    size.height > 700
                        ? Expanded(flex: 2, child: Container())
                        : Container(),
                  ]),
                )),
      ),
      designSize: Size(436, 926),
    );
  }

  //creating a matrix of circular chips(board items)
  List<TableRow> createChips() {
    List<TableRow> gameBoard = [];
    int id = 1;
    for (var i = 1; i < 10; i++) {
      List<Widget> currentRow = [];
      for (var j = 1; j < 11; j++, id++) {
        currentRow.add(TambolaChip(id: id));
      }
      gameBoard.add(TableRow(children: currentRow));
    }
    return gameBoard;
  }

  getNextNumber() {
    log("*  *  *  *  *  * GET NEXT NUM CALLING *  *  *  *  *  *");
    //generate a random number
    if (allNumbers.isNotEmpty) {
      print(allNumbers);
      print(calledNumbers);
      // int randomNumber = allNumbers[Random.
      // secure().nextInt(allNumbers.length)];
      setState(() {
        //current number called
        // currentNumber = randomNumber;
        //removing the current number from the list
        //to avoid repetition of numbers
        //! allNumbers.remove(currentNumber);
        calledNumbers.add(currentNumber);
      });
    } else {
      showSnackBarText(context, "GAME OVER!");
    }
  }

  //check if claim is valid
  checkClaim(ClaimType type) async {
    String matchId = Provider.of<GameProvider>(context, listen: false).matchId;
    GameServices gameService = GameServices();
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    print({
      row1.length.toString(),
      row2.length.toString(),
      row3.length.toString()
    });
    switch (type) {
      case ClaimType.firstFive:
        if (row1.length + row2.length + row3.length >= 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "corner",
              context: context);
        } else {
          showSnackBarText(context, "You haven't striked 5 numbers yet :(");
        }
        break;
      case ClaimType.topRow:
        if (row1.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "firstRow",
              context: context);
        } else {
          showSnackBarText(
              context, "You haven't striked 5 numbers in the top row yet :(");
        }
        break;
      case ClaimType.middleRow:
        if (row2.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "secondRow",
              context: context);
        } else {
          showSnackBarText(context,
              "You haven't striked 5 numbers in the middle row yet :(");
        }
        break;
      case ClaimType.bottomRow:
        if (row3.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "thirdRow",
              context: context);
        } else {
          showSnackBarText(context,
              "You haven't striked 5 numbers in the top bottom row yet :(");
        }
        break;

      case ClaimType.tambola:
        if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
          gameService.claimWin(
              userID: userId!,
              matchID: matchId,
              claimType: "tambola",
              context: context);
        } else {
          showSnackBarText(context, "You haven't completed the Tambola");
        }
        break;
    }
  }

  void readytoClaim() {
    if (row1.length == 5) {
      Provider.of<GameProvider>(context, listen: false).claimReady(
        claimType: ClaimType.topRow,
      );
    }
    if (row2.length == 5) {
      Provider.of<GameProvider>(context, listen: false).claimReady(
        claimType: ClaimType.middleRow,
      );
    }
    if (row3.length == 5) {
      Provider.of<GameProvider>(context, listen: false).claimReady(
        claimType: ClaimType.bottomRow,
      );
    }
    if (row1.length + row2.length + row3.length == 5) {
      Provider.of<GameProvider>(context, listen: false).claimReady(
        claimType: ClaimType.firstFive,
      );
    }
    if (row1.length == 5 && row2.length == 5 && row3.length == 5) {
      log("CHECKING THE TAMBOLA CONDITION !!!");
      Provider.of<GameProvider>(context, listen: false).claimReady(
        claimType: ClaimType.tambola,
      );
    }
  }
}

//a widget for each individual chip to enable color change
class TambolaChip extends StatelessWidget {
  final int id;

  const TambolaChip({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, top: 8.h),
          child: Container(
            margin: EdgeInsets.all(0.w.h),
            height: 25.h,
            width: 30.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                //change the gradient of the chip if number was called
                gradient: getGradient(),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 5.r,
                      spreadRadius: 1.r,
                      color: Color.fromARGB(167, 58, 57, 57))
                ]),
            child: Center(
              child: Text(
                id.toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      designSize: const Size(428, 915),
    );
  }

  //return the corresponding gradient if the color was called or not
  getGradient() {
    if (currentNumber == id) {
      return fireLinearGradient;
    } else if (calledNumbers.contains(id)) {
      return redLinear;
    } else {
      return blueGradient;
    }
  }
}

//widget for each user ticket item/number cell
class TicketItem extends StatefulWidget {
  final int id;
  final int rowNumber;
  final number;
  final bool isBlank;

  const TicketItem(
      {required this.id,
      required this.rowNumber,
      required this.number,
      this.isBlank = false,
      Key? key})
      : super(key: key);

  @override
  State<TicketItem> createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //on tap check if number was called
      onTap: checkNumber,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3.0),
        duration: const Duration(milliseconds: 700),
        //determine the color of the ticket item if it is striked by the user
        color: isCrossed() ? Colors.red : Colors.white,
        alignment: Alignment.center,
        child: Text(
          widget.number.toString(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  //check if number was called and update corresponding row list for keeping track of strikes
  checkNumber() {
    setState(() {
      if (calledNumbers.contains(widget.number)) {
        crossedNumbers.add(widget.number);

        if (!widget.isBlank &&
            widget.rowNumber == 1 &&
            !row2.contains(widget.number)) {
          row1.add(widget.number);
        } else if (!widget.isBlank &&
            widget.rowNumber == 2 &&
            !row2.contains(widget.number)) {
          row2.add(widget.number);
        } else if (!widget.isBlank &&
            widget.rowNumber == 3 &&
            !row3.contains(widget.number)) {
          row3.add(widget.number);
        }
      } else {
        showSnackBarText(context, "The number wasn't called out yet");
      }
    });
  }

  //check if number is called
  isCrossed() {
    return crossedNumbers.contains(widget.number);
  }
}
