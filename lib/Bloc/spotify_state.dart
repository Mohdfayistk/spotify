part of 'spotify_bloc.dart';

@immutable
abstract class SpotifyState {}

class SpotifyInitial extends SpotifyState {}
class SpotifyLoading extends  SpotifyState {}
class SpotifyLoaded extends  SpotifyState {}
class SpotifyError extends  SpotifyState{}