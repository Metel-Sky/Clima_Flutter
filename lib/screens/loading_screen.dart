import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/location.dart';
import 'dart:convert';

const apiKey = 'cb717aa65605c59d6d0dbfc3a8b65fa7';
const kyiv =
    'https://api.openweathermap.org/data/2.5/weather?lat=50.4791&lon=30.5932&appid=$apiKey';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
    getPermission();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    print(longitude);
    print(latitude);
    getData();
  }

  void getData() async {
    Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);

      var decodeData = jsonDecode(data);

      var weatherDescription = decodeData['weather'][0]['description'];
      //weather[0].description
      var temp = decodeData['main']['temp'];
      //main.temp
      var country = decodeData['sys']['country'];
      //sys.country
      var nameStreet = decodeData['name'];
      //name

      print(temp);
      print(country);
      print(nameStreet);
      print(weatherDescription);
    } else {
      print(response.statusCode);
    }
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
      ),//12
    );
  }
}
