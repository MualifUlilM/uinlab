import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'navigation_controllers.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  String isLoading;
  WebViewController _webViewController;

  final FirebaseMessaging _fcm = FirebaseMessaging();

  String mainUrl = "https://energibangsa.id/";
  String secondaryUrl = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message)async{
        print("executed");
        print("onMessage = $message");
      },
      onLaunch: (Map<String, dynamic> message)async{
        print("executed");
        print("onLaunch = $message");
      },
      onResume: (Map<String, dynamic> message)async{
        print("executed");
        print("onResume = $message");
      },  
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0257A6),
        elevation: 0,
        title: Text(widget.title),
        actions: [
          NavigationControls(_controller.future),
        ],
      ),
      body: WillPopScope(
        onWillPop: ()=>_onBackPressed(),
        child:WebView(
          initialUrl: "https://energibangsa.id/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
      ),
      // onWillPop: ()=>_exitApp(context) 
    );
  }

  // custom function

  //asking user is he really want to exit the app
  Future<bool> _onBackPressed() {
  return showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text('Anda yakin?'),
      content: new Text('Apakah Anda ingin keluar dari Aplikasi'),
      actions: <Widget>[
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text("Iya"),
        ),
        // SizedBox(height: 16),
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text("Tidak"),
        ),
      ],
    ),
  ) ??
      false;
}


}