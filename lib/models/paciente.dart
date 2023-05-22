class Paciente {
  String nombre;
  String email;
  String telefono;
  String doctorId;
  String obrasocial;
  Paciente(
      {
      required this.nombre,
      required this.email,
      required this.telefono,
      required this.doctorId,
      required this.obrasocial,
      });

  factory Paciente.fromJson(Map json) {
    return Paciente(
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
        doctorId: json["doctorId"],
        obrasocial: json["obrasocial"],
    );
  }
}