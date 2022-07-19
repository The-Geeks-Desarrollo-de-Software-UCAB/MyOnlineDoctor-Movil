import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';
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
               
              final route= MaterialPageRoute(builder: (context)=>  DetallesDoctor(doctor: doctor,) );
             

                // final route= MaterialPageRoute(builder: (context)=>  DetalleCita(cita: Cita(doctor: doctor, 
                //                                                                   especialidad: Especialidades(id: 2, nombre: 'Traumatologia'), 
                //                                                                   fecha: DateTime(2022,7,20,20,0)),) );
                Navigator.push(context, route);


            } ,
          );
        });
  }
}
