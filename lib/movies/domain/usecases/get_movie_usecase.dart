import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import '../repository/baseMovieRepo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, int>{
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(int parameters) async{
  return await baseMovieRepository.getMovieDetails(parameters);
  }

}

// class MovieDetailsParameters extends Equatable{
//   final int movieId;
//   const MovieDetailsParameters({required this.movieId});
//
//   @override
//   List<Object?> get props => [movieId];
//
// }