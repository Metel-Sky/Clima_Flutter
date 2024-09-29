import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      //_________________________________Робить запит на дозвіл користуватись ЖПС
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );
      //-------------------------------------------------------------------------

      //----------------Запит координат ЖПС
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

void getPermission() async {
  //LocationPermission permission = await Geolocator.requestPermission();
}
