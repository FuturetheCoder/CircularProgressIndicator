// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_initializing_formals

import 'dart:math'as math;
 
import 'package:flutter/material.dart';

//PRACTICAL EXAMPLE OF USING THE MULTICOLOR CIRCULAR PROGRESS INDICATOR

void main() => runApp(MaterialApp(
  home: OMo(),
));
 
 class OMo extends StatefulWidget {
   const OMo({ Key? key }) : super(key: key);
 
   @override
   State<OMo> createState() => _OMoState();
 }
 
 class _OMoState extends State<OMo> with SingleTickerProviderStateMixin{
      AnimationController? _animationController;
     Animation? _animation;


    @override
    void initState(){
      _animationController = AnimationController(vsync: this ,
      duration: Duration(milliseconds: 6000)
      
      );
       _animationController!.repeat(reverse:true);
       _animation = Tween(
          begin: 0.0, end: 6.28
       ).animate(_animationController!)
       ..addListener(() {
         setState(() {
            // the state that has changed here is the animation object’s value
                       
         });
        });
        super.initState();
    }
  
   @override
   Widget build(BuildContext context) {
     return Stack(
       children: [
         CustomPaint(
           size: Size(100, 100),

           painter: 
           CustomCircle(Colors.red, 1.1 + _animation!.value),
         ),
         CustomPaint(
           size: Size(100, 100),
           painter: 
           CustomCircle(Colors.green, 1.5 * _animation!.value),
           
         ),
         CustomPaint(
           size: Size(100, 100),
           painter: 
           CustomCircle(Colors.blue, 2.0 * _animation!.value),
           
         ),
           CustomPaint(
           size: Size(100, 100),
           painter: 
           CustomCircle(Colors.yellow, 2.5 * _animation!.value),
           
         )
       ],  
     );
   }
 }



class CustomCircle extends CustomPainter{
 double right= 30;
 double bottom= 30;
//  double left = 100;
//  double top = 100;
 late Color color;
 late double rad;

 CustomCircle(Color color, double rad){
   this.color= color;
   this.rad= rad;
 }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, right, bottom);
    final startAngle = math.pi * rad;
     final sweepAngle = math.pi/3;
     final useCenter = false;
      final paint = Paint()
      ..color = color
      ..style =PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;  //this is to chande the 
      canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

  }
}