import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/domain/usecases/get_reccomendations_usecase.dart';
import '../models/movieModel.dart';
import '../models/recommendation_model.dart';

abstract class BaseRemoteDataSource{
  Future <List<MovieModel>> getNowPlayingMovies();
  Future <List<MovieModel>> getPopularMovies();
  Future <List<MovieModel>> getTopRatedMovies();
  Future <List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
  Future <MovieDetailsModel> getMovieDetails(int parameters);

}