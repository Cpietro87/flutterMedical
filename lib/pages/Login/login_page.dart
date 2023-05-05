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
  final url = Uri.parse("http://localhost:3000/paciente/index");
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  //http
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
            Image.asset('images/iconoHistomed.png',
              width: 700.0,
              height: 350.0,),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: nombre,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Nombre',
                    prefixIcon: const Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                        
              ),
          ),
           Container(
            decoration: BoxDecoration(
                color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: email,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.supervised_user_circle),
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
                          borderRadius: BorderRadius.circular(10.0)
                          ),
                          minimumSize: const Size(250, 50),
                          fixedSize: Size(MediaQuery.of(context).size.width * 0.50, 50), 
                          ),
            child: const Text("Entrar"),
                ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Crear cuenta",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          )  
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
    final user = {"email": email.text, "Nombre": nombre.text};
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