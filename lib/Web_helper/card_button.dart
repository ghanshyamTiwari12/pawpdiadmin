
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({ super.key, required this.icons, required this.color});
  final IconData icons;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0), //<-- SEE HERE
      ),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(color: color,
            borderRadius: const BorderRadius.all(Radius.circular(22))

        ),
        child:  Center(
            child: Icon(icons)
        ),
      ),
    );

  }
}
