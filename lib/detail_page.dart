import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_best_sellers/list_book_detail_response.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key, this.response}) : super(key: key);

  final ListBookDetailResponse response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(response.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 16.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(response.description),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(Icons.book, color: Colors.black54),
                        SizedBox(width: 16.0),
                        Text(response.author),
                      ]),
                      SizedBox(height: 16.0),
                      Row(children: <Widget>[
                        Icon(Icons.business, color: Colors.black54),
                        SizedBox(width: 16.0),
                        Text(response.publisher),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
