// created by jerryzhu

// time : 2019/7/15 

import 'package:flutter/material.dart';

void main(){
  runApp(new ViewPagerDemo());

}

class ViewPagerDemo extends StatefulWidget {

  List<String> datas = [];


  @override
  State<StatefulWidget> createState() {
    for(int i =0;i <20 ;i++){
      datas.add("item $i");
    }

    return new StateViewPagerDemo(datas);
  }
}

class StateViewPagerDemo extends State<ViewPagerDemo> {


  final List<String> datas;

  StateViewPagerDemo(this.datas);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "viewpager demo",
      theme: ThemeData.dark(),
      home: new Scaffold(

        appBar: new AppBar(

          title: new Text("viewpager demo"),
          bottom: new TabBar(
              tabs: <Widget>[new Text("tab1"),new Text("tab2")],

          ),
        ),
        body: new TabBarView(
            children: [
              new ListView.builder(
                itemCount: datas.length,
                itemBuilder:(context,index){
                  return buildItem(index);

                }

              ),
              new ListView.builder(
                  itemCount: datas.length,
                  itemBuilder:(context,index){
                    return buildItem(index);

                  }

              ),

            ]

        ),
      ),
    );
  }

  Widget buildItem(int index) {

    return new ListTile(
      title:new Text(
        widget.datas[index],
        style:new TextStyle(
          color: Colors.blue,
          fontSize: 20,

        ) ,

      ),
    );
  }



}