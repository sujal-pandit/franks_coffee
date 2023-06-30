import 'package:flutter/material.dart';

class IconsContainer extends StatelessWidget {
  final bool istapped;
  final String Icon;
  final double bottom;

  IconsContainer({
    super.key,
    this.istapped = false,
    this.Icon = "coffee",
    this.bottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 23, bottom: bottom),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: istapped
              ? Border.all(color: Colors.black, width: 2)
              : Border.all(color: Colors.transparent),
        ),
        width: 80,
        height: 80,
        child: Column(
          children: [
            Center(
                child: Image.asset('assets/images/${Icon}.png',
                    width: 45.0, height: 50.0)),
            Text(
              Icon,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
