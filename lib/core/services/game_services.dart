// ignore_for_file:  use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/add_money/presentation/screens/add_money_page.dart';
import '../constants/export.dart';
import '../constants/strings.dart';
import '../models/match_model.dart';
import '../models/socket_data.dart';
import '../models/start_game_model.dart';
import '../models/ticket_model.dart';
import '../providers/game_provider.dart';
import '../resources/socket_methods.dart';
import '../utils/showSnackBar.dart';
import 'error_handling.dart';

List<List<int>> randomTicket = [];

class GameServices {
  var client = http.Client();
  Map<String, String> header = {
    'Content-Type': 'application/json;charset=UTF-8'
  };

  void createMatch(
      {required String createdID, required BuildContext context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    var url = Uri.tryParse(
      '$baseUri/room/creatematch',
    );
    try {
      var response = await http.post(url!,
          body: jsonEncode({"createrId": createdID}), headers: header);
      log('Response status: ${response.statusCode}');
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final matchData = matchModelFromJson(response.body);
            debugPrint("NEW GAME CREATED && ID ${matchData.match.id}");
            var url = Uri.tryParse(
              '$baseUri/room/ticket',
            );
            try {
              var response = await http.post(url!,
                  body: jsonEncode({
                    "userId": userId,
                    "matchId": matchData.match.id,
                    "ticketCount": 1
                  }),
                  headers: header);
              httpErrorHandle(
                  response: response,
                  onSuccess: () {
                    final ticketData = ticketModelFromJson(response.body);
                    if (ticketData.x.first.entries.isNotEmpty) {
                      log("TICKET NOT EMPTY");
                      randomTicket = ticketData.x.first.entries;
                      log(randomTicket.toString());
                    }
                  });
            } catch (e) {
              debugPrint('Response : $e');
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddMoneyScreen(
                          matchID: matchData.match.id,
                          isCreater: true,
                        )));
          });
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  void joinMatch(
      {required String matchID,
      String? userID,
      required BuildContext context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");

    debugPrint("JOINING MATCH ID : $matchID");
    var url = Uri.tryParse(
      '$baseUri/room/joinmatch',
    );
    try {
      var response = await http.post(url!,
          body: jsonEncode({"userId": userId, "matchId": matchID}),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final matchData = matchModelFromJson(response.body);
            log("JOINED A NEW GAME && GAME MEMBERS ${matchData.match.members.toString()}");
            if (matchData.match.members.length > 1) {
              
            }
          });
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  void startMatch(
      {required String matchID, required BuildContext context}) async {
    log('INSIDE START MATCH METHOD :)');

    final activeUsers =
        Provider.of<GameProvider>(context, listen: false).activeUsers;

    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("userID");
    var url = Uri.tryParse(
      '$baseUri/room/start',
    );
    try {
      var response = await http.post(url!,
          body: jsonEncode({"matchId": matchID}), headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            log("REST : START MATCH SUCCESS");
            final matchData = startGameDataFromJson(response.body);

            debugPrint(matchData.data.members.toString());
            final filter = matchData.data.members.toSet();
            final users = await filterUsers(
                activeUsers: activeUsers, members: filter.toList());
            if (users != null) {
              debugPrint("FILTERING MEMBERS COMPLETE : ${users.toString()}");
              if (users.length > 1 && users.isNotEmpty) {
                debugPrint(
                    "CHECKING THE MEMBERS LENGTH && DATA : ${users.length.toString()} <> ${matchData.data.draw.toString()}");
                getTicket(
                    users: users,
                    userID: userId!,
                    matchID: matchID,
                    draw: matchData.data.draw);
                SocketMethods().socketJoin(roomID: matchID, users: users);
              }
            }
          });
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  void getTicket(
      {required String userID,
      required List<String> users,
      required String matchID,
      required List<int> draw}) async {
    log("INSIDE GET TICKET METHOD");
    var url = Uri.tryParse(
      '$baseUri/room/ticket',
    );
    try {
      var response = await http.post(url!,
          body: jsonEncode(
              {"userId": userID, "matchId": matchID, "ticketCount": 1}),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            final ticketData = ticketModelFromJson(response.body);
            if (ticketData.x.first.entries.isNotEmpty) {
              randomTicket = ticketData.x.first.entries;
              debugPrint("TICKET NOT EMPTY > > ${randomTicket.toString()}");
            }

            SocketMethods().socketStart(
              draw: draw,
              roomID: matchID,
              users: users,
            );
          });
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  void claimWin({
    required String userID,
    required String matchID,
    required String claimType,
    required BuildContext context,
  }) async {
    var url = Uri.tryParse('$baseUri/room/claim/');
    try {
      var response = await http.post(url!,
          body: jsonEncode({
            "userId": userID,
            "matchId": matchID.trim(),
            "claimType": claimType.trim()
          }),
          headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            log("REST : CLAIM SUCCESS !!!");

            showSnackBarText(context, "Congrats, You have won the $claimType!");

            SocketMethods().claimWin(
                roomID: matchID, userName: "USER NAME", claimType: claimType);
          });
      if (response.statusCode == 400) {
        showSnackBarText(context, "Already Claimed !!!");
      }
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  void finishMatch(
      {required String matchID, required BuildContext context}) async {
    var url = Uri.tryParse(
      '$baseUri/room/remove',
    );
    try {
      var response = await http.delete(url!,
          body: jsonEncode({"matchId": matchID}), headers: header);
      httpErrorHandle(
          response: response,
          onSuccess: () {
            showSnackBarText(context, "Game Ended!!!");
          });
    } catch (e) {
      debugPrint('Response : $e');
    }
  }

  Future<List<MatchData>> allMatch() async {
    List<MatchData> data = [];
    var url = Uri.tryParse(
      '$baseUri/room/allmatch',
    );
    try {
      var response = await http.get(url!);
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            final allData = AllMatchModel.fromJson(jsonDecode(response.body));
            debugPrint(
                "SERVER ALL MATCHES ARE ${allData.beta.length} , REMOVE AFTER DEBUG !!!");
            data = allData.beta;
            // return data;
          });
    } catch (e) {
      debugPrint('Response : $e');
    } finally {
      // client.close();
    }
    return data;
  }

  Future<List<String>?> filterUsers(
      {required List<SocketData> activeUsers,
      required List<String> members}) async {
    List<String> filterList = [];
    if (activeUsers.isEmpty || members.isEmpty) return null;
    await Future.forEach(activeUsers, (SocketData i) async {
      await Future.forEach(members, (String member) async {
        if (i.userId == member) {
          debugPrint("MEMEBERS MATCHING ${i.userId}");
          filterList.add(i.socketId);
        } else {
          log("USER ID NOT MATCHING :(");
        }
      });
    });
    log("RETURN FILTER LIST ${filterList.toString()}");
    return filterList;
  }
}
