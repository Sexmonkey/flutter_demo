import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    "Oeschinen Lake Campground",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  "Kandersteg, Switzerland",
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          new FavoriteWidget(),
        ],
      ),
    );

    Column _buildButtonColoumn(IconData icon, String lable) {
      Color primaryColor = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            icon,
            color: primaryColor,
          ),
          new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                lable,
                style: new TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
              )),
        ],
      );
    }

    final buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColoumn(Icons.call, "CALL"),
          _buildButtonColoumn(Icons.near_me, "ROUTE"),
          _buildButtonColoumn(Icons.share, "SHARE"),
        ],
      ),
    );

    final textSection = new Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        """
         Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
         """,
        softWrap: true,
      ),
    );

    return MaterialApp(
//        title: "layout demo",
        home: new Scaffold(
          appBar: AppBar(
            title: Text("layout demo"),
          ),
          body: new ListView(
            children: [
              new Image.asset(
                "images/lake.jpg",
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          ),
        ));
  }
}

class FavoriteWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _FavoritedWidgetState();
  }

}

class _FavoritedWidgetState extends State<FavoriteWidget>{


  bool _isFavorited = true;

  int _favoritedCount = 22;

  void _clickFavorite(){

    setState(() {
      if(_isFavorited){
        _isFavorited = false;
        _favoritedCount -= 1;
      }else{
        _isFavorited = true;
        _favoritedCount += 1 ;
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return new Row(

      mainAxisSize: MainAxisSize.min,

      children: [
        new Container(

          padding: const EdgeInsets.all(0.0),
          child: IconButton(
              icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
              color: Colors.red,
              onPressed: _clickFavorite,
          ),

        ),

        new SizedBox(
          width: 18.0,
          child:new Container(

            child: new Text("$_favoritedCount"),

          ),

        )

      ],
    );
  }


}
