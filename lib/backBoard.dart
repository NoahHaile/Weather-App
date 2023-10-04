// ignore_for_file: file_names, use_key_in_widget_constructors

import 'dart:convert';
import 'package:wefweatherapp/BottomPart/bottomPart.dart';
import 'package:wefweatherapp/ListofCities.dart';
import 'package:flutter/material.dart';
import 'TopPart/topPart.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BackBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 5, 8, 26),
      child: Column(
        children: [
          TopPart(),
          BottomPart(),
        ],
      ),
    );
  }
}
