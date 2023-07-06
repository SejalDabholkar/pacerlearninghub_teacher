import 'package:flutter/material.dart';
import 'package:pacers_teacher/loginscreen/otpverfication.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  TextEditingController contactcontroller = TextEditingController();
  dataNavigation(BuildContext context) {
    if (formkey.currentState != null && formkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Otp(),
        ),
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 280,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Outfit-Bold',
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "We will send a OTP to this mobile number",
                  style: TextStyle(
                    fontFamily: 'Outfit-Medium',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 26,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contact Number",
                    style: TextStyle(
                      fontFamily: 'Outfit-Bold',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: contactcontroller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Contact Number',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 10 ||
                        value.length > 10) {
                      return "Enter Correct Contact Number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      dataNavigation(context);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Outfit-Medium'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
