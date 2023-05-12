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
  final email = TextEditingController();
  final password = TextEditingController();
  //texfields

  //http
  final url = Uri.parse("http://localhost:3000/paciente/index");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  //http
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fondobg.jpg"),
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.lighten),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/iconoHistomed.png',
              width: 700.0,
              height: 350.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  
                borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'password',
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                minimumSize: const Size(250, 50),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.50, 50),
              ),
              child: const Text("Entrar"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text(
                  "Crear cuenta",
                  style: TextStyle(
                    color: Color.fromARGB(255, 41, 41, 41),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void showSnackbar(String msg) {
    final snack = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  Future<void> login() async {
    if (email.text.isEmpty || email.text.isEmpty) {
      showSnackbar(
          "${email.text.isEmpty ? "-Email " : ""} ${email.text.isEmpty ? "-Email" : ""} requerido");
      return;
    }
    final user = {"email": email.text, "Password": password.text};
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
