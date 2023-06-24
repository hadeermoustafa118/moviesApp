part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = '',
      this.movieRecommendationDetails = const [],
      this.movieRecommendationState = RequestState.loading,
      this.recommendationMessage = ''});

  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommendation> movieRecommendationDetails;
  final RequestState movieRecommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? message,
    String? recommendationMessage,
    RequestState? movieRecommendationState,
    List<Recommendation>? movieRecommendationDetails,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      message: message ?? this.message,
      movieRecommendationDetails:
          movieRecommendationDetails ?? this.movieRecommendationDetails,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        message,
        recommendationMessage,
        movieRecommendationState,
        movieRecommendationDetails
      ];
}
