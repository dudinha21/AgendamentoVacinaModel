import 'package:agendamento_vacina/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';

class InfosWidget extends StatelessWidget {
  final usuario = UsuarioRepository.meuUsuario;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, usuario.cpf, 'CPF'),
          buildDivider(),
          buildButton(context, usuario.cartaoSus, 'CNS'),
          buildDivider(),
          buildButton(context, usuario.dataNascimento, 'Data de Nascimento'),
        ],
    ),
  );
  
  Widget buildDivider() => Container(
        height: 20,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      );
}