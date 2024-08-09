import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petfindernetwork/Web%20views/all_users.dart';
import 'package:petfindernetwork/Web_helper/loginsignupRepo.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'Web Api/appointment_function.dart';
import 'Web Api/dashboard_screen_api.dart';
import 'Web Api/pet_review_provider.dart';
import 'Web Api/user_selected_provider.dart';
import 'Web Api/web_appintment_api.dart';
import 'Web Api/web_search_provider.dart';
import 'Web views/web_main.dart';
import 'Web_helper/preference.dart';
import 'Web_login/web_login.dart';
import 'Web Api/checkbox_provider.dart';
import 'Web_helper/loader_provider.dart';
import 'Web_helper/firebase_helper.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseHelper.web(isProductionMode: false),
  );

  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  // await FirebaseAppCheck.instance.activate(
  //   webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
  //   androidProvider: AndroidProvider.playIntegrity,
  //   appleProvider: AppleProvider.appAttest,
  // );

  // await LocalNotification.init();
  // tz.initializeTimeZones();
  await Preferences.initPreferences();

  // MobileAds.instance.initialize();
  setUIStyle();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginSignupRepo()),
      ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
      // ChangeNotifierProvider(create: (_) => DateTimeProvider()),
      // ChangeNotifierProvider(create: (_) => ImagePickerHelper()),
      ChangeNotifierProvider(create: (_) => LoaderProvider()),
      // ChangeNotifierProvider(create: (_) => ProfessionalIdProvider()),
      ChangeNotifierProvider(create: (_) => DashboardScreenApi()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => PetReviewProvider()),
      ChangeNotifierProvider(create: (_) => UserSelected()),
      ChangeNotifierProvider(create: (_) => AppointmentApi()),
      ChangeNotifierProvider(create: (_) => UserSelectionFunction()),

      StreamProvider<User?>.value(
        value: FirebaseAuth.instance.authStateChanges(),
        initialData: null,
        updateShouldNotify: (olduser, newuser) => olduser != newuser,
      )
    ],
    child: const MyApp(),
  ));

  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            primary: Colors.blue,
            secondary: Colors.amber,
            tertiary: Colors.pink,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xfffafafa),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // routes: <String, WidgetBuilder>{
        //   '/': (BuildContext context) => WebMainScreen(),
        //
        //
        // },
        home: const WebLogin(),
        routes: {
          WebLogin.id: (BuildContext context) => const WebLogin(),
          WebDashboardScreen.id: (BuildContext context) =>
              const WebDashboardScreen(),
          AllUserScreen.id: (BuildContext context) => const AllUserScreen(),
        },
      );
    });
  }
}

void setUIStyle() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark),
  );
}
