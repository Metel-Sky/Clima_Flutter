import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    getPermission();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WEATHER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              getPermission(); //перевіряє чи є дозвіл на використання геоданних
              getLocation(); // запит на місце положення
            },
            child: Text(
              'Get location',
              style: TextStyle(fontSize: 40),
            )),
      ),
    ); //12
  }
}
