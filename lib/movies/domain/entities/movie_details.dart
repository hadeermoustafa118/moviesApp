
import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable{
  final int id;
  final String? backDropPath;
  final String releaseDate;
  final double voteAverage;
  final String overView;
  final int runTime;
  final String title;
  final List<Genres> genres;

  const MovieDetails({required this.id,  this.backDropPath, required this.releaseDate, required this.voteAverage,
    required this.overView,required  this.runTime, required this.title, required this.genres,});

  @override
  List<Object?> get props => [id, backDropPath, releaseDate , voteAverage, overView, runTime, title, genres];

}