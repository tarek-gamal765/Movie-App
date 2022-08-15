class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '?api_key=aa2cd5c1310491c1605d2152228a72da';
  static const String langUrl = '&language=en-US';
  static const String nowPlayingUrl =
      '$baseUrl/movie/now_playing$apiKey$langUrl';
  static const String popularMoviesUrl =
      '$baseUrl/movie/popular$apiKey$langUrl';
  static const String topRatedMoviesUrl =
      '$baseUrl/movie/top_rated$apiKey$langUrl';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String imagePath) => '$baseImageUrl$imagePath';
  static String movieDetailsUrl(int movieId) => '$baseUrl/movie/$movieId$apiKey$langUrl';
  static String recommendationMoviesUrl(int movieId) => '$baseUrl/movie/$movieId/recommendations$apiKey$langUrl';

}
