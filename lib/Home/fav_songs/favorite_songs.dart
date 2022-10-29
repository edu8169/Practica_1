import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_1/Home/fav_songs/song_element.dart';

import 'bloc/favorites_bloc.dart';

class FavoriteSongs extends StatefulWidget {
  FavoriteSongs({Key? key}) : super(key: key);

  @override
  State<FavoriteSongs> createState() => _FavoriteSongsState();
}

class _FavoriteSongsState extends State<FavoriteSongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<FavoritesBloc, FavoritesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ReadFileSuccessState) {
                return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return SongElement(data: state.fileContent, id: index);
                });
              } else {
                return _loadingView();
              }
            }));
  }
}

Widget _loadingView() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
