// ignore_for_file: avoid_print, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Features/game/presentation/screens/tambola_board.dart';
import '../constants/colors.dart';
import '../models/socket_data.dart';
import '../models/ticket_model.dart';

class GameProvider extends ChangeNotifier {
  List<dynamic> _draw = [];
  List<SocketData> _activeUsers = [];
  int _currentDrawValue = 0;
  String _gameStateMatchId = "";
  TicketModel gameTicket = TicketModel(x: []);
  List<int> gameCalledNumbers = [];
  bool _isStart = false;
  Color _topRowC = kBlackLinear1;
  Color _middleRowC = kBlackLinear1;
  Color _bottomRowC = kBlackLinear1;
  Color _firstFiveC = kBlackLinear1;
  Color _tambolaC = kBlackLinear1;

  bool _isClaimedTopRow = false;
  bool _isClaimedMiddleRow = false;
  bool _isClaimedBottomRow = false;
  bool _isClaimedFirstFive = false;
  bool _isClaimedTambola = false;

  Color get topRowC => _topRowC;
  Color get middleRowC => _middleRowC;
  Color get bottomRowC => _bottomRowC;
  Color get firstFiveC => _firstFiveC;
  Color get tambolaC => _tambolaC;

  List<dynamic> get draw => _draw;
  List<SocketData> get activeUsers => _activeUsers;
  int get currentValue => _currentDrawValue;
  String get matchId => _gameStateMatchId;
  bool get isStart => _isStart;
  void addDraw({required List<int> draw}) {
    draw = draw;
    notifyListeners();
  }

  void setActiveUsers({required List<SocketData> listActiveUsers}) {
    _activeUsers = listActiveUsers;
    print("setting active users $activeUsers");
    notifyListeners();
  }

  void setDraw({required List<dynamic> drawData}) {
    _draw = drawData;
    print("DRAW STATE $_draw");
    // isDraw.value = true;
    notifyListeners();
  }

  void changeStart() {
    _isStart =true;
    notifyListeners();
  }

  void updateCurrentValue({required int value}) {
    _currentDrawValue = value;
    print("updated DRAW VALUE $_currentDrawValue");
    notifyListeners();
  }

  void setGameState({required String matchID}) {
    _gameStateMatchId = matchID;
    notifyListeners();
  }

  void claimReady({required ClaimType claimType}) {
    // final ticket = gameTicket.x.first.entries;
    // List<int> calledNum = gameCalledNumbers;
    if (!_isClaimedTopRow && claimType == ClaimType.topRow) {
      // int count = 0;

      // for (int i = 0; i < ticket.first.length; i++) {
      //   if (calledNum.contains(ticket.first[i])) {
      //     count = count + 1;
      //   }
      // }
      // if (count == 5) {
      //   _topRowC = kBlueClaimReady;
      //   notifyListeners();
      // }
      _topRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedMiddleRow && claimType == ClaimType.middleRow) {
      // int count = 0;

      // for (int i = 0; i < ticket[1].length; i++) {
      //   if (calledNum.contains(ticket[1][i])) {
      //     count = count + 1;
      //   }
      // }
      // if (count == 5) {
      //   _middleRowC = kBlueClaimReady;
      //   notifyListeners();
      // }
      _middleRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedBottomRow && claimType == ClaimType.bottomRow) {
      // int count = 0;

      // for (int i = 0; i < ticket[2].length; i++) {
      //   if (calledNum.contains(ticket[2][i])) {
      //     count = count + 1;
      //   }
      // }
      // if (count == 5) {
      //   _bottomRowC = kBlueClaimReady;
      //   notifyListeners();
      // }
      _bottomRowC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedFirstFive && claimType == ClaimType.firstFive) {
      // int count = 0;

      // for (int i = 0; i < ticket[1].length; i++) {
      //   if (calledNum.contains(ticket[1][i])) {
      //     count = count + 1;
      //   }
      // }
      // if (count == 5) {
      //   _firstFiveC = kBlueClaimReady;
      //   notifyListeners();
      // }
      _firstFiveC = kBlueClaimReady;
      notifyListeners();
    }
    if (!_isClaimedTambola && claimType == ClaimType.tambola) {
      // int count = 0;

      // for (int i = 0; i < ticket[1].length; i++) {
      //   if (calledNum.contains(ticket[1][i])) {
      //     count = count + 1;
      //   }
      // }
      // if (count == 5) {
      //   _tambolaC = kBlueClaimReady;
      //   notifyListeners();
      // }
      _tambolaC = kBlueClaimReady;
      notifyListeners();
    }
  }

  void setClaim({required String claimType}) {
    print("READY FOR CLAIMED COLOR CHANGE  $claimType");
    if (claimType == "corner") {
      _firstFiveC = kRedLinearColor1;
      _isClaimedFirstFive = true;
      notifyListeners();
    } else if (claimType == "firstRow") {
      _topRowC = kRedLinearColor1;
      _isClaimedTopRow = true;
      notifyListeners();
    } else if (claimType == "secondRow") {
      _middleRowC = kRedLinearColor1;
      _isClaimedMiddleRow = true;
      notifyListeners();
      print("second row chip color RED");
    } else if (claimType == "thirdRow") {
      _bottomRowC = kRedLinearColor1;
      _isClaimedBottomRow = true;
      notifyListeners();
    } else if (claimType == "tambola") {
      _tambolaC = kRedLinearColor1;
      _isClaimedTambola = true;
      notifyListeners();
    }
  }
}
