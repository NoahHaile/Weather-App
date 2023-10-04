// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, file_names

import 'package:google_fonts/google_fonts.dart';
import 'package:wefweatherapp/MyDatas.dart';
import 'package:wefweatherapp/TopPart/searchCity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  double scrW = 0, scrH = 0;

  @override
  Widget build(BuildContext context) {
    final myDatas = Provider.of<MyDatas>(context, listen: true);

    scrW = MediaQuery.of(context).size.width;
    scrH = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.blur_circular_outlined),
            color: Colors.white,
            iconSize: scrW * 0.10,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SearchCity();
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent.withOpacity(0.2),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: scrW * 0.08,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    SizedBox(height: scrH * 0.02),
                    Text(
                      myDatas.location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: scrW * 0.06,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          myDatas.countryName,
                          style: GoogleFonts.ptSerif(
                            color: Colors.white,
                            fontSize: scrW * 0.04,
                          ),
                        ),
                        SizedBox(width: scrW * 0.016),
                        Image.network(
                          'https://flagsapi.com/${myDatas.countryCode}/flat/64.png',
                          width: scrW * 0.06,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
              size: scrW * 0.08,
            ),
          ),
        )
      ],
    );
  }
}
