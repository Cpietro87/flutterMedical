import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import '../Login/login_page.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class User {
  String userName, fullName, photoUrl;
  User(this.userName, this.fullName, this.photoUrl);
}

class _UserListState extends State<UserList> {
  TextEditingController textController = TextEditingController();
  late List<User> users;
  @override
  void initState() {
    users = [
      User('Pepe', 'Jose', ''),
      User('Walo', 'Walter', ''),
      User('Pietro', 'Cristian', ''),
      User('Btx', 'Beto', ''),
      User('Pancho', 'Francisco', '')

    ];
    super.initState();
  }

  _borrarUsuario(context, users) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Usuario'),
              content: Text('Estas seguro de eliminar' + users.userName),
              actions: [
                FloatingActionButton(
                  backgroundColor: Colors.white,

                  onPressed: () {
                    print(users.userName);
                    Navigator.pushNamed(context, '/consulta');
                  },
                  child: const Text(
                    'Visualizar',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    print(users.userName);
                    users.remove(users);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Borrar',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Pacientes'),
        actions: <Widget>[
            IconButton(
          icon: const Icon(Icons.auto_delete),
          onPressed: () {
      },)]
        
      ),
        body: Container(
        // color: Colors.yellowAccent[100],
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              color: Colors.blue,
              helpText: "Buscar",
              autoFocus: true,
              closeSearchOnSuffixTap: true,
              animationDurationInMilli: 500,
              rtl: true, onSubmitted: (String ) {  },
            ),
           Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
              return ListTile(
            onTap: () {
              _borrarUsuario(context, users[index]);
            },
            title: Text(users[index].fullName),
            subtitle: Text(users[index].userName),
            leading: CircleAvatar(
              child: Text(users[index].fullName.substring(0, 1)),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        itemCount: users.length,
      ),
            ),
            
          ],
        ),
        
      ),
    );
  }
}
