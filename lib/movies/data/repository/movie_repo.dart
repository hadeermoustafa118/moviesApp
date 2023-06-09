import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/data/dataSource/base_remote_data_source.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommandation.dart';
import 'package:movies/movies/domain/repository/baseMovieRepo.dart';
import 'package:movies/movies/domain/usecases/get_reccomendations_usecase.dart';

class MovieRepository extends BaseMovieRepository{
  final BaseRemoteDataSource baseRemoteDataSource;
  MovieRepository( this.baseRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async{
    final result = await baseRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies()async {
    final result = await baseRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies()async {
    final result = await baseRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int parameters) async{
    final result = await baseRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationParameters parameters) async{
    final result = await baseRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }




}