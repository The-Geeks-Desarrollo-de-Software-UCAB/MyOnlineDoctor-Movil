import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';
import '../dominio/paciente.dart';
import '../dominio/paciente.dart';
import '../presentacion/pages/detallecita.dart';
import '../presentacion/pages/detalles_doctor.dart';


class ListaDoctores extends StatelessWidget {
  final List<Doctor> doctores;

  ListaDoctores(this.doctores);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: doctores.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = doctores[index];
          String generoDr;
          if (doctor.genero == 'M') {
            generoDr = 'Dr. ';
          } else {
            generoDr = 'Dra. ';
          }
          return ListTile(
            leading: Container(
                child: CircleAvatar(
              backgroundImage: NetworkImage(doctor.imagen),
              maxRadius: 30,
            )),
            title: Text(generoDr + '${doctor.nombre}' + ' ' + '${doctor.apellido}'),
            subtitle:Text(doctor.getEspecialidadesToString()) ,
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap:(){
               
              //  Cita cita = Cita(Paciente(id_paciente: 5 , 
              //                       usuario: 'Vicente', 
              //                       contrasena: '1234', 
              //                       primerNomre: 'Vicente', 
              //                       segundoNombre: 'Rafael', 
              //                       primerApellido: 'Mirabal', 
              //                       segundoApellido: 'Bucci', 
              //                       genero: 'M', 
              //                       longitud: '10 11 12', 
              //                       latitud: '10 11 12', 
              //                       promedioCalificacion: 10, 
              //                       imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg'), 
              //                       'Lesion muscular',
              //                       'prueba 1',
              //                        AppoimentState.SOLICITADA, Doctor(
              //                                 id: 1,
              //                                 nombre: 'David',
              //                                 apellido: 'Rey',
              //                                 genero: 'M',
              //                                 imagen: 'https://i.ibb.co/KbQL38r/hombre5.jpg',
              //                                 especialidades: [
              //                                   Especialidades(id: 1, nombre: 'Cardiologia'),
              //                                   Especialidades(id: 2, nombre: 'Traumatologia')
              //                                 ],
              //                                 calificaciones: [
              //                                   4.0
              //                                 ]),
                                              
              //                   );
              //    cita.date = DateTime(2022, 7, 20, 17, 30);               
              
             
              //  final route= MaterialPageRoute(builder: (context)=>  DetalleCita(cita: cita 
              //             )
              //       );

                final route= MaterialPageRoute(builder: (context)=>  DetallesDoctor(doctor: doctor,) );
                Navigator.push(context, route);


            } ,
          );
        });
  }
}
