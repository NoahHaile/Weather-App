// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, unnecessary_this

import 'package:flutter/material.dart';
import 'package:wefweatherapp/MyDatas.dart';
import 'package:provider/provider.dart';
import 'cloudLottie.dart';
import 'tempAndDate.dart';
import 'topBar.dart';

class TopPart extends StatelessWidget {
  double scrW = 0, scrH = 0;
  @override
  Widget build(BuildContext context) {
    final myDatas = Provider.of<MyDatas>(context, listen: true);

    scrW = MediaQuery.of(context).size.width;
    scrH = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: myDatas.isDay
            ? const LinearGradient(colors: [
                Color.fromARGB(255, 149, 185, 240),
                Color.fromARGB(255, 59, 53, 173)
              ], begin: Alignment.topCenter, end: Alignment.bottomLeft)
            : const LinearGradient(colors: [
                Color.fromARGB(255, 29, 44, 66),
                Color.fromARGB(255, 17, 16, 49)
              ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
        borderRadius: BorderRadius.circular(45),
      ),
      width: scrW * 0.95,
      height: scrH * 0.75,
      child: RefreshIndicator(
        onRefresh: () async {
          myDatas.setVariablesWeatherData();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox.fromSize(
            child: Column(
              children: [
                TopBar(),
                CloudLottie(),
                TempAndDate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
