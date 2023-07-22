import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleFormScreen extends StatefulWidget {
  @override
  _GoogleFormScreenState createState() => _GoogleFormScreenState();
}

class _GoogleFormScreenState extends State<GoogleFormScreen> {
  final String formUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSeuUzeJixb6UvhFaiHu9GQz1e3Hlq-QD-k3Exz0jMukRm_D7Q/viewform?usp=sf_link';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Form'),
      ),
      body: WebView(
        initialUrl: formUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}