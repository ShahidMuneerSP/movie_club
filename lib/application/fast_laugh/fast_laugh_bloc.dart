import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/domain/downloads/i_downloads_repo.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
   "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"

];
ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async{
      //sending loading to ui
      emit( const FastLaughState(videosList: [], isLoading: true, isError: false));
      //get trending movies
      final _result = await _downloadService.getDownloadsImage();
    final _state =   _result.fold(
        (l) =>  const FastLaughState(
          videosList: [],
           isLoading: false,
            isError: true,
             
            ),
       (resp) =>FastLaughState(
        videosList: resp, 
        isLoading: false,
         isError: false, 
        )
         );

      

      //send to UI
      emit(_state);
    }
        );
        on<LikeVideo>((event, emit) async {
         likedVideosIdsNotifier.value.add(event.id);
         likedVideosIdsNotifier.notifyListeners();
        
        });        
         on<UnLikeVideo>((event, emit) {
           likedVideosIdsNotifier.value.remove(event.id);
           likedVideosIdsNotifier.notifyListeners();
           
         
 
        });        
  }
}
