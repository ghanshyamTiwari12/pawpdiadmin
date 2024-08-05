// import 'package:flutter/material.dart';
//
// import 'colors.dart';
//
// class ChoiceButton extends StatelessWidget {
//   const ChoiceButton({
//     super.key,
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//     this.height,
//     this.width,
//   });
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;
//   final double? width;
//   final double? height;
//
//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return SizedBox(
//       height: height ?? 50,
//       width: width,
//       child: OutlinedButton
//         (
//         onPressed: onTap,
//         style: OutlinedButton.styleFrom(
//           foregroundColor:
//           isSelected ? AppColor.whiteColor : colorScheme.onSurface,
//           backgroundColor:
//           isSelected ? AppColor.secondary : colorScheme.surface,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           side: BorderSide(width: isSelected ? 0.1 : 0.5),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }
