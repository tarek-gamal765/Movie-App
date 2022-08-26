class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '?api_key=aa2cd5c1310491c1605d2152228a72da';
  static const String langUrl = '&language=en-US';

  // movies urls4

  static const String nowPlayingUrl =
      '$baseUrl/movie/now_playing$apiKey$langUrl';
  static const String popularMoviesUrl =
      '$baseUrl/movie/popular$apiKey$langUrl';
  static const String topRatedMoviesUrl =
      '$baseUrl/movie/top_rated$apiKey$langUrl';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String imagePath) => '$baseImageUrl$imagePath';

  static String movieDetailsUrl(int movieId) =>
      '$baseUrl/movie/$movieId$apiKey$langUrl';

  static String recommendationMoviesUrl(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations$apiKey$langUrl';
  static String movieSearch( String query) =>
      '$baseUrl/search/movie$apiKey&query=$query';

  // tvs urls
  static const String onTheAirTvsUrl = '$baseUrl/tv/on_the_air$apiKey$langUrl';
  static const String popularTvsUrl = '$baseUrl/tv/popular$apiKey$langUrl';
  static const String topRatedTvsUrl = '$baseUrl/tv/top_rated$apiKey$langUrl';
  static String tvDetailsUrl(int tvId) =>
      '$baseUrl/tv/$tvId$apiKey$langUrl';
  static String recommendationTvsUrl(int movieId) =>
      '$baseUrl/tv/$movieId/recommendations$apiKey$langUrl';
  static String tvSeasons(int id, int seasonNumber) =>
      '$baseUrl/tv/$id/season/$seasonNumber$apiKey';
  static String tvSearch( String query) =>
      '$baseUrl/search/tv$apiKey&query=$query';
}
