//
//
// import 'package:date_time_format/date_time_format.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../Web_helper/commonShareWidget.dart';
//
// class DateTimeProvider extends ChangeNotifier{
//   String? _selectedDate;
//   String? _selectedTime;
//   DateTime? _scheduleTime;
//   DateTime? dateTime;
//   String? get selectedDate => _selectedDate;
//   String? get selectedTime => _selectedTime;
//   DateTime? get scheduledTime => _scheduleTime;
//
//   dateFunction(String date){
//     _selectedDate = date;
//     if (kDebugMode) {
//       print("Date in provider----$date");
//     }
//     notifyListeners();
//   }
//
//   timeFunction(String time){
//     _selectedTime = time;
//     notifyListeners();
//   }
//
//   clearFunction(String selectedDate, String selectedTime){
//     _selectedTime = null;
//     _selectedDate = null;
//     notifyListeners();
//   }
//
//   Future<void> selectDate(context) async {
//     dateTime = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1920),
//       lastDate: DateTime(2080),
//     );
//     if (dateTime != null) {
//       if((dateTime?.year ?? DateTime.now().year) < DateTime.now().year){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Year", color: Colors.black);
//       } else if ((dateTime?.year == DateTime.now().year)
//           && ((dateTime?.day ?? DateTime.now().day) < DateTime.now().day)){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Date", color: Colors.black);
//       } else {
//         _selectedDate = dateTime?.format();
//         Provider.of<DateTimeProvider>(context, listen: false).dateFunction(_selectedDate!);
//         _scheduleTime = dateTime;
//
//       }
//
//       notifyListeners();
//     }
//   }
//
//   Future<void> selectTime(context) async {
//     TimeOfDay? timeOfDay = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (timeOfDay != null && dateTime != null)
//     {
//       if( ((dateTime?.day ?? DateTime.now().day)  <= DateTime.now().day ) && timeOfDay.hour < TimeOfDay.now().hour )
//       {
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Time", color: Colors.black);
//       }
//       else if(((dateTime?.day ?? DateTime.now().day)  == DateTime.now().day )
//           && (timeOfDay.hour == TimeOfDay.now().hour)
//           && (timeOfDay.minute <= TimeOfDay.now().minute)){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Time", color: Colors.black);
//       }
//       else if((timeOfDay.hour == TimeOfDay.now().hour)
//           && (timeOfDay.minute <= TimeOfDay.now().minute)){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Time", color: Colors.black);
//       }
//       else{
//         String hour = timeOfDay.hour.toString().length != 2
//             ? "0${timeOfDay.hour}"
//             : timeOfDay.hour.toString();
//         String minute = timeOfDay.minute.toString().length != 2
//             ? "0${timeOfDay.minute}"
//             : timeOfDay.minute.toString();
//
//         _selectedTime = "$hour:$minute:00";
//         Provider.of<DateTimeProvider>(context, listen: false).timeFunction(_selectedTime!);
//       }
//
//       // _scheduleTime = timeOfDay;
//
//       // _selectedDate =
//       // "${selectedDate?.split("T").first}T$selectedTime${selectedDate?.substring(19)}";
//       // await ApiParamsDb.saveDateTime(selectedDate!);
//       if (kDebugMode) {
//         print("====Time pick Time: $_scheduleTime");
//         print("====Time pick date: $_selectedDate");
//
//         // debugPrint(selectedDate);
//
//       }
//       notifyListeners();
//     }
//     else {
//       CommonShareWidget.showColorFlushBar(
//           context: context,
//           duration: 2,
//           message: "Please select Date first", color: Colors.black);
//     }
//     notifyListeners();
//
//   }
//
//   Future<void> selecMilestonetDate(context) async {
//     DateTime? dateTime = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1920),
//       lastDate: DateTime(2080),
//     );
//     if (dateTime != null) {
//          _selectedDate = dateTime.format();
//                  Provider.of<DateTimeProvider>(context, listen: false).dateFunction(_selectedDate!);
//         _scheduleTime = dateTime;
//         if (kDebugMode) {
//           print("====select Date pick: $_selectedDate");
//           print("====dateTime in select Date pick: $dateTime");
//
//         }
//         notifyListeners();
//     }
//   }
//
//   Future<void> selectPetDobDate(context) async {
//     dateTime = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1920),
//       lastDate: DateTime(2080),
//     );
//     if (dateTime != null) {
//       var age = DateTime.now().year - (dateTime!.year) ;
//
//       if(age > 20 || age < 0){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Year", color: Colors.black);
//       } else if ((dateTime?.year == DateTime.now().year)
//           && ((dateTime?.day ?? DateTime.now().day) > DateTime.now().day)){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Date", color: Colors.black);
//       } else if ((dateTime?.year == DateTime.now().year)
//           && ((dateTime?.month ?? DateTime.now().month) > DateTime.now().month)){
//         CommonShareWidget.showColorFlushBar(
//             context: context,
//             duration: 2,
//             message: "Please select correct Month", color: Colors.black);
//       }
//
//       else {
//         _selectedDate = dateTime?.format();
//         Provider.of<DateTimeProvider>(context, listen: false).dateFunction(_selectedDate!);
//         _scheduleTime = dateTime;
//       }
//
//       notifyListeners();
//     }
//   }
//
//
// }