import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String cpf, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: cpf, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-passowrd') {
        throw AuthException('Senha muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este cpf já está cadastrado');
      }
    }
  }

  login(String cpf, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: cpf, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
        throw AuthException('Cpf não encontrado!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta!');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}