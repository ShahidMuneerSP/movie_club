import 'package:dartz/dartz.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo{
  Future<Either<MainFailure,List<Downloads>>>  getDownloadsImage();
}