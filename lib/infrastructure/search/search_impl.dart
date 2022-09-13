import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/domain/core/api_end_points.dart';
import 'package:movie_club/domain/search/model/search_resp.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_club/domain/search/search_service.dart';
import 'package:tmdb_api/tmdb_api.dart';
@LazySingleton(as: SearchService)
class SearchImpl implements SearchService{
  @override
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery
    }) async{
       try{
    final Response response = await Dio(BaseOptions()).get(
      ApiEndPoints.search,
      queryParameters:{ 
    'query':movieQuery,
      }
    );
    if(response.statusCode == 200 || response.statusCode == 201){
      final result = SearchResp.fromJson(response.data);
     return  Right(result);
    }else{
      return const Left(MainFailure.serverFailure() );
    }

       }
       catch(e){
        log(e.toString());
        return const Left(MainFailure.clientFailure() );

       }
   
  }
  
}