import 'package:movie_club/core/strings.dart';
import 'package:movie_club/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$KBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$KBaseUrl/search/movie?api_key=$apiKey&query=spiderman#";
  
}