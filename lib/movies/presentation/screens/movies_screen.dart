import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_events.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(create: (BuildContext context) => MoviesBloc()..add(GetNowPlayingMoviesEvent())
      ,
    child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state){
      return Scaffold();
    },),);
  }
}
