class Usuario {
  String nombre;
  String email;
  String telefono;
  String doctorId;
  String obrasocial;
  Usuario(
      {
      required this.nombre,
      required this.email,
      required this.telefono,
      required this.doctorId,
      required this.obrasocial,
      });

  factory Usuario.fromJson(Map json) {
    return Usuario(
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
        doctorId: json["doctorId"],
        obrasocial: json["obrasocial"],
    );
  }
}