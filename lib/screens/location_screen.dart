import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';
import 'sity_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      '32°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// var weatherDescription = decodeData['weather'][0]['description']; //weather[0].description
// var temp = decodeData['main']['temp']; //main.temp
// var country = decodeData['sys']['country']; //sys.country
// var nameStreet = decodeData['name']; //name