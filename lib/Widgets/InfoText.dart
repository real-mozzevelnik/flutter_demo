import 'package:flutter/cupertino.dart';

class InfoText extends StatelessWidget {
  final String title;
  final String text;

  const InfoText({
    super.key,
    required this.text,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
         ),
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Text(text,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5)
            )
        ),
      ]
    );
  }
}