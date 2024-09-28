import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';
import '../services/weather.dart';

const apiKey = 'cb717aa65605c59d6d0dbfc3a8b65fa7';
const kyiv =
    'https://api.openweathermap.org/data/2.5/weather?lat=50.4791&lon=30.5932&appid=cb717aa65605c59d6d0dbfc3a8b65fa7';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
    getPermission();
  }

  void getLocationData() async {

    var weatherData = await WeatherModel().getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);
    }));
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
        child: SpinKitFadingCircle(
          color: Colors.deepPurpleAccent,
          size: 100,
        ),

      ),
    );
  }
}





// child: TextButton(
//     onPressed: () {
//       getPermission(); //перевіряє чи є дозвіл на використання геоданних
//       getLocationData(); // запит на місце положення
//     },
//     child: Text(
//       'Get location',
//       style: TextStyle(fontSize: 40),
//     )),