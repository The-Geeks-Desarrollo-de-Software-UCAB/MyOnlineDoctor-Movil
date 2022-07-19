import 'package:flutter/material.dart';

import '../../aplicacion/listadoctores.dart';
import '../../aplicacion/search_delegate.dart';
import '../../dominio/doctor.dart';
import '../../dominio/especialidades.dart';


class DoctoresPage extends StatefulWidget {
  const DoctoresPage({Key? key}) : super(key: key);

  @override
  State<DoctoresPage> createState() => _DoctoresPage();
}

class _DoctoresPage extends State<DoctoresPage> {
  String opcionPorDefecto = 'Especialidad';
  String? especialidad = '';
  String? e = '';
  @override
  Widget build(BuildContext context) {
    //final especialidadesProvider = Provider.of<EspecialidadesProvider>(context);
    //final items = especialidadesProvider.especialidadesDisponibles;
    final items = [Especialidades(id: 1, nombre: 'Cardiologia'), Especialidades(id: 2, nombre: 'Traumatologia'),Especialidades(id: 3, nombre: 'Geriatria'),Especialidades(id: 4, nombre: 'Reumatologia')];

    return Scaffold(
        appBar: AppBar(
          title: Text('Doctores'),
          actions: [
            
            DropdownButton<Especialidades>(
                items: items
                    .map<DropdownMenuItem<Especialidades>>((Especialidades a) {
                  return DropdownMenuItem<Especialidades>(
                    value: a,
                    child: Text(a.nombre),
                  );
                }).toList(),
                onChanged: (Especialidades? a) => setState(() {
                      if (a?.nombre == '...') {
                        especialidad = '';
                        e = '';
                        opcionPorDefecto = 'Especialidad';
                      } else {
                        e = 'e/';
                        especialidad = a?.nombre;
                        opcionPorDefecto = especialidad!;
                      }
                    }),
                hint: Text(opcionPorDefecto)
                ),
             IconButton(
              onPressed: ()=> showSearch(context: context, delegate: DoctorSearchDelegate()), 
              icon: Icon(Icons.search_outlined)
              ),

          ],
        ),
        body: FutureBuilder(
            future: Doctor.fetchDoctores(
                'http://10.0.2.2:3000/doctor/get/' + e! + especialidad!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ListaDoctores([Doctor(id: 1, nombre: 'David', apellido: 'Rey', genero: 'M', imagen:'https://images.unsplash.com/photo-1658140917228-129162d2a5b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80' , especialidades: [Especialidades(id: 1, nombre: 'Cardiologia'), Especialidades(id: 2, nombre: 'Traumatologia')])]);
                //return Center(child: CircularProgressIndicator());
              } else {
                return ListaDoctores(snapshot.data);
              }

              
            }));
  }
}