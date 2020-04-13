import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:everything_danle/base_page.dart';
import 'package:everything_danle/header/header.dart';
import 'package:everything_danle/res/links.dart';
import 'package:everything_danle/res/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      Container(
        height: 32,
      ),
    ];

    return BasePage(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
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
    return Builder(
      builder: (BuildContext context) {
        if (MediaQuery.of(context).size.height > 800) {
          return Container(
            height: MediaQuery.of(context).size.height - AppHeader.HEIGHT * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Avatar(),
                Container(
                  height: 24,
                ),
                IntroductionWords(),
                Spacer(
                  flex: 1,
                ),
                MyLinks(),
                Expanded(
                  flex: 2,
                  child: GuideArrow(),
                )
              ],
            ),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
              ),
              Avatar(),
              Container(
                height: 24,
              ),
              IntroductionWords(),
              Container(
                height: 100,
              ),
              MyLinks(),
              Container(
                height: 100,
              ),
              GuideArrow()
            ],
          );
        }
      },
    );
  }
}

class GuideArrow extends StatelessWidget {
  const GuideArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      alignment: Alignment.bottomCenter,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: 32,
        ),
      ),
    );
  }
}

class IntroductionWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "MY NAME IS",
          style: GoogleFonts.arvo(textStyle: TextStyles.text.s(14)),
        ),
        Container(
          height: 10,
        ),
        Text(
          "LÊ DÂN",
          style: GoogleFonts.arvo(
              textStyle: TextStyles.text.s(48)),
        ),
        Container(
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "I'm a",
                style: GoogleFonts.arvo(
                    textStyle: TextStyles.text.medium.s(18)),
              ),
              Container(
                width: 8,
              ),
              FadeAnimatedTextKit(
                  isRepeatingAnimation: true,
                  totalRepeatCount: 999,
                  duration: Duration(seconds: 2),
                  text: ["Mobile Developer", "Flutter Enthusiast"],
                  textStyle: GoogleFonts.arvo(
                      textStyle: TextStyles.text.bold.s(18).underline),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        "asset/header_img.jpg",
        height: 120,
        width: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double margin = 18;
    final divider = Container(
      width: margin,
    );
    final items = [
      ItemLink(
        image: "asset/logo.png",
        link: AssetLinks.github,
      ),
      divider,
      ItemLink(
        image: "asset/medium.png",
        link: AssetLinks.medium,
      ),
      divider,
      ItemLink(
        image: "asset/linkedin.png",
        link: AssetLinks.linkedin,
      ),
      divider,
      ItemLink(
        image: "asset/instagram.png",
        link: AssetLinks.instagram,
      ),
      divider,
      ItemLink(
        image: "asset/facebook.png",
        link: AssetLinks.facebook,
      ),
    ];

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: items,
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
          height: 34,
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
              alignment: Alignment.topRight,
              child: Image.asset(
                "asset/_DSC0682.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 32,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "About Me",
                    style: TextStyles.text.superBold.s(34),
                  ),
                ),
                Container(
                  height: 16,
                ),
                Expanded(
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: infoMap
                            .map((key, value) => MapEntry(
                                key,
                                Column(
                                  mainAxisSize: MainAxisSize.min,
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
