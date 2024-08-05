
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_profile.dart';
import 'all_user_screen_api.dart';

class SearchProvider extends ChangeNotifier{
  static FirebaseFirestore userFirestore = FirebaseFirestore.instance;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  searching(bool isSearching) {
    _isSearching = isSearching;
    notifyListeners();
  }

  String _searchKeyword = '' ;
  String get searchKeyword => _searchKeyword;
  // List<UserProfileModel> _list = [];

    List<UserProfileModel> _searchList = [];
   List<UserProfileModel> get searchList => _searchList;

    searchValueKeyword(String value){
      _searchKeyword = value;
      notifyListeners();
    }

  searchKeyClear(){
    _searchKeyword = '';
    notifyListeners();
  }

    // updateSearchList(List<UserProfileModel> searchList){
    //   _searchList = searchList;
    //   notifyListeners();
    // }
  initialSerchList(List<UserProfileModel> list){
    _searchList = list;
  }




  searchItem(context){
    Stream stream = AllUserScreenApi.verifiedProfessional();
    String? searchValue;
    searchValue =  Provider.of<SearchProvider>(context, listen: false).searchKeyword;
    _searchKeyword = searchValue;

   return stream.contains(_searchKeyword.toLowerCase());
  }

  searchScreen(List<UserProfileModel> list, context, ){
    String? searchValue;
    searchValue =  Provider.of<SearchProvider>(context, listen: false).searchKeyword;
    _searchKeyword = searchValue;

    for( var i in list){
      if(i.name!.toLowerCase().contains(_searchKeyword.toLowerCase())
          || i.email!.toLowerCase().contains(_searchKeyword.toLowerCase())
          || i.professionalType!.toLowerCase().contains(_searchKeyword.toLowerCase())
      ){
        // searchList.add(i);
        if (kDebugMode) {
          print("i.name in for --${i.name}");
        }
        _searchList.add(i);
        if (kDebugMode) {
          print("provider _searchlist --- ${_searchList.first.name}");
        }

      }
      _searchList.clear();
      _searchKeyword = '';
      notifyListeners();
    }
    // print("provider Search Screen function _searchlist --- ${_searchList.first.name}");
    notifyListeners();
  }

  searchListClear(){
    _searchList.clear();
    if (kDebugMode) {
      print("provider searchListClear function _searchlist --- ${_searchList.first.name}");
    }
    notifyListeners();
  }

}