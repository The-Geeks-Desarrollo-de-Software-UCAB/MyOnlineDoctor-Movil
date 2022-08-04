// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';
import 'package:myonlinedoctor_movil/dominio/cita.dart';
import 'package:myonlinedoctor_movil/locator.dart';

import '../../dominio/registro_medico.dart';
import 'detalles_registro.dart';



class ListaRegistros extends StatelessWidget {
  final List<RegistroMedico> registros;
  final AnalyticsService analyticsService = locator.get<AnalyticsService>();
  ListaRegistros(this.registros);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: registros.length,
        itemBuilder: (BuildContext context, int index) {
          final registro = registros[index];
          String generoDr;
          if (registro.doctor.genero == 'M') {
            generoDr = 'Dr. ';
          } else {
            generoDr = 'Dra. ';
          }
          return ListTile(
            leading: Container(
                child: CircleAvatar(
              backgroundImage: NetworkImage(registro.doctor.imagen),
              maxRadius: 30,
            )),
            title: Text(
                // ignore: prefer_interpolation_to_compose_strings
                generoDr + '${registro.doctor.nombre}' + ' ' + '${registro.doctor.apellido}'),
            subtitle: Text(registro.doctor.getEspecialidadesToString()),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {

              final route = MaterialPageRoute(
                  builder: (context) => DetalleRegistro(
                        registro: registro,
                      ));
              Navigator.push(context, route);
            },
          );
        });
  }
}

