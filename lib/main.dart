// ignore_for_file: use_key_in_widget_constructors

import 'package:wefweatherapp/MyDatas.dart';
import 'package:wefweatherapp/backBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor:
          Color.fromARGB(255, 0, 0, 0), // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => MyDatas(),
      child: MaterialApp(
        title: "Wef Weather",
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackBoard(),
      ),
    );
  }
}
