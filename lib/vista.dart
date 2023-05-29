import 'package:doctor/pages/Hclinica/hclinica_page.dart';
import 'package:doctor/pages/Pacientes/my_home_page.dart';
import 'package:flutter/material.dart';

class Vista2 extends StatelessWidget {
  const Vista2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paciente'),
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('Images/profile.jpg'),
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Lucas Montiel',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Datos del paciente:',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nombre: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          'Lucas',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Apellido: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          'Montiel',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DNI: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          '12345678',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email: ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          'lucassaasd@example.com',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Aquí puedes agregar la lógica para modificar los datos del paciente
                                    },
                                    child: Text('Modificar'),
                                  ),
                                ],
                              ),
                              // Limitar el ancho máximo del Container
                              width: 500,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // lógica para enviar el texto del cuadro de texto
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 32),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Subir',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowChip(BuildContext context) {
  return Row(children: <Widget>[
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepsFormHM()),
        );
      },
      child: ChipForRow('Healt', Color(0xFFff8a65)),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepsFormHM()),
        );
      },
      child: ChipForRow('Food', Color(0xFF4fc3f7)),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepsFormHM()),
        );
      },
      child: ChipForRow('LifeStyle', Color(0xFF9575cd)),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepsFormHM()),
        );
      },
      child: ChipForRow('Sport', Color(0xFF4db6ac)),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepsFormHM()),
        );
      },
      child: ChipForRow('Nature', Color(0xFF5cda65)),
    ),
  ]);
}

Widget ChipForRow(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(0.5),
    avatar: CircleAvatar(
      backgroundColor: Colors.grey.shade600,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(5.0),
  );
}
