import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:isolate';

// created by jerryzhu

// time : 2019/7/6 

void main(){
  runApp(new IsolatDemo());
}

class IsolatDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "isolate demo",
      theme: new ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: new IsolateDemoState()
    );
  }
}

class IsolateDemoState extends StatefulWidget {

  IsolateDemoState({Key key}):super(key : key);

  @override
  State<StatefulWidget> createState() {
    return new _IsolateDemoState();
  }
}

class _IsolateDemoState extends State<IsolateDemoState> {

  List widgets = [];

  bool shouldShowProgress() {

    if(widgets.length == 0){
      return true;
    }
    return false;

  }

  getBody() {

    if(shouldShowProgress()){
      return getProgressWidget();
    }

    return getListView();

  }

  ListView getListView(){

    return new ListView.builder(
        itemCount:widgets.length,
        itemBuilder:(BuildContext context,int position){
          return getRow(position);
        }
    );
  }

  Widget getRow(int position) {

    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("${widgets[position]["title"]}"),

    );
  }

  getProgressWidget() {

    return new Center(
      child:new CircularProgressIndicator() ,
    );

  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("isolate demo"),

      ),
      body: getBody(),

    );
  }

  void _loadData() async {

    ReceivePort receivePort = new ReceivePort();

    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort,"https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });

  }


  static dataLoader(SendPort sendport) async {
    ReceivePort receivePort = new ReceivePort();
    sendport.send(receivePort.sendPort);

    await for(var msg in receivePort){
      String data = msg[0];
      SendPort replyTo = msg[1];
      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(json.decode(response.body));

    }

  }

  sendReceive(SendPort sendPort, String msg) {
    ReceivePort response = new ReceivePort();
    sendPort.send([msg,response.sendPort]);
    return response.first;

  }
}