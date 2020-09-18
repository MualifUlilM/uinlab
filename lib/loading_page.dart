import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading()async{
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MyHomePage(title: "Web Views",)), (route) => false);
    });
    // Navigator.pushNamedAndRemoveUntil(context, '/pages', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){},
          child: Scaffold(
        // backgroundColor: Color(  ,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset("assets/img/energibangsa.png"),
              Text('Applikasi', style: Theme.of(context).textTheme.headline1,),

              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}