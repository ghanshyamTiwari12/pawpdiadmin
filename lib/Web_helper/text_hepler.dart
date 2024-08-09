import 'package:flutter/material.dart';

class ShowText {
  static Widget detailsText(
    String text, {
    double fontSize = 12.0,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          fontSize: fontSize),
    );
  }
}
