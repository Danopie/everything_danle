import 'package:everything_danle/res/dimen.dart';
import 'package:everything_danle/res/links.dart';
import 'package:everything_danle/res/text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHeader extends StatelessWidget {
  static const double HEIGHT = 60;
  final bool hasShadow;

  const AppHeader({Key key, this.hasShadow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
          height: HEIGHT,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: hasShadow
                  ? [
                      BoxShadow(
                          color: Colors.black26, spreadRadius: 4, blurRadius: 4)
                    ]
                  : null),
          duration: Duration(milliseconds: 250),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(12, 4, 12, 8),
          child: Container(
            constraints: BoxConstraints(maxWidth: AssetDimens.appMaxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyLogo(),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final items = {
                        "Blog": AssetLinks.medium,
                        "Resume": AssetLinks.linkedin,
                        "Projects": AssetLinks.github,
                      };

                      final canShowAllActions = constraints.maxWidth >
                          HeaderAction.WIDTH * items.length;

                      if (canShowAllActions) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: items.keys
                              .map((e) => HeaderAction(
                                    title: e,
                                    link: items[e],
                                  ))
                              .toList(),
                        );
                      } else {
                        return Container(
                          alignment: Alignment.centerRight,
                          child: PopupMenuButton(
                            icon: Icon(Icons.menu),
                            onSelected: (link) async {
                              if (await canLaunch(link)) {
                                launch(link);
                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return items.keys
                                  .map((e) => PopupMenuItem(
                                        value: items[e],
                                        child: Text(
                                          e,
                                          style: TextStyles.text.medium.s(16),
                                        ),
                                      ))
                                  .toList();
                            },
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
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
  static const double WIDTH = 80;

  final String title;
  final String link;

  const HeaderAction({Key key, this.title, this.link}) : super(key: key);

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
      child: InkWell(
        onTap: () async {
          if (await canLaunch(widget.link)) {
            launch(widget.link);
          }
        },
        child: AnimatedContainer(
          width: HeaderAction.WIDTH,
          duration: Duration(milliseconds: 160),
          padding: EdgeInsets.symmetric(vertical: 16),
          color: shouldHighlight ? Colors.grey[200] : null,
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: TextStyles.text.medium.s(16),
          ),
        ),
      ),
    );
  }
}
