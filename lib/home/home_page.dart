import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_danle/base_page.dart';
import 'package:everything_danle/header/header.dart';
import 'package:everything_danle/res/links.dart';
import 'package:everything_danle/res/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

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
    final widgets = [
      PersonalOverview(),
      Container(
        height: 32,
      ),
      AboutMe(),
    ];

    return BasePage(
      child: ListView.builder(
        padding: EdgeInsets.all(24),
        itemCount: widgets.length,
        itemBuilder: (_, index) {
          return widgets[index];
        },
      ),
    );
  }
}

class PersonalOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - AppHeader.HEIGHT * 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          ClipOval(
            child: Image.asset(
              "asset/header_img.jpg",
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 24,
          ),
          Text(
            "MY NAME IS",
            style: TextStyles.text.s(14),
          ),
          Container(
            height: 8,
          ),
          Text(
            "LÊ DÂN",
            style: TextStyles.text.superBold.s(54),
          ),
          Container(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "I'm a",
                style: TextStyles.text.medium.s(24),
              ),
              Container(
                width: 12,
              ),
              FadeAnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 999,
                  duration: Duration(seconds: 2),
                  text: ["Mobile Developer", "Flutter Enthusiast"],
                  textStyle: TextStyles.text.superBold.s(24).underline,
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ],
          ),
          Container(
            height: 120,
          ),
          MyLinks(),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: 32,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      ItemLink(
        image: "asset/logo.png",
        link: AssetLinks.github,
      ),
      ItemLink(
        image: "asset/medium.png",
        link: AssetLinks.medium,
      ),
      ItemLink(
        image: "asset/linkedin.png",
        link: AssetLinks.linkedin,
      ),
      ItemLink(
        image: "asset/instagram.png",
        link: AssetLinks.instagram,
      ),
      ItemLink(
        image: "asset/facebook.png",
        link: AssetLinks.facebook,
      ),
    ];

    return Container(
      height: 56,
      child: ListView.separated(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: 18,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return items[index];
        },
      ),
    );
  }
}

class ItemLink extends StatelessWidget {
  final String image;
  final String link;

  const ItemLink({Key key, this.image, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(link)) {
          launch(link);
        }
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  final infoMap = {
    "Name": "Lê Dân",
    "Date of birth": "November 11, 1996",
    "Email": "danle.sdev@gmail.com",
    "Phone": "0844198618"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1 / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "asset/_DSC0682.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            width: 40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                ),
                Text(
                  "About Me",
                  style: TextStyles.text.superBold.s(34),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoMap
                          .map((key, value) => MapEntry(
                              key,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      key,
                                      style: TextStyles.text.bold.s(14),
                                    ),
                                  ),
                                  Container(
                                    child: SelectableText(
                                      value,
                                      style: TextStyles.text.light.s(20),
                                    ),
                                  ),
                                  Container(
                                    height: 24,
                                  ),
                                ],
                              )))
                          .values
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
