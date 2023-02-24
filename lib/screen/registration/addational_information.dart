import 'package:commute_nepal/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRegistrationScreen extends StatefulWidget {
  UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  DateTime dateTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Congratulations!',
                    style: GoogleFonts.baloo2(
                        fontSize: 37.0, fontWeight: FontWeight.bold)),
                Text('on verifying the phone belongs to you',
                    style: GoogleFonts.baloo2(fontSize: 19.0, height: 1)),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(children: [
                    Text('Sign up',
                        style: GoogleFonts.baloo2(
                            fontSize: 36.0, fontWeight: FontWeight.bold)),
                    Text('we need something more',
                        style: GoogleFonts.baloo2(fontSize: 19.0, height: 1)),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 23, right: 0),
                          child: SizedBox(
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                } else if (value.length <= 5) {
                                  return 'Please enter name longer than 5 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Firstname",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 0, right: 23),
                          child: SizedBox(
                            child: TextFormField(
                              // validator phone number
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },

                              keyboardType: TextInputType.text,

                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Lastname",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
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
                ),
                // const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        width: 345,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // validate emailAddress
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Email (Optional)",
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
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                    text: "Register",
                    loading: loading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/dashboard");
                      }
                    })

                // add buildDatePicker with fitting sized
              ],
            ),
          ),
        ));
  }
}
