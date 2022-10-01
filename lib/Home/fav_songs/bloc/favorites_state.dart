part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class AddToFavorite extends FavoritesState {}

class DeleteFromFavorite extends FavoritesState {}

class FavoritesInitial extends FavoritesState {}
