import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Login/login_page.dart';

class ProfileDoctor extends StatelessWidget {
  final String name;
  final String profession;
  final String email;
  final String phone;
  final String photoUrl;
  final List<String> patients;

  const ProfileDoctor(
      {super.key,
      required this.name,
      required this.profession,
      required this.patients,
      required this.email,
      required this.phone,
      required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
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
            },
          ),
          GButton(
            icon: Icons.search,
            text: 'search',
            onPressed: () {
              Navigator.pushNamed(context, '/pacientes/list');
            },
          ),
         
        ],
      ),
     
      appBar: AppBar(
        title: const Text('My Perfil'),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(photoUrl),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(profession),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/client');
                    },
                    child: const Text("Citas"),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Informacion Personal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 350,
              child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.email),
                      filled: true,
                      // fillColor: const Color(0xC52E9AFE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 5)),
                      hintText: email)),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            SizedBox(
              width: 350,
              child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                      icon: const Icon(Icons.phone),
                      filled: true,
                      // fillColor: const Color(0xC52E9AFE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 5)),
                      hintText: phone)),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              'Ultimos pacientes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: patients.length,
              itemBuilder: (context, index) {
                final patient = patients[index];
                return ListTile(
                  title: Text(patient),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
