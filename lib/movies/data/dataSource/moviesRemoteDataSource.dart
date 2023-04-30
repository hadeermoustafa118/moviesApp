import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/errorMessageModel.dart';
import 'package:movies/movies/data/dataSource/base_remote_data_source.dart';
import 'package:movies/movies/data/models/movieModel.dart';
import 'package:dio/dio.dart';

class MovieRemoteDataSource extends BaseRemoteDataSource{
  @override
  Future <List<MovieModel>> getNowPlayingMovies() async{
    final response = await Dio().get(ApiConstants.nowPlayingMovies);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));

    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future <List<MovieModel>> getPopularMovies()async {
    final response= await Dio().get(ApiConstants.popularMovies);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));

    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future <List<MovieModel>> getTopRatedMovies() async{
    final response= await Dio().get(ApiConstants.topRatedMovies);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));

    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}