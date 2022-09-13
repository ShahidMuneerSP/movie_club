import 'package:dartz/dartz.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/search/model/search_resp.dart';
import 'package:tmdb_api/tmdb_api.dart';

abstract class SearchService{
  Future<Either<MainFailure,SearchResp>> searchMovies({
    required String movieQuery,
  });
}