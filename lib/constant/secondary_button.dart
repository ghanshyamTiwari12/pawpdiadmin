// import 'package:flutter/material.dart';
// import 'colors.dart';
//
// class SecondaryButton extends StatelessWidget {
//   const SecondaryButton({
//     super.key,
//     this.height,
//     this.width,
//     required this.child,
//     required this.onTap,
//   });
//
//   final double? height;
//   final double? width;
//   final Widget child;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,// ?? MediaQuery.of(context).size.width / 2 - 20,
//       height: height ?? 50,
//       child: OutlinedButton(
//         onPressed: onTap,
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           elevation: 5,
//           foregroundColor: AppColor.blackColor,
//           backgroundColor: Colors.grey.shade200,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//         ),
//         child: child,
//       ),
//     );
//   }
// }
