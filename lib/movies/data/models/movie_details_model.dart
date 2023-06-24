import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
       super.backDropPath,
      required super.releaseDate,
      required super.voteAverage,
      required super.overView,
      required super.runTime,
      required super.title,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          backDropPath: json['backdrop_path']??  'assets/images/no_image.png',
          releaseDate: json['release_date'],
          voteAverage: json['vote_average'].toDouble(),
          overView: json['overview'],
          runTime: json['runtime'],
          title: json['title'],
          genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))));
}
