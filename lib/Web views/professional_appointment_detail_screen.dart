import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/pending_appointment_screen.dart';
import 'package:provider/provider.dart';
import '../Web Api/web_appintment_api.dart';
import '../Web_helper/professional_appointment_detail_card.dart';
import '../Web_helper/text_hepler.dart';
import 'appointment_list_body.dart';

class ProfessionalDetailScreen extends StatefulWidget {
  const ProfessionalDetailScreen({super.key, required this.userID});
  final String userID;

  @override
  State<ProfessionalDetailScreen> createState() => _ProfessionalDetailScreenState();
}

class _ProfessionalDetailScreenState extends State<ProfessionalDetailScreen> {
  int _totalAppointment = 0;
  int _allInProcessAppointment = 0;
  int _allCompletedAppointment = 0;
  int _allCancelledAppointment = 0 ;
  num _average = 0;
  int _pendingAppointment = 0;

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
    var width = size.width;
    AppointmentApi appointmentProvider = Provider.of<AppointmentApi>(context);
    _totalAppointment = appointmentProvider.totalProfessionalAppointment;
    _allInProcessAppointment = appointmentProvider.totalInProcessOrder;
    _allCompletedAppointment = appointmentProvider.totalCompletedOrder;
    _allCancelledAppointment = appointmentProvider.totalCancelOrder;
    _average = appointmentProvider.averageRating;
        _pendingAppointment = _totalAppointment - (_allInProcessAppointment + _allCompletedAppointment + _allCancelledAppointment);

    return _totalAppointment != 0 ?
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            ProfessionalAppointmentDetail.appointmentDetailCard(
                width,
                _totalAppointment.toString(),
                _pendingAppointment.toString(),
                _allInProcessAppointment.toString(),
                _allCompletedAppointment.toString(),
                _allCancelledAppointment.toString(),
                _average.toStringAsFixed(1)
            ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },),
          child: SingleChildScrollView(
            child: Column(children: [
              PendingAppointmentScreen( userID: widget.userID, isApproved: false,),
              PendingAppointmentScreen( userID: widget.userID, isApproved: true),
              AppointmentListBody(userId: widget.userID,
                isProfessional: true,
                title: 'Completed Appointment', cancel: false, ),
              AppointmentListBody(userId: widget.userID,
                isProfessional: true,
                title: 'Cancelled Appointment', cancel: true,),
            ],),
          ),
        )
      ],
    ) :
    ShowText.detailsText("No Appointment till now ",
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 18
        );
  }
}
