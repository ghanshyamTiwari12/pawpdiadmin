import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';
import 'colors.dart';
import 'date_time.dart';

class ProfessionalAppointmentDetail{
  static Widget appointmentDetailCard(
      double width,
      String totalAppointment,
      String pendingAppointment,
      String allInProcessAppointment,
      String allCompletedAppointment,
      String allCancelledAppointment,
      String average
      )
  {
    return Card(
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
            height: 170,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ShowText.detailsText("Total Appointment: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(totalAppointment),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    ShowText.detailsText("Pending Appointment: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(pendingAppointment),
                  ],
                ),
                const SizedBox(height: 5,),

                Row(
                  children: [
                    ShowText.detailsText("InProcess Appointment: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(allInProcessAppointment),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    ShowText.detailsText("Completed Appointment: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(allCompletedAppointment),
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    ShowText.detailsText("Cancelled Appointment: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(allCancelledAppointment),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    ShowText.detailsText("Review: ", fontWeight: FontWeight.bold,),
                    ShowText.detailsText(average),
                    const Icon(Icons.star,
                      color: Colors.orange,
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  static Widget pendingAppointmentCard(
      String userName,
      String appointmentID,
      String appointmentDate,
      String appointmentTime,
      String description,
      bool isApproved,
      )
  {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0,
          right: 10.0, bottom: 5.0),
      child: Card(
        color: isApproved ? AppColor.orange : AppColor.green,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
              height: 60,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ShowText.detailsText("Name: ", fontWeight: FontWeight.bold,),
                      ShowText.detailsText(userName),
                    ],
                  ),
                  Row(
                    children: [
                      ShowText.detailsText("Appointment ID: ", fontWeight: FontWeight.bold,),
                      ShowText.detailsText(appointmentID),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      ShowText.detailsText("Appointment Date: ", fontWeight: FontWeight.bold,),
                      ShowText.detailsText(DateTimeClass.stringToddMMyyyy(appointmentDate) ?? '' ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      ShowText.detailsText("Appointment Time: ", fontWeight: FontWeight.bold,),
                      ShowText.detailsText(DateTimeClass.timeToHHMMA(appointmentTime) ?? '' ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      ShowText.detailsText("Cause: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(description)),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      ShowText.detailsText("Status: ", fontWeight: FontWeight.bold,),
                      isApproved ? ShowText.detailsText("Approved"): ShowText.detailsText("Pending"),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}