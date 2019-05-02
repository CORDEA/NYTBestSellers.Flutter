import 'package:json_annotation/json_annotation.dart';

part 'list_book_detail_response.g.dart';

@JsonSerializable()
class ListBookDetailResponse {
  ListBookDetailResponse(
      this.title,
      this.description,
      this.contributor,
      this.author,
      this.contributorNote,
      this.price,
      this.ageGroup,
      this.publisher,
      this.primaryIsbn13,
      this.primaryIsbn10);

  final String title;
  final String description;
  final String contributor;
  final String author;
  @JsonKey(name: "contributor_note")
  final String contributorNote;
  final int price;
  @JsonKey(name: "age_group")
  final String ageGroup;
  final String publisher;
  @JsonKey(name: "primary_isbn13")
  final String primaryIsbn13;
  @JsonKey(name: "primary_isbn10")
  final String primaryIsbn10;

  factory ListBookDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBookDetailResponseFromJson(json);
}
