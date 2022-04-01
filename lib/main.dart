

// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, sized_box_for_whitespace
























//  import 'dart:math' as math;
//  import 'package:flutter/material.dart';


//  void main()
//  {
//    runApp(MyApp());
//  }

//  class MyApp extends StatefulWidget {
//    const MyApp({ Key? key }) : super(key: key);
 
//    @override
//    State<MyApp> createState() => _MyAppState();
//  }
 
//  class _MyAppState extends State<MyApp> {
//    @override
//    Widget build(BuildContext context) {
//      return CustomTimerPainter(animation: animation, backgroundColor: backgroundColor, color: color)
//    }
//  }

// class CustomTimerPainter extends CustomPainter {
//   CustomTimerPainter({
//     required this.animation,
//     required this.backgroundColor,
//    required this.color,
//   }) : super(repaint: animation);

//   final Animation<double> animation;
//   final Color backgroundColor, color;

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = backgroundColor
//       ..strokeWidth = 6.0
//       ..strokeCap = StrokeCap.butt
//       ..style = PaintingStyle.stroke;

//     canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
//     paint.color = color;
  
//     double progress = (1.0 - animation.value) * 2 * math.pi;
//     canvas.drawArc(Offset.zero & size, math.pi * 1.5, progress, false, paint);
//   }

//   @override
//   bool shouldRepaint(CustomTimerPainter old) {
//     return animation.value != old.animation.value ||
//         color != old.color ||
//         backgroundColor != old.backgroundColor;
//   }
// }


// //FIFTH 

// import 'dart:math'as math;
 
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(
//   home: OMo(),
// ));
 
//  class OMo extends StatefulWidget {
//    const OMo({ Key? key }) : super(key: key);
 
//    @override
//    State<OMo> createState() => _OMoState();
//  }
 
//  class _OMoState extends State<OMo> with SingleTickerProviderStateMixin{
//       AnimationController? _animationController;
//      Animation? _animation;


//     @override
//     void initState(){
//       _animationController = AnimationController(vsync: this ,
//       duration: Duration(milliseconds: 6000)
      
//       );
//        _animationController!.repeat(reverse:true);
//        _animation = Tween(
//           begin: 0.0, end: 6.28
//        ).animate(_animationController!)
//        ..addListener(() {
//          setState(() {
//             // the state that has changed here is the animation object’s value
                       
//          });
//         });
//         super.initState();
//     }
  
//    @override
//    Widget build(BuildContext context) {
//      return Padding(
//        padding: const EdgeInsets.only(left:100, top:300),
//        child: Stack(
//          children: [
//            CustomPaint(
//              size: Size(100, 100),

//              painter: 
//              CustomCircle(Colors.red, 1.1 + _animation!.value),
//            ),
//            CustomPaint(
//              size: Size(100, 100),
//              painter: 
//              CustomCircle(Colors.green, 1.5 * _animation!.value),
             
//            ),
//            CustomPaint(
//              size: Size(100, 100),
//              painter: 
//              CustomCircle(Colors.blue, 2.0 * _animation!.value),
             
//            ),
//              CustomPaint(
//              size: Size(100, 100),
//              painter: 
//              CustomCircle(Colors.yellow, 2.5 * _animation!.value),
             
//            )
//          ],  
//        ),
//      );
//    }
//  }



// class CustomCircle extends CustomPainter{
//  double right= 50;
//  double bottom= 50;
// //  double left = 100;
// //  double top = 100;
//  late Color color;
//  late double rad;

//  CustomCircle(Color color, double rad){
//    this.color= color;
//    this.rad= rad;
//  }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTRB(0, 0, right, bottom);
//     final startAngle = math.pi * rad;
//      final sweepAngle = math.pi/3;
//      final useCenter = false;
//       final paint = Paint()
//       ..color = color
//       ..style =PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 2;  //this is to chande the 
//       canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

//   }
// }'







import 'package:flutter/material.dart';
import 'package:progressindicatorproj/multicolor_customprogressindicator.dart';

import 'customcircularprogressindicator.dart';
void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child:Container(
        height: 50,
        width: 300,
        child: ElevatedButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomCircularProgress()));
        }, child: Padding(
          padding: const EdgeInsets.only(top:8.0, left:250),
          child: OMo(),
        )),
      ) ,
      )
    );
  }
}