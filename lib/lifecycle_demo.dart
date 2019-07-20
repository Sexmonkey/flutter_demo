import 'package:flutter/material.dart';

// created by jerryzhu

// time : 2019/7/6 

void main (){
  runApp(new Center(

    child: new LifecycleDemo(),
  ));
}

class LifecycleDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _LifecycleDemo();
  }
}

class _LifecycleDemo extends State<LifecycleDemo> with WidgetsBindingObserver{

  AppLifecycleState _appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState = state;
    });
  }


  @override
  Widget build(BuildContext context) {

    if (_appLifecycleState == null)
      return new Text('This widget has not observed any lifecycle changes.', textDirection: TextDirection.ltr);
    return new Text('The most recent lifecycle state this widget observed was: $_appLifecycleState.',
        textDirection: TextDirection.ltr);

  }

}