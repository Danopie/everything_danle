import 'package:everything_danle/res/text.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 4,
      forceElevated: true,
      backgroundColor: Colors.white,
      title: MyLogo(),
      actions: [
        HeaderAction(
          title: "Home",
        ),
        HeaderAction(
          title: "Blog",
        ),
        HeaderAction(
          title: "Resume",
        ),
        HeaderAction(
          title: "About",
        ),
        HeaderAction(
          title: "Projects",
        ),
      ],
    );
  }
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Dan Le",
      style: TextStyles.text.bold.s(26),
    );
  }
}

class HeaderAction extends StatefulWidget {
  final String title;

  const HeaderAction({Key key, this.title}) : super(key: key);

  @override
  _HeaderActionState createState() => _HeaderActionState();
}

class _HeaderActionState extends State<HeaderAction> {
  bool shouldHighlight = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          shouldHighlight = true;
        });
      },
      onExit: (event) {
        setState(() {
          shouldHighlight = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 160),
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: shouldHighlight ? Colors.grey[200] : null,
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyles.text.medium.s(16),
        ),
      ),
    );
  }
}
