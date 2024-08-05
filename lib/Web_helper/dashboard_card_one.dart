

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class DashBoardCardOne extends StatelessWidget {
  const DashBoardCardOne({super.key,
    required this.cardTitle,
    required this.value1,
    required this.value2,
    required this.total,
    required this.title1,
    required this.title2
  });
  final String cardTitle;
  final String title1;
  final String title2;
  final int total;
  final int value1;
  final int value2;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: SizedBox(
          height: 150,
          width: 200,
          // decoration: BoxDecoration(
          //   // color: Colors.white
          // ),
          child: Column(
            children: [
              ShowText.detailsText(cardTitle,
                  fontSize: 25,
                  fontWeight:FontWeight.bold,
                color: AppColor.green,
              ),
              // Text("Veterinarian",
              //   style: TextStyle(
              //       color: AppColor.green,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold
              //   ),
              // ),
              const SizedBox(height: 10,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 1.h),
                child:  Row(
                  children: [
                    ShowText.detailsText("Total:", fontWeight: FontWeight.bold),
                    // Text("Total:",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    const SizedBox(width: 5,),
                    ShowText.detailsText("$total"),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 1.h),
                child: Row(
                  children: [
                    ShowText.detailsText("$title1:", fontWeight: FontWeight.bold),

                    // Text("Verified:",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    const SizedBox(width: 5,),
                    ShowText.detailsText("$value1"),
                    // Text("20",),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 1.h),
                child: Row(
                  children: [
                    ShowText.detailsText("$title2:", fontWeight: FontWeight.bold),

                    // Text("Unverified:",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold
                    //   ),
                    // ),
                    const SizedBox(width: 5,),
                    ShowText.detailsText("$value2"),

                    // Text("5",),
                  ],
                ),
              ),
            ],
          )
                ),
    );

  }
}
