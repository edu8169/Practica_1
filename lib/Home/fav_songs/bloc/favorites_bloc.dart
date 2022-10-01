import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<OnAddFavorite>(add_favorite);
    on<OnDeleteFavorite>(delete_favorite);
  }

  FutureOr<void> add_favorite(event, emit) async {}

  FutureOr<void> delete_favorite(event, emit) async {}
}
