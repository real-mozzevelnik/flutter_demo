import 'package:flutter/material.dart';

import 'package:untitled1/Widgets/InfoText.dart';
import 'package:untitled1/Widgets/HomeMenuList.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_sharp,
                      size: 100.0,
                    ),
                    Expanded(
                      child: Column(
                          children: <Widget>[
                            InfoText(
                                title: "Name Lastname",
                                text: "Name Lastname"
                            ),
                            Divider(
                                color: Colors.white,
                                thickness: 1,
                                endIndent: 10
                            ),
                            InfoText(
                                title: "Phone Number",
                                text: "+55553535676"
                            )
                          ]
                      ),
                    ),
                  ],
                ),
                HomeMenuList()
              ]
          ),
        )
    );
  }
}