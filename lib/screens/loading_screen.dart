import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/weather.dart';

const apiKey = 'cb717aa65605c59d6d0dbfc3a8b65fa7';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool isLoading = false; // Перемикач стану для спінера

  @override
  void initState() {
    super.initState();
    // Видалив `getPermission`, якщо це не є необхідним для поточного функціоналу
  }

  // Метод для отримання даних погоди
  void getLocationData() async {
    setState(() {
      isLoading = true; // Почати завантаження
    });

    var weatherData = await WeatherModel().getLocationWeather();

    // Після отримання даних, переходимо на наступний екран
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));

    setState(() {
      isLoading = false; // Закінчити завантаження (необов'язково)
    });
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
        child: isLoading
            ? SpinKitFadingCircle(
          color: Colors.deepPurpleAccent,
          size: 100,
        )
            : TextButton(
          onPressed: () {
            getLocationData(); // Запит на отримання погоди
          },
          child: Text(
            'Get location',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
