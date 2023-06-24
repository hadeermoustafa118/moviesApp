import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/core/usecase/base_use_case.dart';
import 'package:movies/movies/domain/entities/recommandation.dart';
import 'package:movies/movies/domain/repository/baseMovieRepo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendations(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters( this.id);

  @override
  List<Object?> get props => [id];
}
