import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open URL in Browser"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.redAccent[50],
              child: Center(
                  child: ElevatedButton(
                child: Text("Open FlutterCampus.com"),
                onPressed: () async {
                  String url = "https://www.fluttercampus.com";
                  var urllaunchable = await canLaunch(
                      url); //canLaunch is from url_launcher package
                  if (urllaunchable) {
                    await launch(url,
                        forceWebView: true,
                        enableJavaScript:
                            true); //launch is from url_launcher package to launch URL
                  } else {
                    print("URL can't be launched.");
                  }
                },
              )),
            )));
  }
}
