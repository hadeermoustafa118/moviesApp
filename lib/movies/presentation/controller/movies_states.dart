import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable{
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  const MoviesState({
    this.nowPlayingMovies =const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = ''
});
  List<Object> get props => [nowPlayingState, nowPlayingMovies , nowPlayingMessage];
}