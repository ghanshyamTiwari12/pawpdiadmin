
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Web Api/web_appintment_api.dart';
import '../Web_helper/appointment_list_card.dart';
import '../Web_helper/text_hepler.dart';


class AppointmentListBody extends StatefulWidget {
  const AppointmentListBody({super.key,
    required this.userId,
    required this.isProfessional,
    required this.title, required this.cancel});
  final String userId;
  final bool isProfessional;
  final String title;
  final bool cancel;
  @override
  State<AppointmentListBody> createState() => _AppointmentListBodyState();
}

class _AppointmentListBodyState extends State<AppointmentListBody> {
  @override
  Widget build(BuildContext context) {
    return  ScrollConfiguration(
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
                stream: widget.isProfessional ?
                (widget.cancel ? AppointmentApi.cancelAppointmentList(widget.userId)
                    :
                    AppointmentApi.completedAppointmentList(widget.userId)
                ) :
                AppointmentApi.userAppointmentList(widget.userId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return const Text('Some Error');
                  final data = snapshot.data?.docs;
                  if (data!.isNotEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10, width: 5,),
                        ShowText.detailsText(widget.title, fontWeight: FontWeight.bold,),
                        //  Text(widget.title,
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //     // color: Colors.blueAccent
                        //   ),
                        // ) ,
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 230,
                          width: 600,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // shrinkWrap: true,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: (context, index) {
                                dynamic val = snapshot.data?.docs[index];
                                // String documentID = val['docID'].toString();
                                return AppointmentListCard.appointmentList(
                                  val['serviceProviderName'],
                                  val['serviceType'],
                                  val['appointmentID'],
                                  val['description'],
                                  val['appointmentDate'],
                                  val['appointmentTime'],
                                  val['isOrderCompleted'],
                                  val['rating1'] ,
                                  val['rating2'] ,
                                  val['rating3'] ,
                                  val['rating4'] ,
                                  val['rating5'] ,
                                  val['orderCancel'],
                                  val['orderApprove'],
                                  cancelReason:  val['cancelReason']
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
