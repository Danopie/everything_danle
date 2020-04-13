import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_danle/base_page.dart';
import 'package:everything_danle/header/header.dart';
import 'package:everything_danle/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: ListView.builder(
        padding: EdgeInsets.all(24),
        itemCount: 1,
        itemBuilder: (_, index) {
          return SelfIntroduction();
        },
      ),
    );
  }
}

class SelfIntroduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - AppHeader.HEIGHT * 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(
            "MY NAME IS",
            style: TextStyles.text.s(18),
          ),
          Container(
            height: 12,
          ),
          Text(
            "LÊ DÂN",
            style: TextStyles.text.superBold.s(60),
          ),
          Container(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "I'm a",
                style: TextStyles.text.medium.s(30),
              ),
              Container(
                width: 12,
              ),
              FadeAnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 999,
                  duration: Duration(seconds: 2),
                  text: ["Mobile Developer", "Flutter Enthusiast", "S"],
                  textStyle: TextStyles.text.superBold.s(30).underline,
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 42,
              ),
            ),
          )
        ],
      ),
    );
  }
}
