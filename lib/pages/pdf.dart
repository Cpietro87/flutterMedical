import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


class Pdf extends StatelessWidget {
  const Pdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            );
            if (result != null) {
              // El usuario ha seleccionado un archivo
              // result.files.single.path es la ruta del archivo seleccionado
            }
          },
          child: const Text('Seleccionar archivo'),
        )

    );
  }
}
