import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/hot_and_new/hot_and_new_service.dart';
import 'package:movie_club/domain/hot_and_new/model/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';
@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
   final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {

    //get hot and new movie data
    on<LoadDataInComingSoon>((event, emit) async{
   
   //send loading to ui
   emit(const HotAndNewState(
    comingSoonList: [],
     everyOnesWatchingList: [],
      isloading: true, 
      hasError: false));
     
     //get data from remote
    final _result = await _hotAndNewService.getHotAndNewMovieData();

    //data tp state
  final newState =  _result.fold(
      (MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [], 
          everyOnesWatchingList: [],
           isloading: false,
            hasError:true);
      } , 
      (HotAndNewResp resp){
        return HotAndNewState(
          comingSoonList: resp.results, 
          everyOnesWatchingList: state.everyOnesWatchingList, 
          isloading: false,
           hasError: false);
      } );
      emit(newState);

    });

    //get hot and new tv data
      on<LoadDataInEveryOneIsWatching>((event, emit) async {
       //send loading to ui
   emit(const HotAndNewState(
    comingSoonList: [],
     everyOnesWatchingList: [],
      isloading: true, 
      hasError: false));
     
     //get data from remote
    final _result = await _hotAndNewService.getHotAndNewTvData();

    //data tp state
  final newState =  _result.fold(
      (MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [], 
          everyOnesWatchingList: [],
           isloading: false,
            hasError:true);
      } , 
      (HotAndNewResp resp){
        return HotAndNewState(
          comingSoonList: state.comingSoonList, 
          everyOnesWatchingList: resp.results, 
          isloading: false,
           hasError: false);
      } );
      emit(newState);
    });
  }
}
