import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;

  _getGifs() async {
    http.Response response;

    if(_search == null)
      response = await http.get("");
    else
      response = await http.get("");

  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
