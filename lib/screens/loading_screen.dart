import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
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

    getPermission();//запит на дозвіл користуватист жпс
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




// import 'package:clima_flutter/screens/location_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../services/location.dart';
// import '../services/weather.dart';
//
// const apiKey = 'cb717aa65605c59d6d0dbfc3a8b65fa7';
// const kyiv =
//     'https://api.openweathermap.org/data/2.5/weather?lat=50.4791&lon=30.5932&appid=cb717aa65605c59d6d0dbfc3a8b65fa7';
//
// class LoadingScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _LoadingScreenState();
//   }
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     getLocationData();
//     getPermission();
//   }
//
//   void getLocationData() async {
//
//     var weatherData = await WeatherModel().getLocationWeather();
//
//     Navigator.push(context, MaterialPageRoute(builder: (context){
//       return LocationScreen(locationWeather: weatherData,);
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "WEATHER",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: TextButton(
//             onPressed: () {
//               getPermission(); //перевіряє чи є дозвіл на використання геоданних
//               getLocationData(); // запит на місце положення
//             },
//             child: Text(
//               'Get location',
//               style: TextStyle(fontSize: 40),
//             )),
//       ),
//     );
//   }
// }

// child: SpinKitFadingCircle(
// color: Colors.deepPurpleAccent,
// size: 100,
// ),

// child: TextButton(
//     onPressed: () {
//       getPermission(); //перевіряє чи є дозвіл на використання геоданних
//       getLocationData(); // запит на місце положення
//     },
//     child: Text(
//       'Get location',
//       style: TextStyle(fontSize: 40),
//     )),
