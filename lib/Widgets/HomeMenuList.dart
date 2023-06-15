import 'package:flutter/material.dart';

import 'package:untitled1/Widgets/MenuButton.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            MenuButton(
              text: "Change Password",
            ),
            MenuButton(
              text: "Settings",
            ),
            MenuButton(
              text: "Exit",
            ),
            MenuButton(
              color: Colors.redAccent,
              text: "Delete Account",
            )
          ],
        )
    );
  }
}