import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/web_main.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class DashBoardCardOne extends StatefulWidget {
  const DashBoardCardOne(
      {super.key,
      required this.cardTitle,
      required this.value1,
      required this.value2,
      required this.total,
      required this.title1,
      required this.title2,
      required this.startColor,
      required this.endColor});
  final String cardTitle;
  final String title1;
  final String title2;
  final int total;
  final int value1;
  final int value2;
  final Color startColor;
  final Color endColor;

  @override
  State<DashBoardCardOne> createState() => _DashBoardCardOneState();
}

class _DashBoardCardOneState extends State<DashBoardCardOne> {
  bool _isHovered = false;
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
            color: AppColor.whiteColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0))),
            //  elevation: 10.0,
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
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      colors: [widget.startColor, widget.endColor],
                    ), // color: color,
                    // borderRadius: BorderRadius.circular(10)
                    //  border: Border.all(color: Colors.white),
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
                    ShowText.detailsText(
                      widget.cardTitle,
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                      color: AppColor.blackColor,
                    ),
                    // Text("Veterinarian",
                    //   style: TextStyle(
                    //       color: AppColor.green,
                    //       fontSize: 25,
                    //       fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: Row(
                        children: [
                          ShowText.detailsText(
                            "Total:",
                            fontWeight: FontWeight.normal,
                            color: AppColor.blackColor,
                          ),
                          // const SizedBox(
                          //   width: 2,
                          // ),
                          ShowText.detailsText("${widget.total}"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: Row(
                        children: [
                          ShowText.detailsText("${widget.title1}:",
                              fontWeight: FontWeight.normal),

                          const SizedBox(
                            width: 5,
                          ),
                          ShowText.detailsText("${widget.value1}"),
                          // Text("20",),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: Row(
                        children: [
                          ShowText.detailsText("${widget.title2}:",
                              fontWeight: FontWeight.normal),

                          // Text("Unverified:",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold
                          //   ),
                          // ),
                          const SizedBox(
                            width: 2,
                          ),
                          ShowText.detailsText("${widget.value2}"),

                          // Text("5",),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
