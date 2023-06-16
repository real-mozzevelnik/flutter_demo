import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  final Color color;
  final String text;
  final double width;

  const MenuButton({
    super.key,
    this.color = Colors.deepPurple,
    this.width = 500,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(7.0),
        child: FilledButton.tonal(

          onPressed: () {},
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) =>
                  color.withOpacity(0.6)),
              fixedSize: MaterialStateProperty.resolveWith((states) =>
                  Size(width, double.infinity))
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white
            ),
          ),
        )
    );
  }
}