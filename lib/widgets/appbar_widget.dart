import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String txt) {
  return AppBar(
    title: Text(txt),
    centerTitle: true,
    leading: BackButton(),
    backgroundColor: Colors.indigo,
    elevation: 0,
  );
}