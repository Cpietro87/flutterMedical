import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:doctor/models/usuarios.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
final storage = const FlutterSecureStorage();
final nombre = TextEditingController();
final email = TextEditingController();
final telefono = TextEditingController();
final doctorId = TextEditingController();
final obrasocial = TextEditingController();

final url = Uri.parse("http://localhost:3000/api/posts");

final headers = {"Content-Type": "application/json;charset=UTF-8"};

String? claveError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Social",
                style: TextStyle(
                    fontSize: 50, color: Theme.of(context).primaryColor),
              ),
              const Text(
                "Registro",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                      hintText: "eamil", border: InputBorder.none),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: telefono,
                  decoration: InputDecoration(
                      errorText: claveError,
                      hintText: "telefono",
                      border: InputBorder.none),
                ),
              ),
               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: doctorId,
                  decoration: InputDecoration(
                      errorText: claveError,
                      hintText: "especialidad",
                      border: InputBorder.none),
                ),
              ),
               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: obrasocial,
                  decoration: InputDecoration(
                      errorText: claveError,
                      hintText: "obrasocial",
                      border: InputBorder.none),
                ),
              ),
             
              ElevatedButton(
                  onPressed: register, child: const Text("Crear cuenta")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: const Text("Ya tengo una cuenta"))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    // if (clave.text != clave2.text) {
    //   setState(() {
    //     claveError = "Contraseñas no coinciden";
    //   });
    //   return;
    // }
    // setState(() {
    //   claveError = null;
    // });

    final usuario = {
      "nombre": nombre.text,
      "email": email.text,
      "telefono": telefono.text,
      "doctorId": doctorId.text,
      "obrasocial": obrasocial.text
    };
    final res = await http.post(url,headers: headers, body: jsonEncode(usuario));

    if (res.statusCode == 401) {
      final data = Map.from((jsonDecode(res.body)));
      showSnackBar(data["error"]);
      return;
    }

    if (res.statusCode != 200) {
      showSnackBar("Ups hubo un error, intente de nuevo");
      return;
    }
    final data = Map.from(jsonDecode(res.body));
    final products = Usuario.fromJson(data);
    // await storage.write(key: 'refresh-token', value: products.refreshToken);
    // await storage.write(key: 'access-token', value: products.refreshToken);
    Navigator.of(context).pushNamed('home');
  }

  void showSnackBar(String msg) {
    final snack = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
