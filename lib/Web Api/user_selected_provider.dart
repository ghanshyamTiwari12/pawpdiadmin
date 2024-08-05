import 'package:flutter/cupertino.dart';

class UserSelected extends ChangeNotifier{

  bool _isUserSelected = false;
  bool get isUserSelected => _isUserSelected;

  bool _isProfessionalSelected = false;
  bool get isProfessionalSelected => _isProfessionalSelected;

  String _userID = '';
  String get userID => _userID;

  String _userName = '';
  String get userName => _userName;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  selectedItem(int selectIndex){
    _selectedIndex = selectIndex;
    notifyListeners();
  }

  userSelected(bool isSelected) {
    _isUserSelected = isSelected;
    notifyListeners();
  }

  professionalSelected(bool isSelected){
    _isProfessionalSelected = isSelected;
    notifyListeners();

  }

  selectedUserId(String userId){
    _userID = userId;
    notifyListeners();
  }

  selectedUserName(String userName){
    _userName= userName;
    notifyListeners();
  }
}