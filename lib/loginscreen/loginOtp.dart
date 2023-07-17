import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pacers_teacher/loginscreen/verify.dart';
import 'dart:async';
class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<MyPhone> createState() => _LoginPageState();
}

class _LoginPageState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isPhoneNumberValid = false;
  bool isButtonDisabled = false;

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  Future<void> sendVerificationCode() async {
    final response = await http.post(
      Uri.parse('https://pacerlearninghub.onrender.com/auth/sendOtpTeacher'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'phoneno': '${countryController.text + phoneController.text}',
      }),
    );

    if (response.statusCode == 200) {
      print('Request success with status: ${response.statusCode}');
      MyPhone.verify= '${countryController.text + phoneController.text}';
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyVerify(),));
    } else {
      print('Request failed with status: ${response.statusCode}');
      // Handle request failure
    }
  }

  void validatePhoneNumber() {
    final String phoneNumber = phoneController.text.trim();

    if (phoneNumber.length == 10) {
      setState(() {
        isPhoneNumberValid = true;
      });
    } else {
      setState(() {
        isPhoneNumberValid = false;
      });
    }
  }

  void startButtonTimer() {
    setState(() {
      isButtonDisabled = true;
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        isButtonDisabled = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 25),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "We need to login with your registered phone",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        onChanged: (value) {
                          validatePhoneNumber();
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isPhoneNumberValid && !isButtonDisabled ? () {
                    sendVerificationCode();
                    startButtonTimer();
                  } : null,
                  child: Text("Send the code"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
