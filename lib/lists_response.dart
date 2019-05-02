import 'package:json_annotation/json_annotation.dart';
import 'package:nyt_best_sellers/list_response.dart';

part 'lists_response.g.dart';

@JsonSerializable()
class ListsResponse {
  ListsResponse(
      this.status, this.copyright, this.numberOfResults, this.results);

  final String status;
  final String copyright;
  @JsonKey(name: "num_results")
  final int numberOfResults;
  final List<ListResponse> results;

  factory ListsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListsResponseFromJson(json);
}
