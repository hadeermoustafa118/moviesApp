import 'package:movies/movies/domain/entities/recommandation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backDropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        backDropPath:
            json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}
