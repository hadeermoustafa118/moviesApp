import '../models/movieModel.dart';

abstract class BaseRemoteDataSource{
  Future <List<MovieModel>> getNowPlayingMovies();
  Future <List<MovieModel>> getPopularMovies();
  Future <List<MovieModel>> getTopRatedMovies();

}