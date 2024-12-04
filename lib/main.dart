
import 'package:flutter/material.dart';

import "package:weather_app/activity/loading.dart";
import "package:weather_app/activity/home.dart";



void main() {
  runApp( MaterialApp(
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/loading': (context) => const Loading()
    },
  ));
}

