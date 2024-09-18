import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget{
  @override
  _LocationScreenState createState()=> _LocationScreenState();

}

class _LocationScreenState extends State<LocationScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "WEATHER",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
        centerTitle: true,
        backgroundColor: Colors.black,),
      body: Container(),
    );

  }
}