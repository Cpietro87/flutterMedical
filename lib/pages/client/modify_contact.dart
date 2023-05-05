import 'package:doctor/pages/client/my_home_page.dart';
import 'package:doctor/pages/client/text_box.dart';
import 'package:flutter/material.dart';

class ModifyContact extends StatefulWidget {
  final Client _client;
  ModifyContact(this._client);
  @override
  State<StatefulWidget> createState() => _ModifyContact();
}

class _ModifyContact extends State<ModifyContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;
  TextEditingController textController = TextEditingController();

  

  @override
  void initState() {
    Client c = widget._client;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modificar Paciente"),
        
      ),

      body: ListView(
        
        children: [

         
        
          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('images/profile.jpg'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget._client.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget._client.surname,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Telefono"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(context,
                      Client(name: name, surname: surname, phone: phone));
                }
              },
              child: const Text("Guardar Contacto")),
        ],
      ),
    );
  }
}
