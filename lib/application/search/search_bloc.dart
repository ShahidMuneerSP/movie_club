import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_club/core/failures/main_failures.dart';
import 'package:movie_club/domain/downloads/i_downloads_repo.dart';
import 'package:movie_club/domain/downloads/models/downloads.dart';
import 'package:movie_club/domain/search/model/search_resp.dart';
import 'package:movie_club/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: true,
            isError: false));
        return;
      }

      // get trending
      final _result = await _downloadsService.getDownloadsImage();
      final _state = _result.fold(
        (MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isError: true,
            isLoading: false);
      }, 
      (List<Downloads> list) {
        return SearchState(
          searchResultList: [],
          idleList: list,
          isError: false,
          isLoading: false,
        );
      });
      emit(_state);
    });

    on<SearchMovies>((event, emit) async{
      
      // call api
      log('Searching for ${event.movieQuery}');
       emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));

    final _result = await  _searchService.searchMovies(movieQuery: event.movieQuery);
    final _state =_result.fold(
      (MainFailure f) {
         return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, 
    (SearchResp r) {
       return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
    });
    emit(_state);
    });
  }
}
