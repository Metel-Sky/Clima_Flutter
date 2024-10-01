import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WEATHER',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              //Align(
              //alignment: Alignment.topLeft,
              // child: TextButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: Icon(
              //     //Icons.arrow_back_ios,
              //     //size: 50.0,
              //   ),
              // ),
              //),

              Container(
                padding: EdgeInsets.all(30.0),
                child: TextField(
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                    decoration: kTextFieldInputDecoration,
                onChanged: (value){
                      print(value);
                },),

              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} //123
