import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class worker
{
    String location = "h";
    worker({required this.location});

   String temp = "";
   String humidity =" ";
   String airSpeed = "";
   String description ="";
   String main ="";
   String icon = "";


  Future <void> getData() async
  {
    Uri url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c11b75ed9ee9cfef47f124c75ef48c13");
    Response response = await http.get(url);
    // print(response.body); it is used to print whole json data
    if (response.statusCode == 200) {
      // If the server returns an OK response, parse the JSON
      final data = jsonDecode(response.body);

    // getting temp
    Map tempData = data["main"];
    double getTemp = tempData["temp"]-273.15;
    String getHumidity = tempData["humidity"].toString();

    // getting  wind speed
    Map wind = data["wind"];
    String getAirSpeed = wind["speed"].toString();


    // getting description
    List weather = data["weather"];
    Map weatherData = weather[0];
    String getMain = weatherData["main"];
    String getDesc = weatherData["description"];
    String getIcon = weatherData["icon"];


    // assigning values

    temp = getTemp.toString();
    humidity = getHumidity;
    airSpeed = getAirSpeed;
    description = getDesc;
    main = getMain.toString();
    icon = getIcon.toString();

    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      temp ="NA";
      humidity = "NA";
      airSpeed = "NA";
      description ="Cant Find Data";
      main = "NA";
      icon = "09d";
    }
  }


}
