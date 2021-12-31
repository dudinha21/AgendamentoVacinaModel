import 'package:app_agendamento_vacina/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_app.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'AgendamentoVacina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    ),
  );
}
