import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommandation.dart';
import 'package:movies/movies/domain/usecases/get_movie_usecase.dart';
import 'package:movies/movies/domain/usecases/get_reccomendations_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getRecommendations);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    log('id : ${event.id}');
    final result =
        await getMovieDetailsUseCase( event.id);
    log('id : ${event.id}');
    log(result.toString());
    result.fold(
        (l) {
          debugPrint('failed');

          emit(state.copyWith(
            movieDetailsState: RequestState.error, message: l.message));},
        (r) {
          debugPrint('success');
          emit(state.copyWith(
            movieDetails: r, movieDetailsState: RequestState.loaded));});
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationsEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParameters( event.id, ));
    result.fold(
            (l) => emit(state.copyWith(
            movieRecommendationState: RequestState.error, recommendationMessage: l.message)),
            (r) => emit(state.copyWith(
            movieRecommendationDetails: r, movieRecommendationState: RequestState.loaded)));
}}
