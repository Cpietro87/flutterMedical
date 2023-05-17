import 'package:doctor/pages/client/message_response.dart';
import 'package:doctor/pages/client/modify_contact.dart';
import 'package:doctor/pages/client/register_contact.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  final String _title;
  const MyHome(this._title, {super.key});

  @override
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  TextEditingController textController = TextEditingController();
  List<Client> clients = [
    Client(name: 'Will', surname: 'Mora', phone: '454 25 93'),
    Client(name: 'Sam', surname: 'Perez', phone: ' 412 34 68'),
    Client(name: 'Marlon', surname: 'Gutierrez', phone: ' 441 36 98'),
    Client(name: 'Jhon', surname: 'Segura', phone: '489 90 62')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        actions: [
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
            // ignore: avoid_types_as_parameter_names
            rtl: true, onSubmitted: (String) {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyContact(clients[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    clients.removeAt(index);

                    clients.insert(index, newContact);

                    messageResponse(
                        context, newContact.name + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, clients[index]);
            },
            title: Text(clients[index].name + " " + clients[index].surname),
            subtitle: Text(clients[index].phone),
            leading: CircleAvatar(
              child: Text(clients[index].name.substring(0, 1)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterContact()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                clients.add(newContact);
                messageResponse(
                    context, newContact.name + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar Paciente",
        child: const Icon(Icons.add),
      ),
    );
  }

  removeClient(BuildContext context, Client client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar Paciente"),
              // ignore: prefer_interpolation_to_compose_strings
              content: Text("${"Esta seguro de eliminar a " + client.name}?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      clients.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Client {
  var name;
  var surname;
  var phone;

  Client({this.name, this.surname, this.phone});
}
