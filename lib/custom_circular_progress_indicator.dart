import 'dart:async';
import 'dart:math';
import 'dart:ui';
//THIS PROJECT EXPLAINS HOW TO USE PAINTER TO CREATE  A CIRCULAR PROGRESS INDICATOR
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: StopButton(5, 20 ),
));


class StopButton extends StatefulWidget {
  @override
  _StopButtonState createState() => _StopButtonState();

  final double totalTime;
  final dynamic onClickFunction;
  StopButton(this.totalTime, this.onClickFunction);
}

class _StopButtonState extends State<StopButton> with TickerProviderStateMixin {
  double percentage = 0.0;
  double newPercentage = 0.0;
  late AnimationController percentageAnimationController;
  late Timer timer;
  @override
  void initState() {
 
    super.initState();
    setState(() {
      percentage = 0.0;
    });
    percentageAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {
              percentage = lerpDouble(percentage, newPercentage,
                  percentageAnimationController.value)!;
            });
          });
    startTime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    percentageAnimationController.dispose();
    super.dispose();
  }

  void startTime() {
    setState(() {
      percentage = newPercentage;
      newPercentage += 0.0;
      if (newPercentage > widget.totalTime) {
        percentage = 0.0;
        newPercentage = 0.0;
        //timer.cancel();
      }
      percentageAnimationController.forward(from: 0.0);
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //print(timer.tick);
      setState(() {
        percentage = newPercentage;
        newPercentage += 1.0;
        if (newPercentage > widget.totalTime) {
          percentage = 0.0;
          newPercentage = 0.0;
          // timer.cancel();
        }
        percentageAnimationController.forward(from: 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:130.0, top: 100),
      child: CustomPaint(
        foregroundPainter: MyPainter(
          lineColor: Colors.green,
          completeColor: Color(0xFF133343),
          completePercent: percentage,
          width: 10.0,
          totalTime: widget.totalTime,
        ),
   
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  double totalTime;
  MyPainter(
      {required this.lineColor,
     required  this.completeColor,
     required  this.completePercent,
     required  this.width,
     required  this.totalTime});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 4, size.height / 4);
    double radius = min(size.width / 4, size.height / 4);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / totalTime);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;

  }
}
