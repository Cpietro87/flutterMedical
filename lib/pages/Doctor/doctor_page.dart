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

  const ProfileDoctor({super.key, required this.name, required this.profession, required this.patients, required this.email, required this.phone, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
        backgroundColor: Colors.black,
        haptic: true, // haptic feedback
        tabBorderRadius: 15, 
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text 
        color: Colors.white, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.blue, // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.supervised_user_circle,
            text: 'favorite',),
          GButton(
            icon: Icons.search,
            text: 'search',
            ),
          GButton(
            icon: Icons.settings,
            text: 'settings',),
        ],
      ),
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Hola Doctor',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                print('Home');
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                print('My Profile');
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
            ),
            ListTile(
              title: const Text('My Appointments'),
              onTap: () {
                print('My Appointments');
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
            ),
            ListTile(
              title: const Text('New Prescription'),
              onTap: () {
                print('New Prescription');
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
            ),
            ListTile(
              title: const Text('Available Times'),
              onTap: () {
                print('Available Times');
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Perfil'),
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
                    print("Back Button Clicked");
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
                Navigator.pushNamed(context, '/pacientes/list');
              },
              child: const Text("Citas"),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))
                ),
              
              ),
                        
                ],
              ),
            ),
            const SizedBox(height: 16,),
            const Text('Informacion Personal',
             style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16,),
            Text(email),
            const SizedBox(height: 16,),
            Text(phone),
            const SizedBox(height: 16),
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