import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  Color color;
  String drawerImage;
  MyDrawer({Key key, this.color, this.drawerImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: color,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  drawerImage,
                ),
                listTile(
                    title: "Remaining Balance", code: ("*111#").toString()),
                listTile(title: "Remaining Minutes", code: "*111#"),
                listTile(title: "Remaining SMS", code: "*111#"),
                listTile(title: "Remaining Internet", code: "*111#"),
                listTile(title: "Card Recharge", code: "*111#"),
                listTile(title: "Get Advance Balance", code: "*111#"),
                listTile(title: "Share Balance", code: "*111#"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget listTile({@required String title, code}) {
  return GestureDetector(
    onTap: () {
      launchURL(code);
    },
    child: ListTile(
      leading: Icon(Icons.chevron_right, color: Colors.white),
      title: Text(
        title,
        textScaleFactor: 1.1,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

launchURL(String sub) async {
  String url = "tel:${sub.toString()}";
  if (await canLaunch(url)) {
    await launch(url.toString());
  } else {
    throw 'Could not launch $url';
  }
}
