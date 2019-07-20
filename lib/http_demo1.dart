import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// created by jerryzhu

// time : 2019/7/6 

void main(){
  runApp(new HttpDemo());

}

class HttpDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "http demo",
      theme: new ThemeData(
        primaryColor: Colors.amber
      ),
      home: new HttpDemoState(),
    );
  }
}

class HttpDemoState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HttpDemoState();
  }
}

class _HttpDemoState extends State<HttpDemoState> {

  List widgets = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("http demo"),

      ),
      body: new ListView.builder(
          itemCount: widgets.length,
          itemBuilder:(BuildContext context,int position){
            return _buildRow(position);
          }
      ),

    );
  }


  Widget _buildRow(int position) {

    return new Padding(
      padding: const EdgeInsets.all(10),
      child: new Text("row ${widgets[position]["title"]}"),
    );
  }

  void _loadData () async {

    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
       widgets = json.decode(response.body);
    });

  }
}