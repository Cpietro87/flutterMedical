import 'package:doctor/pages/Login/login_page.dart';
import 'package:flutter/material.dart';



class Prescription extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Prescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                  return Prescription();
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
        title: const Text('Opcion menu'),
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
              color: Colors.grey.shade300,
              height: 60.0,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "No Prescription Uploaded",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Add Description",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const SizedBox(width: 12),
            //       Image.asset(
            //         'assets/images/edoc_prescription.png',
            //         height: 100,
            //         width: 100,
            //       ),
            //       const SizedBox(width: 15),
            //       FlatButton(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(18.0),
            //         ),
            //         color: Colors.blue,
            //         textColor: Colors.white,
            //         padding: EdgeInsets.all(10.0),
            //         onPressed: () {
            //           print("UPLOAD CLICKED");
            //         },
            //         child: Text(
            //           "Upload".toUpperCase(),
            //           style: TextStyle(
            //             fontSize: 14.0,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Add Description"),
                      keyboardType: TextInputType.text),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Title"),
                      keyboardType: TextInputType.text),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Name"),
                      keyboardType: TextInputType.text),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Contact Number"),
                      keyboardType: TextInputType.text),
                  SizedBox(height: 10),
                  TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: "Email"),
                      keyboardType: TextInputType.text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
