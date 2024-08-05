import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class CheckBoxProvider extends ChangeNotifier {
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  void idVerifyCheckList (String uid, bool checkvalue, bool isDocVerified){
    print("isDocVerified doc function ===== ${isDocVerified}") ;
      ref.doc(uid).update(
          {
            "isIdVerified": checkvalue,
          }).then((value){
        if(checkvalue == true && isDocVerified == false )
        {

          ref.doc(uid).update(
              {
                "isIdRejected": false,
                // "isIdVerified" : false ,
              }).then((value) {
            const Text('Update');
          }).onError((error, stackTrace) {
            const Text('Error');
          });
          notifyListeners();
        } else if (checkvalue == true && isDocVerified == true ) {
          ref.doc(uid).update(
              {
                "isIdRejected": false,
                "isProfessionalVerified": true
                // "isIdVerified" : false ,


              }).then((value) {
            const Text('Update');
          }).onError((error, stackTrace) {
            const Text('Error');
          });
        }
        else if (checkvalue == false ) {
          ref.doc(uid).update(
              {
                "isProfessionalVerified": false
                // "isIdVerified" : false ,

              }).then((value) {
            const Text('Update');
          }).onError((error, stackTrace) {
            const Text('Error');
          });
        }
        const Text('Update');
      }).onError((error, stackTrace){
        const Text('Error');
      });

      notifyListeners();

  }

  void idRejectCheckList (String uid, bool checkvalue){
    ref.doc(uid).update(
        {
          "isIdRejected": checkvalue,
        }).then((value){
      if(checkvalue == true){
        ref.doc(uid).update(
            {
              // "isIdRejected": false,
              "isIdVerified" : false ,
              "isProfessionalVerified": false,
              "isIdPending": false,
            }).then((value) {
          const Text('Update');
        }).onError((error, stackTrace) {
          const Text('Error');
        });
        notifyListeners();
      }
      const Text('Update');
    }).onError((error, stackTrace){
      const Text('Error');
    });
    notifyListeners();

  }

  void docVerifyCheckList (String uid, bool checkvalue, bool isIdVerified ){
    ref.doc(uid).update(
        {
          "isDocVerified": checkvalue,
        }).then((value){
      if(checkvalue == true && isIdVerified == false){
        ref.doc(uid).update(
            {
              "isDocRejected": false,
              // "isDocVerified" : false ,

            }).then((value) {
          const Text('Update');
        }).onError((error, stackTrace) {
          const Text('Error');
        });
        notifyListeners();
      } else if(checkvalue == true && isIdVerified == true){
        ref.doc(uid).update(
            {
              "isDocRejected": false,
              "isProfessionalVerified": true
                          }).then((value) {
          const Text('Update');
        }).onError((error, stackTrace) {
          const Text('Error');
        });
        notifyListeners();
      }
      else if (checkvalue == false ) {
        ref.doc(uid).update(
            {
              "isProfessionalVerified": false
              // "isIdVerified" : false ,

            }).then((value) {
          const Text('Update');
        }).onError((error, stackTrace) {
          const Text('Error');
        });
      }
      const Text('Update');
    }).onError((error, stackTrace){
      const Text('Error');
    });
    notifyListeners();
  }
  void docRejectedCheckList (String uid, bool checkvalue){
    print("check value---at top ${checkvalue}");
    ref.doc(uid).update (
        {
          "isDocRejected": checkvalue,
        }).then((value)
    {
      print("first value success check");
      if(checkvalue == true){
        ref.doc(uid).update(
            {
              // "isDocRejected": false,
              "isDocVerified" : false ,
              "isDocPending": false,
              "isProfessionalVerified": false,
            }).then((value) {
          print("Second value success check");

          const Text('Update');
        }).onError((error, stackTrace) {
          print("second value error");

          const Text('Error');
        });
        notifyListeners();
      }
      const Text('Update');
    })
        .onError((error, stackTrace){
      const Text('Error');
      print("first value error");

    });
    print("docRejected check list ${checkvalue}");
    print("UId------------${uid}");
    notifyListeners();

  }

  // void docRejectedCheckList (String uid, bool checkvalue){
  //   print("check value---at top ${checkvalue}");
  //   ref.doc(uid).update(
  //       {
  //         "isDocRejected": checkvalue,
  //       }).then((value)
  //   {
  //         print("first value success check");
  //     if(checkvalue == true){
  //       ref.doc(uid).update(
  //           {
  //             // "isDocRejected": false,
  //             "isDocVerified" : false ,
  //             "isDocPending": false,
  //
  //           }).then((value) {
  //         print("Second value success check");
  //
  //         const Text('Update');
  //       }).onError((error, stackTrace) {
  //         print("second value error");
  //
  //         const Text('Error');
  //       });
  //       notifyListeners();
  //     }
  //     const Text('Update');
  //   })
  //       .onError((error, stackTrace){
  //     const Text('Error');
  //     print("first value error");
  //
  //   });
  //   print("docRejected check list ${checkvalue}");
  //   print("UId------------${uid}");
  //   notifyListeners();
  //
  // }



}


