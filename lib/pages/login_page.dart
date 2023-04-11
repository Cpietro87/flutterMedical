import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //texfields
  final nombre = TextEditingController();
  final email = TextEditingController();
  //texfields

  //http
  final url = Uri.parse("http://localhost:3000/paciente");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  //http
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Usuario",
            style:
                TextStyle(fontSize: 50, color: Theme.of(context).primaryColor),
          ),
          const Text(
            "Inicio de session",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nombre,
              decoration: const InputDecoration(
                  hintText: "Nombre", border: InputBorder.none),
            ),
          ),
           Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: "Email", border: InputBorder.none),
            ),
          ),
          ElevatedButton(
            onPressed: login,
            child: const Text("Entrar"),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("paciente");
              },
              child: const Text("Crear cuenta"))
        ],
      ),
    );
  }

  void showSnackbar(String msg) {
    final snack = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<void> login() async {
    if (email.text.isEmpty || nombre.text.isEmpty) {
      showSnackbar(
          "${email.text.isEmpty ? "-Email " : ""} ${nombre.text.isEmpty ? "-Nombre" : ""} requerido");
      return;
    }
    final user = {"email": email.text, "clave": nombre.text};
    final res = await http.post(url, headers: headers, body: jsonEncode(user));
    final data = Map.from(jsonDecode(res.body));
    if (res.statusCode == 400) {
      showSnackbar(data["error"]);
      return;
    }
    if (res.statusCode != 200) {
      showSnackbar("Ups ha habido un error");
    }
   
  }
}