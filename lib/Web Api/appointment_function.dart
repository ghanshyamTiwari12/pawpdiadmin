import 'package:flutter/foundation.dart';
import 'package:petfindernetwork/Web%20Api/user_selected_provider.dart';
import 'package:petfindernetwork/Web%20Api/web_appintment_api.dart';
import 'package:petfindernetwork/Web%20Api/web_search_provider.dart';
import 'package:provider/provider.dart';

class UserSelectionFunction extends ChangeNotifier {



  static  providerCall(String uid, String name, context){
    Provider.of<UserSelected>(context, listen: false).professionalSelected(true);
    Provider.of<UserSelected>(context, listen: false).selectedUserId(uid);
    Provider.of<UserSelected>(context, listen: false).selectedUserName(name);
    Provider.of<AppointmentApi>(context, listen: false).allAppointmentUser(uid);
    Provider.of<AppointmentApi>(context, listen: false).allInProcessAppointment(uid);
    Provider.of<AppointmentApi>(context, listen: false).allCompletedAppointment(uid);
    Provider.of<AppointmentApi>(context, listen: false).allCancelAppointment(uid);
    Provider.of<AppointmentApi>(context, listen: false).rating(uid);
    // notifyListeners();



  }

  static userSelectionProvider(String uid, String name, context){
    Provider.of<UserSelected>(context, listen: false).userSelected(true);
    Provider.of<UserSelected>(context, listen: false).selectedUserId(uid);
    Provider.of<UserSelected>(context, listen: false).selectedUserName(name);
  }

   userSelectionFalse(context)  {
    Provider.of<UserSelected>(context, listen: false).userSelected(false);
    Provider.of<UserSelected>(context, listen: false).selectedUserId("0");
    Provider.of<UserSelected>(context, listen: false).professionalSelected(false);
    Provider.of<SearchProvider>(context, listen: false).searchKeyClear();
    notifyListeners();
  }

}