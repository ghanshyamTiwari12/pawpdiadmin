import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Web_helper/colors.dart';
import '../Web_helper/commonShareWidget.dart';


class WebAdminForgotPassword extends StatefulWidget {
  const WebAdminForgotPassword({super.key});

  @override
  State<WebAdminForgotPassword> createState() => _WebAdminForgotPasswordState();
}

class _WebAdminForgotPasswordState extends State<WebAdminForgotPassword> {
  final TextEditingController _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Forgot Your Password?",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, ),
                child: Center(
                  child: Text("Enter the Email associated with",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, ),
                child: Center(
                  child: Text("your accounts",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  // color: AppColor.orange
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Padding(
                      padding:   const EdgeInsets.symmetric(horizontal: 30),
                      child: Material(
                        elevation: 2.0,
                        color: AppColor.orange.withOpacity(0.3),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          onChanged: (String value) {},
                          cursorColor: Colors.black,
                          controller: _controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: "Enter Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blueAccent,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size.fromHeight(50), // NEW
                            ),
                            onPressed: ()
                            {
                              passwordReset(context);
                            }, child: const Text("Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Future passwordReset(context) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _controllerEmail.text.trim());
      CommonShareWidget.showFlushBar(
          context: context,
          duration: 4,
          message: "Password reset link sent on YOur Email");
    } catch (e){
      CommonShareWidget.showFlushBar(
          context: context,
          duration: 3,
          message: "Please Enter Correct Email ID");
    }
  }

}
