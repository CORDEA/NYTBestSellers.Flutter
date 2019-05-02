import 'package:json_annotation/json_annotation.dart';

part 'list_review_response.g.dart';

@JsonSerializable()
class ListReviewResponse {
  ListReviewResponse(this.bookReviewLink, this.firstChapterLink,
      this.sundayReviewLink, this.articleChapterLink);

  @JsonKey(name: "book_review_link")
  final String bookReviewLink;
  @JsonKey(name: "first_chapter_link")
  final String firstChapterLink;
  @JsonKey(name: "sunday_review_link")
  final String sundayReviewLink;
  @JsonKey(name: "article_chapter_link")
  final String articleChapterLink;

  factory ListReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReviewResponseFromJson(json);
}
