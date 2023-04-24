import 'package:flutter/material.dart';

class Vista extends StatelessWidget {
  const Vista({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> listName = ['opcion 1', 'opcion 2', 'opcion 3', 'opcion 4'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.blue,
                
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Center(
                child: Text(
                  'Consulta médica',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpg'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Alfredo Cortez',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Especialidad',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 50), // Agregar un espacio vertical de 20s
                      const Text(
                        'Motivo de la consulta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonFormField(
                          hint: const Text('Selecciona el motivo: '),
                          dropdownColor: Colors.white,
                          items: listName.map((name) {
                            return DropdownMenuItem(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Diagnóstico',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Escriba el diagnóstico aquí',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'Tratamiento',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  hintText: 'Escriba el tratamiento aquí',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(12, 12, 0, 30),
                                ),
                                maxLines: null,
                                textInputAction: TextInputAction.newline,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: ElevatedButton(
                                      onPressed: () {
                                         Navigator.pushNamed(context, '/home');
                                        // lógica para enviar el texto del cuadro de texto
                                      },
                                      child: const Text('Enviar'),
                                    ),
                                  ))
                            ]),
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