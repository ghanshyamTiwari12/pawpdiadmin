import 'package:firebase_core/firebase_core.dart';

class FirebaseHelper {

  static FirebaseOptions web({required bool isProductionMode}){
    return isProductionMode ? _webProduction : _webDevelopment;
  }

  static const FirebaseOptions _webProduction = FirebaseOptions(
    apiKey: 'AIzaSyANEQFHPKWlvUZzVs2tRIyT2oUYUM0nUe8',
    appId: '1:214976443703:web:f8e96dc5a83c64d2abd6b2',
    messagingSenderId: '214976443703',
    projectId: 'pawpdi',
    authDomain: 'pawpdi.firebaseapp.com',
    storageBucket: 'pawpdi.appspot.com',
    measurementId: 'G-L5YRRVPDEB',
  );

  static const FirebaseOptions _webDevelopment = FirebaseOptions(
    apiKey: 'AIzaSyDqDTjju2vtrYwPtMrOzEtOkBu4-sqvsVk',
    appId: '1:815295924168:web:c60b216b52e400208922fd',
    messagingSenderId: '815295924168',
    projectId: 'petfindernetwork-prod',
    authDomain: 'petfindernetwork-prod.firebaseapp.com',
    storageBucket: 'petfindernetwork-prod.appspot.com',
    measurementId: 'G-L4MZEH8JR3',
  );

}