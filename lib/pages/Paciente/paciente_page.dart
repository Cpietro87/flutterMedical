import 'package:flutter/material.dart';

class StepsFormHM extends StatefulWidget {
  const StepsFormHM({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StepsFormHMState createState() => _StepsFormHMState();
}

List<String> listGender = ["Masculino", "Femenino", "No binario", "Otros"];
List<String> listmaritalstatus = ["Casado", "Soltero", "Divorciado", "Viudo"];
List<String> listBloodTypes = [
  "0 Rh+",
  "0 Rh-",
  "A Rh+",
  "A Rh-",
  "B Rh+",
  "B Rh-",
  "AB Rh+",
  "AB Rh-"
];

var seen = Set<String>();
var seen2 = Set<String>();

bool? isChekedsons = false;

class _StepsFormHMState extends State<StepsFormHM> {
  int _activeIndexSteps = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nroDocumento = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController socialWelfare = TextEditingController();
  TextEditingController planSocialWelfare = TextEditingController();
  TextEditingController afiliateNumber = TextEditingController();

  final List<String> _listTypeDocument = ['Dni', "Pasaporte"];

  List<String> uniquelist =
      listGender.where((country) => seen.add(country)).toList();
  List<String> uniquelistmarital =
      listmaritalstatus.where((country) => seen.add(country)).toList();

  String _selectedOptionBloodType = " ";

  String _selectedOptionGender = "Genero";

  String _selectedOptionDocument = "Dni";
  String _selectedOptionmarital = "";

  List<Step> stepList() => [
        Step(
          state:
              _activeIndexSteps <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeIndexSteps >=
              0, //esto nos rellena de color si ya estamos en ese paso
          title: const Flexible(
            child: Text(
              "Contacto",
              style: TextStyle(fontSize: 12),
            ),
          ),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: ' Nombre completo',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Tipo de documento"),
                  value: _selectedOptionDocument.toString(),
                  items: _listTypeDocument.map((typePasaport) {
                    return DropdownMenuItem(
                      key: UniqueKey(),
                      child: Text(typePasaport),
                      value: typePasaport,
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      _selectedOptionDocument = newvalue.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nroDocumento,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nro de documento',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Genero"),
                  value: uniquelist[0],
                  items: uniquelist.map((gender) {
                    return DropdownMenuItem(
                      key: UniqueKey(),
                      child: Text(gender),
                      value: gender,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOptionGender = newValue.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Estado civil"),
                  value: uniquelistmarital[0],
                  items: uniquelistmarital.map((gender) {
                    return DropdownMenuItem(
                      key: UniqueKey(),
                      child: Text(gender),
                      value: gender,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      print(uniquelistmarital.isEmpty);
                      _selectedOptionmarital = newValue.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Grupo sanguineo"),
                  value: listBloodTypes[0],
                  items: listBloodTypes.map((blood) {
                    return DropdownMenuItem(
                      key: UniqueKey(),
                      child: Text(blood),
                      value: blood,
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedOptionBloodType = newValue.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Telefono',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Fecha de ingreso"),
                  controller: income,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        //ver si tambien hacerlo con hora
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      setState(() {
                        income.text = pickedDate
                            .toString()
                            .substring(0, 10)
                            .replaceAll("-", "/");
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: nationality,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nacionalidad',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: adress,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Domicilio',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Edad',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Fecha de Nacimiento"),
                  controller: birthdate,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        //ver si tambien hacerlo con hora
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      setState(() {
                        income.text = pickedDate
                            .toString()
                            .substring(0, 10)
                            .replaceAll("-", "/");
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        Step(
            state:
                _activeIndexSteps <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeIndexSteps >= 1,
            title: const Flexible(
              child: Text(
                "Historial",
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: socialWelfare,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Obra social',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: planSocialWelfare,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Plan de la obra social',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    controller: afiliateNumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numero de afiliado',
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )),
        Step(
            state:
                _activeIndexSteps <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeIndexSteps >= 2,
            title: const Flexible(
              child: Text(
                "Verificar",
                style: TextStyle(fontSize: 12),
              ),
            ),
            content: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                // Text("data");
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent),
                //     borderRadius: BorderRadius.circular(20),
                //   ), //BoxDecoration
                //   child: CheckboxListTile(
                //       title: const Text('Hijos'),
                //       activeColor: Colors.blueAccent,
                //       checkColor: Colors.white,
                //       selected: false,
                //       value: isChekedsons,
                //       onChanged: (bool? newValue) {
                //         setState(() {
                //           isChekedsons = newValue;
                //         });
                //       }), //CheckboxListTile
                // ), //Container
              ],
            ))),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Historia clinica'),
      ),
      body: SizedBox(
        width: 2000,
        // ajustar la altura según sea necesario
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: _activeIndexSteps,
          steps: stepList(),
          onStepContinue: () {
            if (_activeIndexSteps < (stepList().length - 1)) {
              _activeIndexSteps += 1;
            }
            setState(() {});
          },
          onStepCancel: () {
            if (_activeIndexSteps == 0) {
              return;
            }
            _activeIndexSteps -= 1;
            setState(() {});
          },
        ),
      ),
    );
  }
}