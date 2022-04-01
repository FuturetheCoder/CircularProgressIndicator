

// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors
//THIS FILE EXPLAINS HOW TO USE CIRCULAR PROGRESS INDICATOR WIDGET TO MAKE PROGRESS
//CASE SCENARIOS LIKE TO REPRESENT PROGRESS, OR LOADING INDICATOR IN YOUR PROJECT
import 'dart:async';

import 'package:flutter/material.dart';

 
void main()
{
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}
 
class _MyHomePageState extends State<MyHomePage> {
  double value  = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Circular Progress Indicator"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children:[
              Container(
                child: Text("Indeterminate Progress Indicator",style: TextStyle(fontSize: 18),),
                margin: EdgeInsets.all(20),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Color(0XFFF10E48B),
                strokeWidth: 5,
                ),
              ),
             
             
          ]
          )
        )
    );
  }
}