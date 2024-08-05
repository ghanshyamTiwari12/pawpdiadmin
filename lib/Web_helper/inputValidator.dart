

class InputValidator {
  static String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if(value != null && value.trim().isNotEmpty){
      if (value.length != 10) {
        return 'enter valid number';
      } else if (!regExp.hasMatch(value)) {
        return 'Please enter valid mobile number';
      }
      return null;
    }
    else {return "enter mobile number";}
  }

  static isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em) ? null : "Enter correct Email address";
  }

  static String? emptyTextvalidator(String? v, errorText) {
    if(v != null && v.trim().isNotEmpty){
      // var rex = new RegExp('(^[^-\\s][a-zA-Z0-9_\\s-]+\$)');
      return null ;
    }
    else {
        return "Enter $errorText";
      }

      }

  static String? passWordValidation(String? value) {

       if(value != null && value.trim().isNotEmpty){
         if (value.length != 6) {
           return "Enter six digit OTP";
         } else if(value.length == 6 ){
           return "Verify your OTP";
         }
        else {
        return "Enter OTP";
       }
       }

  else {return "";}

// if (value.length < 6) return "Invalid password";
       // return null;
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regExp = RegExp(pattern);
    // if(value != null){
    //   if (value.length != 10) {
    //     return 'enter valid number';
    //   } else if (!regExp.hasMatch(value)) {
    //     return 'Please enter valid mobile number';
    //   }
    //   return null;
    // }
    // else {return "enter mobile number";}
  }
 // static String?  passWordValidation(String value) {
 //    if (value.isEmpty) return "Enter password";
 //    if (value.length < 6) return "Invalid password";
 //    return null;
 //  }
}
