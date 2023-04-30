import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/baseMovieRepo.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute()async{
    return await baseMovieRepository.getNowPlayingMovies();
  }
}