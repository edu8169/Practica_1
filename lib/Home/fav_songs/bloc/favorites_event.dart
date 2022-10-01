part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

class OnAddFavorite extends FavoritesEvent {
  final song;

  OnAddFavorite({
    required this.song,
  });

  @override
  List<Object> get props => [];
}

class OnDeleteFavorite extends FavoritesEvent {
  final song;

  OnDeleteFavorite({
    required this.song,
  });

  @override
  List<Object> get props => [];
}
