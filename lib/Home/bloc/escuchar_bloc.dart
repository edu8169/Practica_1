import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:record/record.dart';
part 'escuchar_event.dart';
part 'escuchar_state.dart';

class EscucharBloc extends Bloc<EscucharEvent, EscucharState> {
  final record = Record();
  EscucharBloc() : super(EscucharInitial()) {
    on<OnEscucharEvent>(escuchando);
    on<EscucharEvent>(end);
    on<OnTerminarAntesEvent>(end_sooner);
  }

  Future<FutureOr<void>> escuchando(event, emit) async {
    await record.hasPermission();
    await record.start();
    emit(EscucharLoading());
  }

  Future<FutureOr<void>> end(event, emit) async {
    String? pathToAudio = await record.stop();
    var bytes = File(pathToAudio!).readAsBytesSync();
    String base64Audio = base64Encode(bytes);
    var url = Uri.parse('https://api.audd.io/');
    var response = await http.post(url, body: {
      'api_token': dotenv.env['api_token'],
      'audio': base64Audio,
      'return': 'apple_music,spotify'
    });
    Map<String, dynamic> jsonData =
        new Map<String, dynamic>.from(json.decode(response.body));
    //Aqui se guarda la cancion, solo no se regresa

    print(bytes);
  }

  Future<FutureOr<void>> end_sooner(event, emit) async {
    await record.stop();
    record.dispose();
    emit(EscucharInitial());
  }
}
