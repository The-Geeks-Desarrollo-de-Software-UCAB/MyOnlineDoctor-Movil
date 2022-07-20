import 'package:flutter/material.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/AnalyticsService.dart';
import 'package:myonlinedoctor_movil/aplicacion/trazabilidad/ITrazabilidadService.dart';
import 'package:myonlinedoctor_movil/locator.dart';

import '../dominio/doctor.dart';
import '../dominio/especialidades.dart';
import 'listadoctores.dart';

class DoctorSearchDelegate extends SearchDelegate {
  AnalyticsService analyticsService = locator.get<AnalyticsService>();
  @override
  String? get searchFieldLabel => 'Buscar Doctor';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            analyticsService.logBusqueda(query);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final DoctoresListExample = [
      Doctor(
          id: '3',
          nombre: 'Vicente',
          apellido: 'Mirabal',
          genero: 'M',
          imagen:
              'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')],
          calificaciones: null)
    ];

    //GetLista de Doctores Basado en el Query

    return ListaDoctores(DoctoresListExample);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //GetLista de Doctores Basado en el Query
    if (query.isEmpty) {
      return Container(
        child: Center(
            child: Icon(
          Icons.medication,
          color: Colors.black38,
          size: 100,
        )),
      );
    }

    final DoctoresListExample = [
      Doctor(
          id: '3',
          nombre: 'Vicente',
          apellido: 'Mirabal',
          genero: 'M',
          imagen:
              'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
          especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')],
          calificaciones: 2.0)
    ];
    return ListaDoctores(DoctoresListExample);
  }
}
