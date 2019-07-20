
// created by jerryzhu

// time : 2019/7/7 

import 'package:flutter/material.dart';

void main(){
  runApp(new GridViewDemo(
      items: new List.generate(20, (index){
        return "index : ${index}";
      }

  )));
}

class GridViewDemo extends StatelessWidget {

  List items;

  GridViewDemo({Key key, this.items}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "gridview demo",
      theme: new ThemeData(
          primaryColor: Colors.yellow
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("gridview demo"),
        ),
        body: new GridView.count(
          crossAxisCount: 3,
          children: items.map((i) {
            return new Center(
              child: new Text(i, style: Theme
                  .of(context)
                  .textTheme
                  .headline,),

            );
          }).toList(),
        ),
      ),
    );
  }
}
