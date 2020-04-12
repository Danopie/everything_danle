import 'package:everything_danle/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          AppHeader(),
        ];
      },
      body: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              Text(lorem(paragraphs: 20, words: 10000)),
            ]),
          ),
        ),
      ),
    );
  }
}
