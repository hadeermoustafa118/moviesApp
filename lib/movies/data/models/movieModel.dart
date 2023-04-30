import 'package:movies/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backDropPic,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.publishDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      backDropPic: json['backdrop_path'],
      genreIds: List.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      publishDate: json['release_date']);
}
