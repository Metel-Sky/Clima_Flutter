import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/location.dart';

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
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
  }


  void getData () async{

    Uri url = Uri.parse('https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=%3Cspan%20class=');

    Response response = await get(url);

    if (response.statusCode == 200){
      String data = response.body;
    }
    else{
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
      ),//rrggmm
    );
  }
}
