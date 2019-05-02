import 'package:json_annotation/json_annotation.dart';
import 'package:nyt_best_sellers/list_name_response.dart';

part 'list_names_response.g.dart';

@JsonSerializable()
class ListNamesResponse {
  ListNamesResponse(
      this.status, this.copyright, this.numberOfResults, this.results);

  final String status;
  final String copyright;
  @JsonKey(name: "num_results")
  final int numberOfResults;
  final List<ListNameResponse> results;

  factory ListNamesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNamesResponseFromJson(json);
}