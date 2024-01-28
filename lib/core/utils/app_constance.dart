class AppConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "9d542c20b83f5d3a476563de6215e146";

  ///Movie
  static const String nowPlayingMoviesUrl =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesUrl =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRateMoviesdUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String moviesDetailedPath (int movieId)=>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationsPath (int movieId)=>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) =>"$baseImageUrl$path";

  ///TV
  static const String onTheAirTvUrl =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String topRatedTvUrl =
      "$baseUrl//tv/top_rated?api_key=$apiKey";
  static const String popularTvUrl =
      "$baseUrl/tv/popular?api_key=$apiKey";

}
