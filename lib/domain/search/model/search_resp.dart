import 'package:json_annotation/json_annotation.dart';
import 'package:movie_club/core/constants.dart';
import 'package:movie_club/core/strings.dart';

part 'search_resp.g.dart';
@JsonSerializable()
class SearchResp{
 
  List<SearchResultData>? results;

  SearchResp({this.results});
  factory SearchResp.fromJson(Map<String, dynamic> json){
    return _$SearchRespFromJson(json);
  }
  Map<String,dynamic> toJson() => _$SearchRespToJson(this);
  
}

@JsonSerializable()
class SearchResultData{

@JsonKey(name: 'id')
int? id;
@JsonKey(name: 'original_title')
String? originalTitle;
@JsonKey(name: 'poster_path')
String? posterpath;



SearchResultData({
  this.id,
  this.originalTitle,
  this.posterpath
});

factory SearchResultData.fromJson(Map<String,dynamic> json){
  return _$SearchResultDataFromJson(json);
}
Map<String,dynamic> toJson() => _$SearchResultDataToJson(this);
}




