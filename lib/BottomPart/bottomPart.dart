// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wefweatherapp/MyDatas.dart';

class BottomPart extends StatelessWidget {
  double scrW = 0, scrH = 0;
  @override
  Widget build(BuildContext context) {
    final myDatas = Provider.of<MyDatas>(context, listen: true);

    scrW = MediaQuery.of(context).size.width;
    scrH = MediaQuery.of(context).size.height;
    return SizedBox(
      width: scrW * 0.95,
      height: scrH * 0.20,
      child: Column(
        children: [
          SizedBox(
            height: scrH * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomCards(
                  temp: myDatas.temp1,
                  time: myDatas.time1,
                  isDay: myDatas.isDay),
              BottomCards(
                  temp: myDatas.temp2,
                  time: myDatas.time2,
                  isDay: myDatas.isDay),
              BottomCards(
                  temp: myDatas.temp3,
                  time: myDatas.time3,
                  isDay: myDatas.isDay),
              BottomCards(
                  temp: myDatas.temp4,
                  time: myDatas.time4,
                  isDay: myDatas.isDay),
            ],
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------------

class BottomCards extends StatefulWidget {
  double temp;
  String time;
  bool isDay;
  BottomCards({required this.temp, required this.time, required this.isDay});
  @override
  State<BottomCards> createState() => _BottomCardsState();
}

class _BottomCardsState extends State<BottomCards> {
  double scrW = 0, scrH = 0;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    scrW = MediaQuery.of(context).size.width;
    scrH = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? (widget.isDay
                  ? Colors.blue
                  : const Color.fromARGB(255, 19, 48, 72))
              : Colors.transparent,
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                      color: Colors.blue,
                      blurRadius: 13,
                      blurStyle: BlurStyle.normal)
                ]
              : [const BoxShadow()],
        ),
        width: scrW * 0.20,
        height: scrH * 0.15,
        child: Column(
          children: [
            SizedBox(
              height: scrH * 0.01,
            ),
            Text(
              ("${widget.temp.toStringAsFixed(1)}°"),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: scrH * 0.03,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
                widget.temp > 15
                    ? Icons.wb_sunny_outlined
                    : Icons.cloudy_snowing,
                color: Colors.white,
                size: scrH * 0.06),
            SizedBox(height: scrH * 0.01),
            Text(
              widget.time,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: scrW * 0.032,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
