import 'package:dartz/dartz.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();

}