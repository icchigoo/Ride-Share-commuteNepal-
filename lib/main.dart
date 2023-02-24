import 'package:commute_nepal/screen/dashboard/DashboardScreen.dart';
import 'package:commute_nepal/screen/registration/EnterPhone_Screen.dart';
import 'package:commute_nepal/screen/registration/OtpScreen.dart';
import 'package:commute_nepal/screen/registration/addational_information.dart';
import 'package:commute_nepal/screen/rider_registration/choose_vehicle_screen.dart';
import 'package:commute_nepal/screen/rider_registration/rider_verification_1.dart';
import 'package:commute_nepal/screen/rider_registration/rider_verification_2.dart';
import 'package:commute_nepal/screen/rider_registration/supporting_doc_3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // intialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
      routes: {
        '/enter_phone': (context) => const EnterPhoneScreen(),
        '/verify_otp': (context) => const OtpScreen(),
        '/choose_verf_category': (context) => const ChooseVehicleScreen(),
        // '/registrationprocess': (context) => const RegistrationProcessScreen(),
        '/rider_verf_1': (context) => const RiderVerificationScreen1(),
        '/user_registation': (context) => UserRegistrationScreen(),
        '/rider_verf_3': (context) => const SupportingDoc3(),
        '/rider_verf_2': (context) => const RiderVerificationScreen2(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
