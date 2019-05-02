import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_best_sellers/list_book_detail_response.dart';

class MainListItem extends StatelessWidget {
  MainListItem(this._response);

  final ListBookDetailResponse _response;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_response.title),
      subtitle: Text(_response.description),
    );
  }
}
