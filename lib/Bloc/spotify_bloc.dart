

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/api.dart';
import '../Repository/Modelclass/spotify.dart';

part 'spotify_event.dart';
part 'spotify_state.dart';

class SpotifyBloc extends Bloc<SpotifyEvent, SpotifyState> {
  late Spotify Spotify1;
  AnimeApi animeApi = AnimeApi();
  SpotifyBloc() : super(SpotifyInitial()) {
    on<SpotifyEvent>((event, emit) async {
      emit(SpotifyLoading());
      try {
        Spotify1 = await animeApi.getAnime(event.toString());
        emit(SpotifyLoaded());
      } catch (e) {
        print(e);
        emit(SpotifyError());
      }});
  }
}
