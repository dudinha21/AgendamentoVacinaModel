import 'dart:js';
import 'package:agendamento_vacina/models/usuario.dart';
import 'package:agendamento_vacina/repositories/usuario_repository.dart';
import 'package:agendamento_vacina/services/auth_service.dart';
import 'package:agendamento_vacina/widgets/appbar_widget.dart';
import 'package:agendamento_vacina/widgets/button_widget.dart';
import 'package:agendamento_vacina/widgets/infos_widget.dart';
import 'package:agendamento_vacina/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String txt = 'Meu perfil';

  @override
  Widget build(BuildContext context) {
    final usuario = UsuarioRepository.meuUsuario;

    return Scaffold(
      appBar: buildAppBar(context, txt),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: usuario.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 15),
          buildName(usuario),
          const SizedBox(height: 18),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 18),
          InfosWidget(),
          const SizedBox(height: 20),
          buildEndereco(usuario),
        ],
      ),
    );
  }

  Widget buildName(Usuario usuario) => Column(
    children: [
      Text(
        usuario.nome,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 8),
      Text(
        usuario.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'Gerenciar conta',
    onClicked: () {},
  );

  Widget buildEndereco(Usuario usuario) => Container(
    padding: EdgeInsets.symmetric(horizontal: 65),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cidade',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          usuario.cidade,
          style: TextStyle(fontSize: 12, height: 1.4),
        ),
        const SizedBox(height: 10),
        Text(
          'Endereço',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          usuario.endereco,
          style: TextStyle(fontSize: 12, height: 1.4),
        ),
      ],
    ),
  );
}