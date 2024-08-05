import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petfindernetwork/Web_helper/colors.dart';
import 'package:petfindernetwork/Web_helper/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.70,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Assets.images.logo.image(
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          ),
          SpinKitPulse(
            size: 100.0,
            itemBuilder: (BuildContext context, int index) {
              return const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              );
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
