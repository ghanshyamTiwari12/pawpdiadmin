
import 'package:flutter/cupertino.dart';
import 'package:petfindernetwork/Web_helper/preference.dart';
import '../model/user_profile.dart';

class UserProvider with ChangeNotifier {
  static Map<String, dynamic>? _userData = Preferences.getUserData();
  static Map<String, dynamic>? get userData => _userData;

  static UserProfileModel? _userInfoModel = _userData != null ? UserProfileModel.fromJson(_userData!) : null;

  static UserProfileModel? get userInfoModel => _userInfoModel;

  void setUserData(Map<String, dynamic>? userData) {
    _userData = userData;
    _userInfoModel = userData != null ? UserProfileModel.fromJson(userData) : null;
    debugPrint("set locale $userData");
    debugPrint("===_userData--$_userData");
    notifyListeners();
      }


}