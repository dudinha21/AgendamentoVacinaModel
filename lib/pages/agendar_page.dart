import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_agendamento_vacina/models/agendamento.dart';

class AgendarPage extends StatefulWidget {
  Agendamento agendamento;

  AgendarPage({Key? key, required this.agendamento}) : super(key: key);

  @override
  _AgendarPageState createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();

  salvar() {
    if (_form.currentState!.validate()) {

      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Agendamento realizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Editar agendamento'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Icon(Icons.calendar_today),
                        width: 50,
                      ),
                      Container(width: 10),
                      Text(
                        widget.agendamento.horario,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  )),
              Form(
                key: _form,
                child: TextFormField(
                  controller: _valor,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Data',
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe a data';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: _valor,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Horario',
                    prefixIcon: Icon(Icons.access_time),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o horário';
                    }
                    return null;
                  },
                ),
              ),
              Form(
                key: _form,
                child: TextFormField(
                  controller: _valor,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Local',
                    prefixIcon: Icon(Icons.maps_home_work_outlined),
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe o local';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 24),
                child: ElevatedButton(
                  onPressed: salvar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Agendar',
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
