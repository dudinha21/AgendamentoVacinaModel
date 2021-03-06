import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vacinai_app/pages/perfil_page.dart';

class LoginPage extends StatefulWidget {
  final Function toggleScreen;

  const LoginPage({Key? key, required this.toggleScreen}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //TEXT_FORM_FIELD CONTROLLER E KEY
    TextEditingController _emailController = TextEditingController();
    TextEditingController _senhaController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    //TELA LOGIN
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //BOTÃO VOLTAR
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.blue,
              ),

              //IMAGEM
              Container(
                height: 300.0,
                child: const Image(
                  image: AssetImage("images/login.png"),
                  fit: BoxFit.contain,
                ),
              ),

              //ESPAÇO
              const SizedBox(
                height: 44.0,
              ),

              //CAMPO E-MAIL
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe seu email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
              ),

              //ESPAÇO
              const SizedBox(
                height: 26.0,
              ),

              //CAMPO SENHA
              TextFormField(
                controller: _senhaController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe sua senha';
                  } else if (value.length < 6) {
                    return 'Sua senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Senha",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),

              //ESPAÇO
              const SizedBox(
                height: 12.0,
              ),

              //BOTÃO ESQUECEU SENHA
              const Text(
                "Esqueceu sua senha?",
                style: TextStyle(
                  color: Colors.indigo,
                ),
              ),

              //ESPAÇO
              const SizedBox(
                height: 88.0,
              ),

              //BOTÃO LOGIN
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Email: ${_emailController.text}");
                    print("Senha: ${_senhaController.text}");
                  }
                },
                height: 70,
                minWidth: double.infinity,
                color: Colors.indigo,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //ESPAÇO
              const SizedBox(
                height: 20,
              ),

              //BOTÃO CADASTRE-SE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não tem uma conta?",
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () => widget.toggleScreen(),
                    child: const Text("Cadastre-se"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
