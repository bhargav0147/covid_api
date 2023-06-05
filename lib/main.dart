import 'package:covid_api/covid/view/home_screen.dart';
import 'package:covid_api/covid/view/info_screen.dart';
import 'package:covid_api/covid/view/search_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'covid/provider/covid_provider.dart';
void main()
{
  runApp(DevicePreview(
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CovidProvider(),)
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => HomeScreen(),
            'info':(context) => InfoScreen(),
            'search':(context) => SearchScreen(),
          },
        )),
  ));
}