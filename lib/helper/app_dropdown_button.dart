// import 'package:flutter/material.dart';
//
// class AppDropDownButton extends StatelessWidget {
//   const AppDropDownButton({
//     super.key,
//     required this.value,
//     required this.onChange,
//     required this.dropdownItems,
//     this.width,
//     this.height,
//     this.isExpandHeight,
//   });
//   final String? value;
//   final void Function(String?) onChange;
//
//   //final List<DropdownMenuItem<Object>> dropdownItems;
//   final List<String> dropdownItems;
//
//   final double? width;
//   final double? height;
//   final bool? isExpandHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final colorScheme = Theme.of(context).colorScheme;
//
//     return Container(
//       width: width ?? MediaQuery.of(context).size.width / 2 - 20,
//       height: height ?? 50,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: colorScheme.surface,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(),
//       ),
//       child: dropdownItems.length > 1
//           ? DropdownButton(
//               padding: EdgeInsets.zero,
//               menuMaxHeight: isExpandHeight == true ? double.infinity : 200,
//               isExpanded: true,
//               isDense: false,
//               value: value,
//               hint: const Text("Select option"),
//               style: TextStyle(
//                 fontSize: 14,
//                 color: isDarkMode
//                     ? Colors.white
//                     : Colors.black, //colorScheme.onBackground,
//               ),
//               underline: const SizedBox(),
//               borderRadius: BorderRadius.circular(8.0),
//               items: dropdownItems
//                   .map((e) => DropdownMenuItem<String>(
//                         value: e,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             e,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: isDarkMode
//                                   ? Colors.white
//                                   : Colors.black, //colorScheme.onBackground,
//                             ),
//                           ),
//                         ),
//                       ))
//                   .toList(),
//               onChanged: (String? value) {
//                 onChange(value);
//               },
//             )
//           : Padding(
//               padding: const EdgeInsets.symmetric(vertical: 14.0),
//               child: Text(dropdownItems[0]),
//             ),
//     );
//   }
// }
