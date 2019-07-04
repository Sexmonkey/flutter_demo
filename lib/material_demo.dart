import 'package:flutter/material.dart';


//  created by jerryzhu

//  time : 2019/7/4

void main(){

  runApp(new MaterialApp(

    title: "material demo",

    home: new MaterialDemo(),

  ));
}

class MaterialDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Scaffold Material App中主要的布局组件
    return new Scaffold(

      appBar: new AppBar(

        leading: new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "Navigation menu",
            onPressed: null),
        title: new Text("material demo"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "Search",
              onPressed: null)

        ],

      ),
//    占用屏幕大部分
      body: new Center(

        child: new Text("hello material"),

      ),

      floatingActionButton: new FloatingActionButton(
          tooltip: "Add",
          child: new Icon(Icons.add),
          onPressed: null

      ),

    );
  }
}
