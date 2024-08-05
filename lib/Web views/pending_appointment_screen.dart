
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Web Api/web_appintment_api.dart';
import '../Web_helper/professional_appointment_detail_card.dart';
import '../Web_helper/text_hepler.dart';

class PendingAppointmentScreen extends StatefulWidget {
  const PendingAppointmentScreen({super.key, required this.userID, required this.isApproved});
  final String userID;
  final bool isApproved;

  @override
  State<PendingAppointmentScreen> createState() => _PendingAppointmentScreenState();
}

class _PendingAppointmentScreenState extends State<PendingAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: widget.isApproved ? AppointmentApi.inProcessAppointmentList(widget.userID)
                    : AppointmentApi.pendingAppointmentList(widget.userID),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError){
                    return const Text('Some Error');
                  }
                  final data = snapshot.data?.docs;
                  if (data!.isNotEmpty)
                  {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5, width: 5,),
                        widget.isApproved ? ShowText.detailsText("Appointment Inprocess: ", fontWeight: FontWeight.bold,)
                       : ShowText.detailsText("Pending Appointment: ", fontWeight: FontWeight.bold,),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 195,
                          width: 600,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                dynamic val = snapshot.data?.docs[index];
                                return ProfessionalAppointmentDetail.pendingAppointmentCard(
                                  val['userName'],
                                  val['appointmentID'],
                                  val['appointmentDate'],
                                  val['appointmentTime'],
                                  val['description'],
                                  widget.isApproved,
                                );
                              }
                          ),
                        ),
                      ],
                    );
                  }
                  else {
                    return const SizedBox();
                  }
                }
            ),
          ],
        ),
      ),
    );

  }
}
