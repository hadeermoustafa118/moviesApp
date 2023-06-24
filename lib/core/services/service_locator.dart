import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/dataSource/base_remote_data_source.dart';
import 'package:movies/movies/data/dataSource/moviesRemoteDataSource.dart';
import 'package:movies/movies/data/repository/movie_repo.dart';
import 'package:movies/movies/domain/repository/baseMovieRepo.dart';
import 'package:movies/movies/domain/usecases/getNowPlayingMoviesUseCase.dart';
import 'package:movies/movies/domain/usecases/getPopularMoviesUseCase.dart';
import 'package:movies/movies/domain/usecases/getTopRatedMoviesUseCase.dart';
import 'package:movies/movies/domain/usecases/get_movie_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecases/get_reccomendations_usecase.dart';

final sl = GetIt.instance;
class ServiceLocator {
  void init(){
    ///MOVIE BLOC
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc( sl(), sl()));

    ///USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));


    ///REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    ///DATA SOURCE
    sl.registerLazySingleton<BaseRemoteDataSource>(() => MovieRemoteDataSource());
  }
}