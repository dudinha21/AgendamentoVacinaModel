import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/cadastro.dart';
import 'package:flutter_application_1/op_agendamento.dart';
import 'package:flutter_application_1/infos.dart';
import 'package:flutter_application_1/data/pacote.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Future<void> listaFuncoes;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text('LOGIN'),
      titleSpacing: 10,
      elevation: 10,
      toolbarHeight: 80,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFFDA97FF), 
            Color(0xFF138AB6)
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )),
      ),
    );
  }

  buildBody() {
    return Material(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 50,
          left: 60,
          right: 60,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset("assets/imagens/logo.png"),
            ),
            SizedBox(height: 20),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              id = 'cpf_login',
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              autofocus: true,
              obscureText: true,
              id = 'senha_login',
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Esqueceu sua senha?"),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFFDA97FF), 
                    Color(0xFF138AB6)
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                  child: TextButton(
                onPressed: (){
                   initState() {
                    super.initState();
                    listaFuncoes = FuncoesDao().login();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadsPage()),
                  );
                },
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfosPage()),
                  );
                },
                child: Text(
                  "Mais Informações",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
