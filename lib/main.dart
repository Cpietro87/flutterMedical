import 'package:doctor/pages/Consultas/consulta_page.dart';
import 'package:doctor/pages/Doctor/doctor_page.dart';
import 'package:doctor/pages/Home/home_page.dart';
import 'package:doctor/pages/Login/login_page.dart';
import 'package:doctor/pages/Login/register_page.dart';
import 'package:doctor/pages/Paciente/paciente_list.dart';
import 'package:doctor/pages/Paciente/paciente_page.dart';
import 'package:doctor/pages/Paciente/prescripcion.dart';
// import 'package:doctor/pages/product.dart';
import 'package:doctor/pages/client/my_home_page.dart';
import 'package:doctor/pages/searchBar.dart';
import 'package:doctor/pages/pdf.dart';
import 'package:doctor/pages/usuarios_page.dart';
import 'package:doctor/vista.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'HistoMed',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
       initialRoute: '/',
       routes: routes,
    );
  }
}

Map<String, WidgetBuilder> routes = {
  '/': (context) => const LoginPage(),
  '/home':(context) => const MyHomePage(),
  '/register': ((context) => const Register()),
  '/doctor': ((context) => const ProfileDoctor(name: 'Pepe', patients: ['Argento', 'Pietro'], profession: 'Dentista', email: 'pepe@yahoo.com', phone: '1234', photoUrl: 'assets/images/medico.jpg',)),
  '/pacientes/list': ((context) => const UserList()),
  '/hclinica': ((context) => const StepsFormHM()),
  // '/usuario': (context) => const Usuarios(),
  '/prescripcion':(context) => Prescription(),
  '/consulta': (context) => const Vista(),
  '/pdf': (context) => const Pdf(),
  '/search': (context) => const SearchBar(),
  '/client': (context) => const MyHome("Pacientes"),
  '/vista': (context) => const Vista2(),
  '/back': (context) =>  RegisterPage(),
  
};
