import 'package:everything_danle/header/header.dart';
import 'package:everything_danle/res/dimen.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final Widget child;

  const BasePage({Key key, this.child}) : super(key: key);
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
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
                child: Container(
                  constraints: BoxConstraints(maxWidth: AssetDimens.appMaxWidth),
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
