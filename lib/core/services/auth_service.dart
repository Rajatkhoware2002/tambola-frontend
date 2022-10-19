// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/strings.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../utils/showSnackBar.dart';
import 'error_handling.dart';

class AuthService {
  Future<dynamic> signUpWithPhone(
      {required BuildContext context,
      required String name,
      required String mobile,
      required String password}) async {
    try {
      // final user = UserClass(
      //     username: name, mobile: int.parse(mobile), password: password);
      // debugPrint(user.username);

      http.Response res = await http.post(
        Uri.parse('$baseUri/auth/register'),
        body: jsonEncode //user.toJson(),
            ({
          "authType": "Local",
          "username": name,
          "mobile": mobile,
          "password": password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          onSuccess: () {
            debugPrint("Signed in successfully!");
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          });
      if (res.statusCode != 200) {
        showSnackBarText(context, "something went wrong !!!");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<dynamic> signInWithUsernameOrPhone(
      {required String username,
      required String password,
      required BuildContext context}) async {
    bool isSignupSuccess = false;
    var response = await http.post(Uri.parse('$baseUri/auth/login'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        });

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    httpErrorHandle(
        response: response,
        onSuccess: () async {
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          final User user = userFromJson(response.body);
          print("TOCKEN ${user.token}");
          SharedPreferences preferences = await SharedPreferences.getInstance();
          await preferences.setString('x-auth-token', user.token);
          await preferences.setString("userID", user.user.id!);
          debugPrint(preferences.getString('x-auth-token').toString());
          log("SHARED PREF USERID");
          debugPrint(preferences.getString('userID').toString());

          Navigator.pushNamedAndRemoveUntil(
           //   context, '/select-room', (route) => false);
             context, '/bottom-bar', (route) => false);
        });
    // Navigator.pushNamed(context, '/select-room');
    if (response.statusCode == 400) {
      showSnackBarText(context, "Wrong Password !!!");
      showSnackBarText(context, "enter the currect password");
    }
    if (response.statusCode == 404) {
      showSnackBarText(context, "User Not Found !!!");
    }
    if (response.statusCode != 404 &&
        response.statusCode != 400 &&
        response.statusCode != 200 &&
        response.statusCode != 201) {
      showSnackBarText(context, "Something Went wrong !!!");
    }
  }

  Future<dynamic> signOutUser(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('x-auth-token');
    Navigator.pushNamed(context, '/login');
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var isTokenExist = preferences.containsKey('x-auth-token');
    return isTokenExist;
  }
}
