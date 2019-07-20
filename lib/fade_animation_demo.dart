import 'package:flutter/material.dart';

// created by jerryzhu

// time : 2019/7/6 

void main(){

  runApp(new FadeAppDemo());

}

class FadeAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"fade animation demo",
      theme: new ThemeData(
        primarySwatch: Colors.yellow

      ),
      home: new FadeAnimation(title:"fade animation demo"),
    );

  }
}

class FadeAnimation extends StatefulWidget {

  final String title;

  FadeAnimation({Key key,this.title}):super(key: key);

  @override
  State<StatefulWidget> createState() {

    return new _FadeAnimationState();;
  }
}

class _FadeAnimationState extends State<FadeAnimation> with TickerProviderStateMixin {

  AnimationController animationController;
  CurvedAnimation curvedAnimationIn;
  CurvedAnimation curvedAnimationOut;

  bool isIn = false;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(duration: const Duration(milliseconds: 3000),vsync: this);
    curvedAnimationIn = new CurvedAnimation(parent: animationController, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child:new FadeTransition(
              opacity: curvedAnimationIn  ,
              child: new FlutterLogo(
                size: 100,
              ),
          ) ,
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        tooltip: "Fade Demo",
        onPressed:() {
          if(animationController.isCompleted){
            animationController.reverse();
          }else{
            animationController.forward();
          }
        },
        child: new Icon(Icons.brush),

      ),
    );
  }


}