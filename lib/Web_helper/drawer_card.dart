
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Web Api/user_selected_provider.dart';
import 'colors.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.icon, required this.text, this.color, this.itemNumber, this.callback });
   final IconData icon;
   final String text;
   final Color? color;
   final int? itemNumber;
  final VoidCallback ? callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.lightGreen,
        ),
        title: Text(
          text,
          style: TextStyle(color: AppColor.blackColor),
        ),
        // onTap: callback
      ),
    );

  }
}



class SelectionCard {

  static Widget menuCard(
  context,
  IconData icon,
  String text,
  // Color? color,
  int? itemNumber,
  VoidCallback ? callback


  ){
    UserSelected userSelected = Provider.of<UserSelected>(context);
    int _selectedIndex = userSelected.selectedIndex;
    return InkWell(
      onTap: callback,
      child: Card(
        elevation: 3.0,
        color: _selectedIndex == itemNumber ? Colors.black38 : AppColor.whiteSnowColor,
        child: ListTile(
          leading: Icon(
            icon,
            color: AppColor.lightGreen,
          ),
          title: Text(
            text,
            style: TextStyle(color: AppColor.blackColor),
          ),
          // onTap: callback
        ),
      ),
    );

  }

}
