import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../working/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "kanpur";
  String temp = "";
  String humidity = " ";
  String airSpeed = "";
  String description = "";
  String main = "";
  String icon = "";

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    airSpeed = instance.airSpeed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_val": humidity,
        "air_value": airSpeed,
        "desc_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchData = ModalRoute.of(context)?.settings.arguments ;
    if(searchData != null) {
      String s  = searchData.toString();
      city = s.substring(1,s.length-1);
    }

    startApp(city);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/mLogo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather App",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Made By Shyam Shukla",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 18,
            ),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
