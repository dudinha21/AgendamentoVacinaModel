import 'dart:io';

import 'package:flutter/material.dart';
import 'package:agendamento_vacina/models/usuario.dart';

class UsuarioRepository {
  static const meuUsuario = Usuario(
    imagePath: 'https://pbs.twimg.com/profile_images/1398328513980153860/esvptsnl_400x400.jpg',
    nome: 'Regina Rouca',
    email: 'reginarouca_tiktok@gmail.com',
    cpf: '123.456.789-10',
    cartaoSus: '987 654 321 000',
    dataNascimento: '10/10/1978',
    cidade: 'Arapiroca',
    endereco: 'Rua Se Liga Hein Nº 22',
  );
}