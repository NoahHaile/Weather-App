// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wefweatherapp/MyDatas.dart';
import 'package:provider/provider.dart';

class CloudLottie extends StatelessWidget {
  double W = 0, H = 0;
  late final myDatas;
  String retMainLottie() {
    if (myDatas.isDay && myDatas.isSun) {
      return "assets/daySun.json";
    } else if (myDatas.isDay && !myDatas.isSun) {
      return "assets/dayRain.json";
    } else if (!myDatas.isDay && myDatas.isSun) {
      return "assets/nightSun.json";
    } else {
      return "assets/nightRain.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    myDatas = Provider.of<MyDatas>(context, listen: true);

    W = MediaQuery.of(context).size.width;
    H = MediaQuery.of(context).size.height * 0.27;
    return Stack(
      children: [
        SizedBox(
          width: W,
          height: H,
          child: Lottie.asset("assets/stars.json", fit: BoxFit.cover),
        ),
        SizedBox(
          width: W,
          height: H,
          child: Lottie.asset("assets/clouds.json", fit: BoxFit.cover),
        ),
        Container(
          width: W,
          height: H,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                blurRadius: 70,
                color: Color.fromARGB(137, 73, 76, 78),
              ),
            ],
          ),
          child: Lottie.asset(retMainLottie()),
        ),
      ],
    );
  }
}
