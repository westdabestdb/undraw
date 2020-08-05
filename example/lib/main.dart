import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.red;
  UnDrawIllustration illustration = UnDrawIllustration.mobile_application;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: UnDraw(
        color: color,
        illustration: illustration,
        placeholder: Text("Illustration is loading..."),
        errorWidget: Icon(Icons.error_outline, color: Colors.red, size: 50),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 36, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              child: Icon(Icons.color_lens),
              onPressed: () {
                setState(() {
                  color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                      .withOpacity(1.0);
                });
              },
              backgroundColor: Colors.red,
            ),
            FloatingActionButton(
              child: Icon(Icons.image),
              onPressed: () {
                Random random = new Random();
                setState(() {
                  illustration = UnDrawIllustration
                      .values[random.nextInt(UnDrawIllustration.values.length)];
                });
              },
              backgroundColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
