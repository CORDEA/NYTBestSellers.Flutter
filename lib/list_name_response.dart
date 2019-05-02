import 'package:json_annotation/json_annotation.dart';

part 'list_name_response.g.dart';

@JsonSerializable()
class ListNameResponse {
  ListNameResponse(this.name, this.displayName, this.encodedName,
      this.oldestPublishedDate, this.newestPublishedDate, this.updated);

  @JsonKey(name: "list_name")
  final String name;
  @JsonKey(name: "display_name")
  final String displayName;
  @JsonKey(name: "list_name_encoded")
  final String encodedName;
  @JsonKey(name: "oldest_published_date")
  final String oldestPublishedDate;
  @JsonKey(name: "newest_published_date")
  final String newestPublishedDate;
  final String updated;

  factory ListNameResponse.fromJson(Map<String, dynamic> json) =>
      _$ListNameResponseFromJson(json);
}
