import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String backDropPic;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String publishDate;

 const Movie({required this.id, required this.title,required this.backDropPic,required this.genreIds,required this.overview,
     required this.voteAverage, required this.publishDate});

  @override
  List<Object> get props =>[
    id,
    title,
    backDropPic,
    genreIds,
    overview,
    voteAverage,
    publishDate,
  ];
}