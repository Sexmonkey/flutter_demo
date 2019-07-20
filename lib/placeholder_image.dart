import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// created by jerryzhu

// time : 2019/7/7

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "placeholder image",
      theme: new ThemeData(primaryColor: Colors.blueAccent),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("placeholder image"),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(
              child: new CircularProgressIndicator(),
            ),
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
              ),
            ),

          ],
        ),
      ),
    );
  }
}
