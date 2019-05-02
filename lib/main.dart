import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_best_sellers/client.dart';
import 'package:nyt_best_sellers/list_book_detail_response.dart';
import 'package:nyt_best_sellers/list_name_response.dart';
import 'package:nyt_best_sellers/list_response.dart';
import 'package:nyt_best_sellers/main_list_item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYTBestSellers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'NYTBestSellers'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Client _client = Client();

  List<ListNameResponse> _menuItems = [];
  ListNameResponse _selected;
  List<ListBookDetailResponse> _items = [];

  _MainPageState() {
    _fetchListNames();
  }

  void _fetchListNames() async {
    final names = await _client.getListNames();
    setState(() {
      _menuItems = names.results;
      _selected = _menuItems[0];
    });
  }

  void _fetchLists() async {
    final lists = await _client.getLists(_selected.encodedName);
    setState(() {
      _items = lists.results
          .map(
            (ListResponse response) => response.bookDetails.firstWhere(
                  (_) => true,
                  orElse: () => null,
                ),
          )
          .where((ListBookDetailResponse response) => response != null)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonHideUnderline(
              child: DropdownButton<ListNameResponse>(
                isExpanded: true,
                value: _selected,
                items: _menuItems.map((ListNameResponse response) {
                  return DropdownMenuItem<ListNameResponse>(
                    value: response,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(response.displayName),
                    ),
                  );
                }).toList(),
                onChanged: (ListNameResponse response) {
                  setState(() {
                    _selected = response;
                  });
                  _fetchLists();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) =>
                    MainListItem(_items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
