import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const kApiKey = 'dbcb16a1f918b30d4e0fb668f1487fbb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double lat;
  double long;

  void getLocationData() async{
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5'
        '/weather?lat=$lat&lon=$long&appid=$kApiKey');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) {return LocationScreen();}));

  }
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }


}
