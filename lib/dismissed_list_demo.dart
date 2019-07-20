// created by jerryzhu

// time : 2019/7/7 

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main(){
  runApp(new DismissedDemo(
      datas:new List.generate(100, (i){
        return "item : ${i}";
      })
  ));
}

class DismissedDemo extends StatelessWidget {

  final List<String> datas;

  DismissedDemo({Key key,this.datas}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "dismissed demo",
      theme: new ThemeData(
        primaryColor: Colors.amber

      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("dismissed demo"),

        ),
        body: new ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context,index){
              String data = datas[index];

              return new Dismissible(
                  key: new Key(data),
                  background: new Container(color: Colors.blue),
                  onDismissed: (direction){
                    datas.removeAt(index);
                    Scaffold.of(context).showSnackBar(
                       new SnackBar(content: new Text("item ${index} dismissed !"))
                    );
                  } ,
                  child: new ListTile(title: new Text("item ${index}"),)
              );
            }),
      ),
    );
  }
}