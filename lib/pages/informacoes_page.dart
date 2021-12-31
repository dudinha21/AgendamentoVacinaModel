import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformacoesPage extends StatefulWidget {
  const InformacoesPage({Key? key}) : super(key: key);

  @override
  _InformacoesPageState createState() => _InformacoesPageState();
}

class _InformacoesPageState extends State<InformacoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações sobre o agendamento'),
        centerTitle: true,
      ),
    );
  }
}
