import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myonlinedoctor_movil/dominio/registro_medico.dart';
import 'package:myonlinedoctor_movil/presentacion/pages/historia_medica.dart';

import 'detalles_doctor.dart';

class DetalleRegistro extends StatelessWidget {
  RegistroMedico registro;

   DetalleRegistro({Key? key, required this.registro}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle estilo_titulo = TextStyle(color: Color.fromARGB(255, 35, 154, 201), fontSize: 20, fontWeight: FontWeight.bold);

   return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(  
        appBar: AppBar(
          title: Text('Registro Médico - My Online Doctor'),
          
          leading:IconButton(
              onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoriaMedica()));
              }, 
              icon:Icon(Icons.arrow_back)) ,
        ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ 
              FotoNombre(doctor: registro.doctor),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Fecha: '+ registro.fecha.toString().substring(8,11)+'-'+ registro.fecha.toString().substring(5,8)+registro.fecha.toString().substring(0,4)),
                 //Text('Fecha: '+widget.cita.fecha.day.toString()+ '-'+widget.cita.fecha.month.toString()+'-'+widget.cita.fecha.year.toString()),
                  const SizedBox(width:30),
                  Text('Hora: '+ registro.fecha.toString().substring(11,16)),
                  //Text('Hora: '+widget.cita.fecha.hour.toString()+ ':'+widget.cita.fecha.minute.toString()+''+widget.cita.fecha.second.toString()),
              ],),
              SizedBox(height:20),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text('Historia: ', style: estilo_titulo,),
                   ],
                   
                 ), 
                 SizedBox(height: 10),
                 Row( 
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text(registro.historia, overflow: TextOverflow.visible,),
                        ],
                      ),
                    ),            
                   ],
                 ), 
                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text('Diagnóstico: ', style: estilo_titulo,),
                    
                     
                   ],
                   
                 ),

                 SizedBox(height: 10),
                 Row( 
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   Text(registro.diagnostico)           
                   ],
                 ), 


                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text('Plan: ', style: estilo_titulo,),
                   
                   ],
                   
                 ),
                  SizedBox(height: 10),
                 Row( 
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   Flexible(
                     child: Column(
                       children: [
                         Text(registro.plan, overflow: TextOverflow.visible,),
                       ],
                     ),
                   )           
                   ],
                 ), 

                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text('Exámenes: ', style: estilo_titulo,),
                    
                   ],
                   
                 ),
                 SizedBox(height: 10),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    
                    Text(registro.examenes.toString(), overflow: TextOverflow.ellipsis,)
                   ],
                   
                 ),


                 SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    Text('Prescripción: ', style: estilo_titulo,),
                    
                   ],
                   
                 ),

                 SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   
                    Flexible(
                      child: Column(
                        children: [
                          Text(registro.prescripcion, overflow: TextOverflow.visible,),
                        ],
                      ),
                    )
                   ],
                   
                 ),
                
                 
            ],
            ),
          ),
      ),  
      ),
    );
    
  }
}


