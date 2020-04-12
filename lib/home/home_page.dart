import 'package:everything_danle/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool reachedTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            AppHeader(hasShadow: !reachedTop),
            Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (noti) {
                  if (noti.metrics.pixels > 0) {
                    if (reachedTop) {
                      setState(() {
                        reachedTop = false;
                      });
                    }
                  } else {
                    if (!reachedTop) {
                      setState(() {
                        reachedTop = true;
                      });
                    }
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(12),
                  child: Column(children: [
                    Text(lorem(paragraphs: 20, words: 10000)),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
