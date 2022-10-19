import 'package:flutter/material.dart';

void showSnackBarText(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
