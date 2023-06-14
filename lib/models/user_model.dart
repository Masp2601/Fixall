class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? telefono;
  String? pais;
  String? saldo;
  String? tipo;
  String? documento;
  String? ocupaciones;
  String? ciudad;
  String? fecha;
  String? sexo;
  String? password;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.telefono,
    this.saldo,
    this.pais,
    this.documento,
    this.ocupaciones,
    this.ciudad,
    this.fecha,
    this.sexo,
    this.password,
  });

  //collecting data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      telefono: map['telefono'],
      saldo: map['saldo'],
      pais: map['pais'],
      documento: map['documento'],
      ocupaciones: map['ocupaciones'],
      ciudad: map['ciudad'],
      fecha: map['fecha'],
      sexo: map['sexo'],
      password: map['password'],
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'telefono': telefono,
      'saldo': saldo,
      'pais': pais,
      'documento': documento,
      'ocupaciones': ocupaciones,
      'ciudad': ciudad,
      'fecha': fecha,
      'sexo': sexo,
      'password': password,
    };
  }
}
