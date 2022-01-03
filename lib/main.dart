import 'package:agendamento_vacina/my_app.dart';
import 'package:agendamento_vacina/pages/home_page.dart';
import 'package:agendamento_vacina/pages/profile_page.dart';
import 'package:agendamento_vacina/pages/login_page.dart';
import 'package:agendamento_vacina/services/auth_service.dart';
import 'package:agendamento_vacina/widgets/auth_check.dart';
import 'package:flutter/material.dart';
import 'package:agendamento_vacina/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  
  runApp(
    MaterialApp(
      title: 'Agendamento de vacinação',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        dividerColor: Colors.grey,
      ),
      home: HomePage(),
    ),
  );
}