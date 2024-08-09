import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class DashBoardCardTwo extends StatefulWidget {
  const DashBoardCardTwo(
      {super.key,
      required this.cardTitle,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.title4,
      required this.title5,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.value4,
      required this.value5,
      required this.startColor,
      required this.endColor});
  final String cardTitle;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String title5;
  final int value1;
  final int value2;
  final int value3;
  final int value4;
  final int value5;
  final Color startColor;
  final Color endColor;

  @override
  State<DashBoardCardTwo> createState() => _DashBoardCardTwoState();
}

class _DashBoardCardTwoState extends State<DashBoardCardTwo> {
  bool _isHovered = false;
  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.all(10),
            child: Card(
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0))),
              elevation: 3.0,
              // color: color,
              child: Container(
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                      boxShadow: _isHovered
                          ? [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ]
                          : [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                      // color: AppColor.whiteColor,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [widget.startColor, widget.endColor],
                      ), // color: color,
                      // borderRadius: BorderRadius.circular(10)
                      // border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      ShowText.detailsText(widget.cardTitle,
                          color: AppColor.blackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      cardText(widget.title1, widget.value1),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      cardText(widget.title2, widget.value2),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      cardText(widget.title3, widget.value3),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      // cardText(widget.title4, widget.value4),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      // cardText(widget.title5, widget.value5),
                    ],
                  )),
            )));
  }

  Widget cardText(String title, int value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        children: [
          ShowText.detailsText(title, fontWeight: FontWeight.normal),
          const SizedBox(
            width: 5,
          ),
          ShowText.detailsText(
            "$value",
          ),
        ],
      ),
    );
  }
}
