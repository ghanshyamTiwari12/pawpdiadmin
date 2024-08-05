import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;


class LoginSignupRepo extends ChangeNotifier {
  bool _userDeleted = false;
  bool get userDeleted => _userDeleted;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> getUser() async {
    return _auth.currentUser;
  }

  // wrapping the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  Future<User?> createUser(
      {String? firstName,
      String? lastName,
      required String email,
      required String password}) async {
    try {
      var u = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
      return u.user;
    } on FirebaseAuthException {
      // throw new FirebaseAuthException(code: e.code, message: e.message);
      rethrow;
    }
  }

  Future<User?> signIn({required email, required password}) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // var result = await _auth.signInWithCredential(
      //     email);
      notifyListeners();
      return result.user;
    } on FirebaseAuthException {
      // throw new FirebaseAuthException(code: e.code, message: e.message);
      rethrow;
    }
  }



  // Future<String> uploadImage(File image, String uid) async {
  //   String fileName = p.basename(image.path);
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child(uid)
  //       .child(fileName + DateTime.now().millisecondsSinceEpoch.toString());
  //   UploadTask uploadTask = ref.putFile(image);
  //   if (kDebugMode) {
  //     print("uploadTask:--${uploadTask.toString()}");
  //   }
  //   var downUrl = await (await uploadTask).ref.getDownloadURL();
  //   if (kDebugMode) {
  //     print("download url:--${downUrl.toString()}");
  //   }
  //   return downUrl.toString();
  // }
  //
  //

  // Future<List<String>> uploadPetImages({required List<File> assets, required id}) async {
  //   List<String> uploadUrls = [];
  //
  //   await Future.wait(
  //       assets.map((File asset) async {
  //         // Utf* byteData = await asset.readAsBytes();
  //         Uint8List imageData = asset.readAsBytesSync();
  //
  //         final fileName = basename(asset.path).split('.').first;
  //
  //         Reference reference = FirebaseStorage.instance.ref().child(id).child(
  //             fileName + DateTime.now().millisecondsSinceEpoch.toString());
  //         UploadTask uploadTask = reference.putData(imageData);
  //         TaskSnapshot storageTaskSnapshot;
  //
  //         TaskSnapshot snapshot = await uploadTask;
  //         if (snapshot.state != TaskState.error) {
  //           storageTaskSnapshot = snapshot;
  //           final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
  //           uploadUrls.add(downloadUrl);
  //
  //           // print('Upload success');
  //         } else {
  //           //print('Error from image repo ${snapshot.error.toString()}');
  //           throw ('This file is not an image');
  //         }
  //       }),
  //       eagerError: true,
  //       cleanUp: (dynamic _) {
  //         debugPrint('eager cleaned up');
  //       });
  //
  //   return uploadUrls;
  // }

  // static registeredPetDelete(userId)  {
  //   FirebaseFirestore.instance.collection('registeredPet').where("userUid", isEqualTo: userId).get().then((value) async =>
  //   {
  //     if(value.docs.isNotEmpty){
  //
  //       for(var i = 0 ; i < value.docs.length ; i++  ){
  //    await DigitalDiaryApi.userRegisteredPetDelete( value.docs[i].id, userId)
  //   }
  //       }
  //   }
  //   );
  // }

  // static getMyPets(userId)  {
  //   FirebaseFirestore.instance.collection('lfPets').where("posted_id", isEqualTo: userId).get().then((value) async =>
  //   {
  //     if(value.docs.isNotEmpty){
  //       for(var i = 0 ; i < value.docs.length ; i++  ){
  //     await FirebaseFirestore.instance.collection("lfPets").doc(value.docs[i].id).delete()
  //       }
  //     }
  //   }
  //   );
  // }

  // static userAppointmentList(userId)  {
  //   FirebaseFirestore.instance.collection('appointment').
  //   where("userID", isEqualTo: userId)
  //       .where("isOrderCompleted", isEqualTo: false).get().then((value) async =>
  //   {
  //     if(value.docs.isNotEmpty) {
  //       for(var i = 0 ; i < value.docs.length ; i++  ){
  //         await FirebaseFirestore.instance.collection("appointment").doc(value.docs[i].id).delete()
  //       }
  //     }
  //   }
  //   );
  // }

    // Future deleteUserPhoneAuth(AuthCredential credentials, context) async {
    // try{
    //   Provider.of<LoaderProvider>(context, listen: false).loading(true);
    //   User? user = FirebaseAuth.instance.currentUser;
    //   UserCredential? result =
    //   await user?.reauthenticateWithCredential(credentials);
    //   String? uid = await result?.user?.uid;
    //   await userAppointmentList(uid);
    //   // await registeredPetDelete(uid);
    //   await getMyPets(uid);
    //   await FirebaseFirestore.instance.collection("users").doc(uid).delete();
    //   await result?.user?.delete();
    //   Provider.of<LoaderProvider>(context, listen: false).loading(false);
    //   Provider.of<LoginSignupRepo>(context,
    //       listen: false)
    //       .logout()
    //       .then((value) {
    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
    //     const WebLogin() ), (route) => false);
    //   });
    //   notifyListeners();
    // } catch(e) {
    //   Provider.of<LoaderProvider>(context, listen: false).loading(false);
    //  // throw new FirebaseAuthException(code: e.code, message: e.message);
    //   await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
    //   const WebLogin() ), (route) => false);
    //   rethrow;
    // }
    //
    // }

  // Future deleteUser(String email, String password, context) async {
  //   try{
  //     Provider.of<LoaderProvider>(context, listen: false).loading(true);
  //     User? user = await FirebaseAuth.instance.currentUser;
  //     AuthCredential credentials = await EmailAuthProvider.credential(email: email, password: password);
  //     UserCredential? result = await user?.reauthenticateWithCredential(credentials);
  //     String? uid = await result?.user?.uid;
  //     await userAppointmentList(uid);
  //     // await registeredPetDelete(uid);
  //     await getMyPets(uid);
  //     await FirebaseFirestore.instance.collection("users").doc(uid).delete();
  //     await result?.user?.delete();
  //     Provider.of<LoginSignupRepo>(context,
  //         listen: false)
  //         .logout()
  //         .then((value) {
  //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
  //       const WebLogin() ), (route) => false);
  //     });
  //    notifyListeners();
  //     // return null;
  //   } catch(e) {
  //     Provider.of<LoaderProvider>(context, listen: false).loading(false);
  //     CommonShareWidget.showFlushBar(
  //         context: context,
  //         duration: 2,
  //         message: "Password is incorrect");
  //     // throw new FirebaseAuthException(code: e.code, message: e.message);
  //     await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>
  //     const WebLogin() ), (route) => false);
  //     rethrow;
  //   }
  //   Provider.of<LoaderProvider>(context, listen: false).loading(false);
  // }

}
