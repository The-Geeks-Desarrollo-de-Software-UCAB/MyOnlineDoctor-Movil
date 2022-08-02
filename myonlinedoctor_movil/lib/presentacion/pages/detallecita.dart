import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../aplicacion/videollamada/call.dart';
import '../../dominio/cita.dart';
import 'detalles_doctor.dart';

class DetalleCita extends StatefulWidget {
  Cita cita;
  DetalleCita({Key? key, required this.cita}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetalleCita();
}

class _DetalleCita extends State<DetalleCita> {
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;

  @override
  Widget build(BuildContext context) {
    //DateTime? fecha = widget.cita.date;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cita - My Online Doctor'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //FotoNombre(doctor: widget.cita.doctor),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Fecha: ' +
                        widget.cita.fecha.toString().substring(8, 11) +
                        '-' +
                        widget.cita.fecha.toString().substring(5, 8) +
                        widget.cita.fecha.toString().substring(0, 4)),
                    //Text('Fecha: '+widget.cita.fecha.day.toString()+ '-'+widget.cita.fecha.month.toString()+'-'+widget.cita.fecha.year.toString()),
                    const SizedBox(width: 30),
                    Text('Hora: ' +
                        widget.cita.fecha.toString().substring(11, 16)),
                    //Text('Hora: '+widget.cita.fecha.hour.toString()+ ':'+widget.cita.fecha.minute.toString()+''+widget.cita.fecha.second.toString()),
                  ],
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    onJoin();
                  },
                  child: const Text('Unirse a la llamada'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CallPage(
          channelName: 'testvicente',
          role: _role,
        ),
      ),
    );
  }
}

Future<void> _handleCameraAndMic(Permission permission) async {
  final status = await permission.request();
  log(status.toString());
}
