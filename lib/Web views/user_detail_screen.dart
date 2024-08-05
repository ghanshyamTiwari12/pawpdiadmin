import 'package:flutter/material.dart';
import 'package:petfindernetwork/Web%20views/registered_pet_body.dart';
import 'package:petfindernetwork/Web%20views/user_lost_pet_body.dart';

import 'appointment_list_body.dart';

class UserDetailsScreen extends StatefulWidget {
   const UserDetailsScreen({super.key, required this.userID});
   final String userID;
   @override
   State<UserDetailsScreen> createState() => _UserDetailsScreenState();
 }
 
 class _UserDetailsScreenState extends State<UserDetailsScreen> {
   @override
   Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
     var width = size.width;
     return SingleChildScrollView(
       child: Column(
         // mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           RegisteredPetBody(userId: widget.userID),
           UserPetBody(userId: widget.userID, lostPet: true,),
           UserPetBody(userId: widget.userID, lostPet: false,),
           AppointmentListBody(userId: widget.userID,
             isProfessional: false,
             title: 'Appointment',
             cancel: false,),

         ],
       ),
     );
   }
 }
 