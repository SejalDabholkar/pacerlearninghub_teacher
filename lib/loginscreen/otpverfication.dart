
import 'package:flutter/material.dart';
import 'package:pacers_teacher/dashboard.dart';
import 'package:pacers_teacher/main.dart';



class Otp extends StatefulWidget {
  const Otp({
    super.key,
  });

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 32,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 181,
              ),
              Text(
                'OTP Verification',
                style: TextStyle(
                  fontFamily: 'Outfit-Bold',
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter the OTP sent on your number",
                style: TextStyle(
                  fontFamily: 'Outfit-Medium',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 3.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Haven't recieved OTP?",
                style: TextStyle(
                  letterSpacing: 0.2,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Resend OTP",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last}) {
    return SizedBox(
      height: 54,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.blue),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}