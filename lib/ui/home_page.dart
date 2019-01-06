import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=IVDg5FxkHX3OEVJ7beIuoS1sHZdFSp98&limit=25&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=IVDg5FxkHX3OEVJ7beIuoS1sHZdFSp98&q=$_search&limit=25&offset=$_offset&rating=G&lang=pt");

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black12,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Procure aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.topCenter,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.yellowAccent),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        _createGifTable(context, snapshot);
                  }
                }),
          )
        ],
      ),
    );
  }
}

Widget _createGifTable (BuildContext context,AsyncSnapshot snapshot){

}
