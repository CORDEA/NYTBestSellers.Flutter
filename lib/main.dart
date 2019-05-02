import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyt_best_sellers/client.dart';
import 'package:nyt_best_sellers/list_name_response.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Client _client = Client();

  List<ListNameResponse> _responses = [];
  ListNameResponse _selected;

  _MyHomePageState() {
    _fetchListNames();
  }

  void _fetchListNames() async {
    final names = await _client.getListNames();
    setState(() {
      _responses = names.results;
      _selected = _responses[0];
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
            DropdownButton<ListNameResponse>(
              isExpanded: true,
              value: _selected,
              items: _responses.map((ListNameResponse response) {
                return new DropdownMenuItem<ListNameResponse>(
                  value: response,
                  child: new Text(response.displayName),
                );
              }).toList(),
              onChanged: (ListNameResponse response) {
                setState(() {
                  _selected = response;
                });
              },
            ),
//            ListView.builder(itemBuilder: null)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
