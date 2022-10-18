import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_club/domain/core/api_end_points.dart';
import 'package:movie_club/domain/hot_and_new/hot_and_new_service.dart';
import 'package:movie_club/domain/hot_and_new/model/hot_and_new_resp.dart';
@LazySingleton(as: HotAndNewService)
class HotAndNewImpl implements HotAndNewService{
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async{
  try{
    final Response response = await Dio(BaseOptions()).get(
      ApiEndPoints.hotAndNewMovie,
    );
    // log(response.data.toString());
    if(response.statusCode == 200 || response.statusCode == 201){
      final result = HotAndNewResp.fromJson(response.data);
     return  Right(result);
    }else{
      return const Left(MainFailure.serverFailure() );
    }
       }
         on DioError catch(e){
         log(e.toString());
        return const Left(MainFailure.clientFailure() );
       }
       catch(e){
         log(e.toString());
        return const Left(MainFailure.clientFailure() );

       }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async{
   try{
    final Response response = await Dio(BaseOptions()).get(
      ApiEndPoints.hotAndNewTv,
    );
    // log(response.data.toString());
    if(response.statusCode == 200 || response.statusCode == 201){
      final result = HotAndNewResp.fromJson(response.data);
     return  Right(result);
    }else{
      return const Left(MainFailure.serverFailure() );
    }
       }
         on DioError catch(e){
         log(e.toString());
        return const Left(MainFailure.clientFailure() );
       }
       catch(e){
         log(e.toString());
        return const Left(MainFailure.clientFailure() );

       }
  }

}