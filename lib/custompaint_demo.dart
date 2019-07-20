import 'package:flutter/material.dart';

// created by jerryzhu

// time : 2019/7/6

void main(){
  runApp(new MaterialApp(

    home: new MyCustomPainterDemo(),
  ));
}

class MyCustomPainterDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("custom painter demo"),
      ),
      body: new Signature(),
    );
  }

}

class Signature extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _Signature();
  }
}

class _Signature extends State<Signature> {

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children:[
        new GestureDetector(
          onPanUpdate: (DragUpdateDetails detail){
            RenderBox renderBox = context.findRenderObject();
            Offset localPosition = renderBox.globalToLocal(detail.globalPosition);
            setState(() {
              _points = new List.from(_points)..add(localPosition);
            });
          },

          onPanEnd: (DragEndDetails details){
            _points.add(null);
          },

        ),
        CustomPaint(painter: SignaturePainter(_points),size: Size.infinite,)
      ],
    );
  }
}

class SignaturePainter extends CustomPainter {

  final List<Offset> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint()
      ..color =Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.0;

    for(int i = 0;i < points.length - 1;i++){

      if(points[i] != null && points[i+1] != null){
        canvas.drawLine(points[i], points[i+1], paint);
      }

    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}