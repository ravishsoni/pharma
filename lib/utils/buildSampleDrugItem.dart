import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharma/screens/DrugsDetailsScreen.dart';

Widget buildSampleDrugItem(Color background, Color allotedBackgroundColor,
      String image, String title, BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrugsDetailsScreen(),
                settings: RouteSettings(arguments: {"image": image, "title": title}),
              ),
            );
          },
          child: Material(
              color: background,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 160,
                  ),
                  Positioned(
                    top: 5,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: allotedBackgroundColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text('Alloted: 12 units',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                  ),
                  Positioned(
                      top: 25,
                      left: 25,
                      bottom: 25,
                      right: 25,
                      child: Image.asset(image, height: 8)),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Color(0xff006a6f),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                        ),
                      )),
                ],
              )),
        ));
  }