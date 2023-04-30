import 'package:movies/movies/domain/usecases/getNowPlayingMoviesUseCase.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dataSource/base_remote_data_source.dart';
import '../../data/dataSource/moviesRemoteDataSource.dart';
import '../../data/repository/movie_repo.dart';
import '../../domain/repository/baseMovieRepo.dart';
class MoviesBloc extends Bloc <MoviesEvents,MoviesState>{
  MoviesBloc() : super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit)async {
      BaseRemoteDataSource baseRemoteDataSource = MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository = MovieRepository(baseRemoteDataSource);
     final result = await  GetNowPlayingMoviesUseCase(baseMovieRepository).execute();
    });
  }

}