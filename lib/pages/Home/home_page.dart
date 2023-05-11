import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Login/login_page.dart';
// import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  GNav(
        backgroundColor: Colors.black,
        haptic: true, // haptic feedback
        tabBorderRadius: 15, 
        curve: Curves.easeOutExpo, // tab animation curves
        duration: const Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text 
        color: Colors.white, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.blue, // selected tab background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
        tabs: [
          
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
          ),
          GButton(
            icon: Icons.supervised_user_circle_outlined,
            text: 'favorite',
            onPressed: () {
                Navigator.pushNamed(context, '/doctor');
              },),
          GButton(
            icon: Icons.search,
            text: 'search',
            onPressed: () {
                Navigator.pushNamed(context, '/pacientes/list');
              },
            ),
          // GButton(
          //   icon: Icons.settings,
          //   text: 'settings',
          //   onPressed: () {
          //       Navigator.pushNamed(context, '/pacientes/list');
          //     },),
        ],
      ),
       
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('HistoMed', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontSize: 38,
                  )),
                  subtitle: Text('Bienvenido Usuario!!!', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/medico.jpg'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  itemDashboard('My Perfil', CupertinoIcons.person_circle, Colors.deepOrange,'/doctor'),
                  itemDashboard('Consulta', CupertinoIcons.graph_circle, Colors.green,'/consulta'),
                  itemDashboard('Pacientes', CupertinoIcons.person_2, Colors.purple,'/client'),
                  itemDashboard('Historia Clinica', CupertinoIcons.folder_open, Colors.brown,'/hclinica'),
                  // itemDashboard('Paciente Perfil', CupertinoIcons.doc, Colors.indigo,'/vista'),
                  // itemDashboard('Upload', CupertinoIcons.add_circled, Colors.teal,'/search'),
                  // itemDashboard('Pdf', CupertinoIcons.add_circled, Colors.teal,'/pdf'),
                  // itemDashboard('About', CupertinoIcons.question_circle, Colors.blue,'/'),
                  // itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent,'/'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
       
    );
  }

  itemDashboard(String title, IconData iconData, Color background, String routeName) => GestureDetector(
    onTap: () {
    Navigator.pushNamed(context, routeName);
  },
    child: Container(

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
      ]
    ), 
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: Colors.white)
        ),
        const SizedBox(height: 8),
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium)
      ],
    )
    ),
  );
}