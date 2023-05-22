import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final storage = const FlutterSecureStorage();
  final nombre = TextEditingController();
  final email = TextEditingController();
  final telefono = TextEditingController();
  final doctorId = TextEditingController();
  final obrasocial = TextEditingController();

  final url = Uri.parse("http://localhost:3000/paciente/create");

  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  String? claveError;
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
          children: [
            Image.asset(
              'images/iconoHistomed.png',
              width: 600.0,
              height: 250.0,
            ),
            const Text(
              "Registrarse",
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
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                    hintText: "Email", border: InputBorder.none),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: telefono,
                decoration: const InputDecoration(
                    hintText: "password", border: InputBorder.none),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: doctorId,
                decoration: const InputDecoration(
                    hintText: "doctorid", border: InputBorder.none),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: obrasocial,
                decoration: const InputDecoration(
                    hintText: "obrasocial", border: InputBorder.none),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    register();
                    Navigator.pushNamed(context, '/');
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: const Size(250, 50),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.50, 50),
                  ),
                  child: const Text("Enviar")),
            )
          ],
        ),
      ),
    );
  }

  Future<void> register() async {
    final usuarios = {
      "nombre": nombre.text,
      "email": email.text,
      "telefono": telefono.text,
      "doctorId": doctorId.text,
      "obrasocial": obrasocial.text
    };
    final res =
        await http.post(url, headers: headers, body: jsonEncode(usuarios));

    if (res.statusCode == 401) {
      final data = Map.from((jsonDecode(res.body)));
      showSnackBar(data["error"]);
      return;
    }

    if (res.statusCode != 200) {
      showSnackBar("Ups hubo un error, intente de nuevo");
      return;
    }
  }

  void showSnackBar(String msg) {
    final snack = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
