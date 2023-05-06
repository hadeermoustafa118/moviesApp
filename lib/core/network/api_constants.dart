///https://api.themoviedb.org/3/now_playing?api_key=6bd2c2026151841e471315c0acfeb751
class ApiConstants{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String apiKey = '6bd2c2026151841e471315c0acfeb751';
  static const String nowPlayingMovies = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500/';
  static String imageUrl (String path)=> '$baseImageUrl$path';
}