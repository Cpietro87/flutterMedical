import 'package:doctor/pages/login_page.dart';
import 'package:doctor/pages/paciente_page..dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Medical',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
       initialRoute: 
      "paciente",
      routes: {
        "paciente": (context) => const Paciente(),
        "login": (context) => const LoginPage(),
      },
    );
  }
}

