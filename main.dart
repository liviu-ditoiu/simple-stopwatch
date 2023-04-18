import 'package:flutter/material.dart';
import 'dart:async';


void main() => runApp(MaterialApp(
      home: StopwatchApp(),
      debugShowCheckedModeBanner: false,
    ));




class StopwatchApp extends StatefulWidget {
  @override
  _StopwatchAppState createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  Stopwatch stopwatch = Stopwatch();
  Timer timer=Timer(Duration(milliseconds: 500), () {
    // SOMETHING
    });

  void startStopwatch() {
    setState(() {
      stopwatch.start();
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {});
      });
    });
  }

  void stopStopwatch() {
    setState(() {
      stopwatch.stop();
      timer.cancel();
    });
  }

  void resetStopwatch() {
    setState(() {
      stopwatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stopwatch"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                stopwatch.elapsed.inSeconds.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: startStopwatch,
                child: Text("Start"),
              ),
              ElevatedButton(
                onPressed: stopStopwatch,
                child: Text("Stop"),
              ),
              ElevatedButton(
                onPressed: resetStopwatch,
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
