import 'package:flutter/material.dart';

// created by jerryzhu

// time : 2019/7/7 

void main(){


  runApp(new MultiItemlist(
      items: new List<Item>.generate(10000, (i){

        if(i % 7 == 0){
          return new TitleItem("heade ${i}");

        }else{
          return new BodyItem("title ${i}", "msg ${i}");
        }
      })

  ));
}

class MultiItemlist extends StatelessWidget {

  final List<Item> items;

  MultiItemlist({Key key,@required this.items}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "mutil item list",
      theme: new ThemeData(
        primaryColor: Colors.red
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("mutil item list"),
        ),
        body: new ListView.builder(
            itemCount:items.length,

            itemBuilder:(BuildContext context,int pos){
                Item item = items[pos];
                if(item is TitleItem){
                  return new ListTile(
                    title: new Text(
                      // ignore: missing_return
                      item.title,
                      // ignore: missing_return
                      style: Theme.of(context).textTheme.headline
                    ),
                  );
                }

              if(item is BodyItem){

                return new ListTile(

                  title:new Text(item.title),
                  subtitle: new Text(item.msg),

                );
              }
            },
        ),
      )
    );
  }
}

abstract class Item{}

class TitleItem implements Item{

  final title;

  TitleItem(this.title);


}

class BodyItem implements Item{

  final msg;

  final title;

  BodyItem(this.title,this.msg);

}

