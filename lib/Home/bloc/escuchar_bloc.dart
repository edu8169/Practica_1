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
    //Aqui esta el proceso utilizando nuestra api para reconocer la cancion que se esta esucchando
  }

  Future<FutureOr<void>> end_sooner(event, emit) async {
    await record.stop();
    record.dispose();
    emit(EscucharInitial());
  }
}
