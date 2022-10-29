part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

class OnAddFavorite extends FavoritesEvent {
  final song;
  final String fileTitle;
  final String storageName;

  OnAddFavorite({
    required this.song,
    required this.fileTitle,
    required this.storageName,
  });

  @override
  List<Object> get props => [song, fileTitle, storageName];
}

class ReadFileEvent extends FavoritesEvent {
  final String fileTitle;
  final String storageName;

  ReadFileEvent({
    required this.fileTitle,
    required this.storageName,
  });
  @override
  List<Object> get props => [fileTitle, storageName];
}

class OnDeleteFavorite extends FavoritesEvent {
  final song;

  OnDeleteFavorite({
    required this.song,
  });

  @override
  List<Object> get props => [];
}
