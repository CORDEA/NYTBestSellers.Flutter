import 'package:json_annotation/json_annotation.dart';

part 'list_isbn_response.g.dart';

@JsonSerializable()
class ListIsbnResponse {
  ListIsbnResponse(this.isbn13, this.isbn10);

  final String isbn13;
  final String isbn10;

  factory ListIsbnResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIsbnResponseFromJson(json);
}
