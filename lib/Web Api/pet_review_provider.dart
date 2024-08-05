

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PetReviewProvider extends ChangeNotifier{
  CollectionReference ref = FirebaseFirestore.instance.collection('lfPets');

void petReview(String documentId){

  ref.doc(documentId).update(
  {
  'review': true,
  }
  ).then((value){
  const Text('Update');
  }).onError((error, stackTrace){
  const Text('Error');
  });
  notifyListeners();
}


  void petReviewCancel(String documentId){

    ref.doc(documentId).update(
        {
          'review': false,
        }
    ).then((value){
      const Text('Update');
    }).onError((error, stackTrace){
      const Text('Error');
    });
    notifyListeners();
  }

}