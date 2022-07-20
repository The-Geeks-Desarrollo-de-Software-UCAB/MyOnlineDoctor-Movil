import 'dart:ffi';

class Paciente{

  Paciente({
  required this.id_paciente, 
  required this.usuario, 
  required this.contrasena, 
  required this.primerNomre, 
  required this.segundoNombre, 
  required this.primerApellido,
  required this.segundoApellido,
  required this.genero,
  required this.longitud,
  required this.latitud,
  required this.promedioCalificacion,
  required this.imagen
  
  });

  int id_paciente;
  String usuario;
  String contrasena;
  String primerNomre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String genero;
  String longitud;
  String latitud;
  double promedioCalificacion;
  String imagen;
}