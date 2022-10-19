import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tambola_frontend/Features/game/presentation/screens/tambola_board.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/gradients.dart';
import '../../../../core/providers/game_provider.dart';
import '../../../../core/services/game_services.dart';

class TambolaTicket extends StatefulWidget {
  final ValueChanged<ClaimType> checkWin;
  final bool isClickable;
  const TambolaTicket(
      {required this.checkWin, this.isClickable = false, Key? key})
      : super(key: key);

  @override
  State<TambolaTicket> createState() => _TambolaTicketState();
}

//user's ticket
class _TambolaTicketState extends State<TambolaTicket> {
  final gameService = GameServices();
  // final tamb= const TambolaBoard(matchID: "");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 8, color: kWalletCardGradient2),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
              ),
              child: Table(
                border:
                    TableBorder.symmetric(inside: const BorderSide(width: 1)),
                children: getTicket(),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<GameProvider>(
              builder: (context, gameState, _) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        tambolaButton("FIRST 5", ClaimType.firstFive,
                            gameState.firstFiveC),
                        tambolaButton(
                            "TOP ROW", ClaimType.topRow, gameState.topRowC),
                        tambolaButton("MIDDLE ROW", ClaimType.middleRow,
                            gameState.middleRowC),
                        tambolaButton("BOTTOM ROW", ClaimType.bottomRow,
                            gameState.bottomRowC),
                      ],
                    ),
                    const SizedBox(height: 5),
                    tambolaButton(
                        "Tambola", ClaimType.tambola, gameState.tambolaC),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector tambolaButton(String text, ClaimType type, Color chipColor) {
    return GestureDetector(
      onTap:
          //  function,
          () async => widget.checkWin(type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: chipColor,

          borderRadius: BorderRadius.circular(20),
          // gradient: blackLinear
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}

//todo: get the radom generated ticket from the backend instead of RandomTicket
List<TableRow> getTicket() {
  int id = 0;
  List<TableRow> tambolaRows = [];
  for (var i = 0; i < 3; i++) {
    List<Widget> row = [];
    for (var j = 0; j < 9; j++, id++) {
      var number = randomTicket[i][j];
      if (number != 0) {
        row.add(TicketItem(id: id, rowNumber: i + 1, number: number));
      } else {
        row.add(TicketItem(
          id: id,
          rowNumber: i + 1,
          number: "",
          isBlank: true,
        ));
      }
    }
    tambolaRows.add(TableRow(children: row));
  }
  return tambolaRows;
}

//claim buttons

class TambolaButton extends StatelessWidget {
  final String text;
  final bool isClaimed;
  final ClaimType type;
  final VoidCallback checkWin;
  const TambolaButton(
      {required this.text,
      this.isClaimed = false,
      required this.type,
      required this.checkWin,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checkWin();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), gradient: blackLinear),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
