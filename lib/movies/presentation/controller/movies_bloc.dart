import 'dart:async';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecases/getNowPlayingMoviesUseCase.dart';
import 'package:movies/movies/domain/usecases/getTopRatedMoviesUseCase.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/getPopularMoviesUseCase.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase , this.getTopRatedMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);


  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters ());
    result.fold(
            (l) => emit(
          state.copyWith(topRatedState: RequestState.error,
              topRatedMessage: l.message),
        ),
            (r) => emit(
            state.copyWith(topRatedState: RequestState.loaded, topRatedMovies: r)
        ));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(
            state.copyWith(popularState: RequestState.error,
                popularMessage: l.message)),

            (r) => emit(
          state.copyWith( popularState: RequestState.loaded, popularMovies: r),
        ));
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith( nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message),
      ),
          (r) => emit( state.copyWith(nowPlayingState: RequestState.loaded, nowPlayingMovies: r)
      ),);
  }
}
