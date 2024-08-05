
import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

class DashBoardCardTwo extends StatelessWidget {
  const DashBoardCardTwo({super.key,
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
  });
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



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: SizedBox(
          height: 200,
          width: 200,
          // decoration: BoxDecoration(
          //   // color: Colors.white
          // ),
          child:
          Column(
            children: [
              ShowText.detailsText(
                cardTitle,
                color: AppColor.green,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              const SizedBox(height: 10,),
              cardText(title1, value1),
              const SizedBox(height: 5,),
              cardText(title2, value2),
              const SizedBox(height: 5,),
              cardText(title3, value3),
              const SizedBox(height: 5,),
              cardText(title4, value4),
              const SizedBox(height: 5,),
              cardText(title5, value5),
            ],
          )
      ),
    );
  }

  Widget cardText(String title, int value ){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        children: [
          ShowText.detailsText(
              title,
              fontWeight: FontWeight.bold
          ),
          const SizedBox(width: 5,),
          ShowText.detailsText(
            "$value",
          ),
        ],
      ),
    );
  }
}
