import 'package:app_agendamento_vacina/models/agendamento.dart';
import 'package:app_agendamento_vacina/pages/agendar_page.dart';
import 'package:app_agendamento_vacina/repositories/agendamento_repository.dart';
import 'package:flutter/material.dart';

class VerAgendamentoPage extends StatefulWidget {
  const VerAgendamentoPage({Key? key}) : super(key: key);

  @override
  _VerAgendamentoPageState createState() => _VerAgendamentoPageState();
}

class _VerAgendamentoPageState extends State<VerAgendamentoPage> {
  final tabela = AgendamentoRepository.tabela;
  List<Agendamento> selecionadas = [];

  var agendamento;

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Agendamento'),
        centerTitle: true,
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        title: Text('${selecionadas.length} selecionado'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  agendar(Agendamento agendamento) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AgendarPage(agendamento: agendamento),
        ));
  }

  limparSelecionas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int agendamento) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: (selecionadas.contains(tabela[agendamento]))
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Icon(Icons.calendar_today),
                    width: 40,
                  ),
            title: Row(
              children: [
                Text(
                  tabela[agendamento].data,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            trailing: Text(
              tabela[agendamento].horario,
            ),
            selected: selecionadas.contains(tabela[agendamento]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[agendamento]))
                    ? selecionadas.remove(tabela[agendamento])
                    : selecionadas.add(tabela[agendamento]);
              });
            },
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, __) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                agendar(tabela[agendamento]);
              },
              icon: Icon(Icons.edit),
              label: Text(
                'EDITAR AGENDAMENTO',
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
