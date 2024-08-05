import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web_helper/text_hepler.dart';

import 'colors.dart';
import 'date_time.dart';

class AppointmentListCard{

 static Widget appointmentList(
      String serviceProviderName,
      String serviceType,
      String appointmentID,
      String  description,
      String appointmentDate,
      String appointmentTime,
      bool isOrderCompleted,
      bool rating1 ,
      bool rating2,
      bool rating3,
      bool rating4,
      bool rating5,
      bool orderCancel,
      bool orderApprove,
      {
        String cancelReason = '',
      }

      )
  {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10.0,
          right: 10.0, bottom: 5.0),
      child: Card(
        color: isOrderCompleted ? AppColor.orange : (orderCancel ? Colors.grey : AppColor.green),
        // color: AppColor.orange.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      ShowText.detailsText("Name: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(serviceProviderName.toString())),
                    ],
                  ),

                  Row(
                    children: [

                      ShowText.detailsText("Service: ", fontWeight: FontWeight.bold,),
                      ShowText.detailsText(serviceType.toString()),
                    ],
                  ),

                  Row(
                    children: [
                      ShowText.detailsText("Appointment ID: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(appointmentID.toString())),
                    ],
                  ),
                  Row(
                    children: [
                      ShowText.detailsText("Cause: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(description.toString())),
                    ],
                  ),
                  Row(
                    children: [
                      ShowText.detailsText("Date: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(DateTimeClass.stringToddMMyyyy(appointmentDate) ?? '')),
                    ],
                  ),
                  Row(
                    children: [
                      ShowText.detailsText("Time: ", fontWeight: FontWeight.bold,),
                      Expanded(child: ShowText.detailsText(DateTimeClass.timeToHHMMA(appointmentTime) ?? '')),
                    ],
                  ),
                  Row(
                      children: [
                        ShowText.detailsText("Status: ", fontWeight: FontWeight.bold,),

                        if(orderApprove == false && orderCancel == false )...[
                          Expanded(child: ShowText.detailsText("Pending")),
                        ]  else if(orderApprove == false
                            && orderCancel == true)...[
                          Expanded(child: ShowText.detailsText("Canceled")),
                        ]
                        else if(isOrderCompleted == true)...[
                            Expanded(child: ShowText.detailsText("Completed")),

                          ] else...[
                            Expanded(child: ShowText.detailsText("Approved")),

                          ]
                      ]

                  ),
                  if(orderApprove == false
                      && orderCancel == true)...[
                    Row(
                      children: [
                        ShowText.detailsText("Reason: ", fontWeight: FontWeight.bold,),
                        Expanded(child: ShowText.detailsText(cancelReason.toString())),
                      ],
                    ),

                  ],
                  Row(
                    children: [
                      if(isOrderCompleted == true)...[
                        ShowText.detailsText("Rating: ", fontWeight: FontWeight.bold,),
                        (rating1)  ?
                        Icon(Icons.star,
                          color: AppColor.green,
                          size: 15.0,
                        ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 15.0,),
                        (rating2)  ?
                        Icon(Icons.star,
                          color: AppColor.green,
                          size: 15.0,
                        ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 15.0,),
                        (rating3)  ?
                        Icon(Icons.star,
                          color: AppColor.green,
                          size: 15.0,
                        ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 15.0,),
                        (rating4)  ?
                        Icon(Icons.star,
                          color: AppColor.green,
                          size: 15.0,
                        ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 15.0,),
                        (rating5)  ?
                        Icon(Icons.star,
                          color: AppColor.green,
                          size: 15.0,
                        ) : const Icon(Icons.star_outline_sharp, color: Colors.black, size: 15.0,),
                      ]
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