import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/custom_button.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});
  static String verify = "";
  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  var phoneNumber = "";
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/bike_car.png',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Continue with phone number',
                      style: GoogleFonts.baloo2(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            // Text form field with curved border

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 23, right: 0),
                    child: TextField(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "+977",
                        hintStyle: TextStyle(color: Colors.grey.shade700),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 0, right: 23),
                      child: TextFormField(
                        // validator phone number
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          } else if (value.length < 10) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },

                        keyboardType: TextInputType.phone,

                        onChanged: (value) {
                          phoneNumber = value;
                        },

                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "98########",
                          hintStyle: TextStyle(color: Colors.grey.shade700),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomButton(
              text: 'Next',
              loading: loading,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });

                  await auth.setSettings(
                      appVerificationDisabledForTesting: true);
                  await auth.verifyPhoneNumber(
                    phoneNumber: '+977$phoneNumber',
                    timeout: Duration(seconds: 60),
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      EnterPhoneScreen.verify = verificationId;
                      Navigator.pushNamed(context, '/otp');
                      setState(() {
                        loading = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+977$phoneNumber',
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException e) {},
                  //   codeSent: (String verificationId, int? resendToken) {
                  //     EnterPhoneScreen.verify = verificationId;
                  //     setState(() {
                  //       loading = false;
                  //     });
                  //     Navigator.pushNamed(context, '/otp');
                  //   },
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                  // FirebaseAuth auth = FirebaseAuth.instance;
                  // await auth.setSettings(
                  //     appVerificationDisabledForTesting:
                  //         true); // <-- here is the magic
                  // await auth.verifyPhoneNumber(
                  //   phoneNumber: phoneNumber,
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}