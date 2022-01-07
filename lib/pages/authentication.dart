import 'package:flutter/material.dart';
import 'package:vacinai_app/pages/cadastro_page.dart';
import 'package:vacinai_app/pages/login_page.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toggleScreen() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return CadastroPage(toggleScreen: toggleScreen);
    } else {
      return LoginPage(toggleScreen: toggleScreen);
    }
  }
}
