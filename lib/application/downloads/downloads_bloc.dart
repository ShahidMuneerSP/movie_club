import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/downloads/i_downloads_repo.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';
@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async{
    emit(
      state.copyWith(
        isLoading: true,
        downloadsFailureOrSuccessOption: none(),
      ),
    );
    final Either<MainFailure,List<Downloads>> downloadsOption = await _downloadsRepo.getDownloadsImage();
    log(downloadsOption.toString());
    emit(
      downloadsOption.fold(
        (failure) => state.copyWith(
        isLoading: false,
       downloadsFailureOrSuccessOption: some(left(failure))
    ), 
    (success) => state.copyWith(
      isLoading: false,
      downloads: success,
      downloadsFailureOrSuccessOption: some(right(success))
    )));
    });
  }
}
