import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../models/socket_data.dart';
import '../providers/game_provider.dart';
import 'socket_client.dart';

ValueNotifier<bool> isDraw = ValueNotifier(false);

class SocketMethods {
  final socket = SocketClient.instance.socket;
  // final GameProvider gameState = GameProvider();
  connectToServer({required BuildContext context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userID = pref.getString("userID");
    List<SocketData> socketData = [];
    try {
      debugPrint(socket.id);

      // Connect to websocket
      socket.connect();

      socket.onConnect((data) => debugPrint('connected to the Socket Server'));

      socket.emit(
        'new-user-add',
        userID,
      );
      socket.on("get-users", (data) {
        final activeUsers = socketDataFromJson(jsonEncode(data));
        debugPrint("active& converted$data");
        Provider.of<GameProvider>(context, listen: false)
            .setActiveUsers(listActiveUsers: activeUsers);
      });
      socket.on('StartedGame', (data) {
        // debugPrint(data.toString());
        List<dynamic> startedGameData = data;
        Provider.of<GameProvider>(context, listen: false)
            .setDraw(drawData: startedGameData);
      });
      socket.on('claimed', (data) {
        log("SHOW THE USERS CLAIM :) ${data[1].toString()}");

        // showSnackBarText(context, "${data[0]} have won the ${data[1]}!");
        Provider.of<GameProvider>(context, listen: false).setClaim(
          claimType: data[1],
        );
      });

      //listens when the client is disconnected from the Server
      socket.on('disconnect', (data) {
        debugPrint('disconnect');
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return socketData;
  }

  disposeSocket() {
    socket.dispose();
  }

  void socketJoin({String? roomID, List<String>? users}) async {
    log("INSIDE JOIN GAME");
    socket.emit('join', ({roomID, users}));
    socket.on("get-users", (data) {
      debugPrint(data);
    });
  }

  void socketStart({
    String? roomID,
    List<String>? users,
    List<int>? draw,
  }) async {
    socket.emit('StartGame', ({roomID, users, draw}));
    log("EMITED START GAME SOCKET");
    socket.on('StartedGame', (data) {
      print(data);
      log("WHICH RECIEVES DATA ON STARTED GAME");
    });
  }

  //TODO:
  void claimWin(
      {required String roomID,
      required String userName,
      required String claimType}) {
    socket.emit("claim", {roomID, userName, claimType});
  }

  //TODO:
  void claimedWin() {
    socket.on('claimed', (data) {
      log("SOCKET CLAIMED METHOD ");
      debugPrint(data);
    });
  }

  //TODO:
  void finishGame({required String roomID}) {
    socket.emit('finish', jsonEncode({roomID}));
  }
}
