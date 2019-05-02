import 'package:json_annotation/json_annotation.dart';
import 'package:nyt_best_sellers/list_book_detail_response.dart';
import 'package:nyt_best_sellers/list_isbn_response.dart';
import 'package:nyt_best_sellers/list_review_response.dart';

part 'list_response.g.dart';

@JsonSerializable()
class ListResponse {
  ListResponse(
      this.listName,
      this.displayName,
      this.bestsellersDate,
      this.publishedDate,
      this.rank,
      this.lastWeekRank,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.amazonProductUrl,
      this.isbns,
      this.bookDetails,
      this.reviews);

  @JsonKey(name: "list_name")
  final String listName;
  @JsonKey(name: "display_name")
  final String displayName;
  @JsonKey(name: "bestsellers_date")
  final String bestsellersDate;
  @JsonKey(name: "published_date")
  final String publishedDate;
  final String rank;
  @JsonKey(name: "rank_last_week")
  final int lastWeekRank;
  @JsonKey(name: "weeks_on_list")
  final int weeksOnList;
  final int asterisk;
  final int dagger;
  @JsonKey(name: "amazon_product_url")
  final String amazonProductUrl;
  final List<ListIsbnResponse> isbns;
  @JsonKey(name: "book_details")
  final List<ListBookDetailResponse> bookDetails;
  final List<ListReviewResponse> reviews;

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);
}
