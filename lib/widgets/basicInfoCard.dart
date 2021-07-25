import 'package:all_sim_packages/models/cardInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class BasicInfoCard extends StatelessWidget {
  final CardInfo cardInfo;
  final Color iconColor;
  final Color textColor;

  const BasicInfoCard(
      {Key key, @required this.cardInfo, this.iconColor, this.textColor})
      : assert(cardInfo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                height: 70,
                width: 70,
                child: Image.asset(
                  cardInfo.image,
                ),
              ),
              Container(
                child: Text(
                  "Rs\n${cardInfo.price}",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
          //Name
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardInfo.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textScaleFactor: 1.3,
                ),
                MiddelRow(
                  cardInfo: cardInfo,
                  iconColor: iconColor,
                ),
                validityRow(cardInfo.validity, cardInfo.sub),
              ],
            ).py12(),
          ),
        ],
      ),
    );
  }
}

class MiddelRow extends StatelessWidget {
  final CardInfo cardInfo;
  final Color iconColor;
  final Color textcolor;

  const MiddelRow({Key key, this.cardInfo, this.iconColor, this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color color = Vx.hexToColor("#800000");
    final Color textcolor = Colors.blue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (cardInfo.onMins != "0")
          info(
            icon: Icons.call,
            cardInfo: cardInfo.onMins,
            infoTitle: "OnNet-Mints",
            iconColor: iconColor,
            titlecolor: textcolor,
          ),
        if (cardInfo.offMins != "0")
          info(
            iconImage: 'assets/images/outgoing_call_icon.png',
            cardInfo: cardInfo.offMins,
            infoTitle: "OffNet-Mints",
            iconColor: iconColor,
            titlecolor: textcolor,
          ),
        if (cardInfo.sms != "0")
          info(
            icon: Icons.sms,
            cardInfo: cardInfo.sms,
            infoTitle: "SMS",
            iconColor: iconColor,
            titlecolor: textcolor,
          ),
        if (cardInfo.mbs != 0)
          info(
            iconImage: 'assets/images/mobile_data_icon.png',
            cardInfo: cardInfo.mbs,
            infoTitle: "MBs",
            iconColor: iconColor,
            titlecolor: textcolor,
          ),
      ],
    );
  }
}

Widget info(
    {var cardInfo,
    IconData icon,
    String iconImage,
    String infoTitle,
    Color iconColor,
    Color titlecolor}) {
  return Expanded(
    child: Column(
      children: [
        icon == null
            ? Image.asset(
                iconImage,
                height: 20,
                width: 20,
                color: iconColor,
              )
            : Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
        Card(
          elevation: 3,
          shape: StadiumBorder(),
          color: iconColor,
          child: Container(
            height: 25,
            alignment: Alignment.center,
            padding: EdgeInsets.all(0.5),
            child: Text(
              (cardInfo).toString(),
              textScaleFactor: cardInfo == "Unlimited" ? 1.2 : 1,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: cardInfo == "Unlimited" ? 11 : 16,
              ),
            ),
          ),
        ),
        Text(
          infoTitle,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: titlecolor,
          ),
          textScaleFactor: 0.8,
        ),
      ],
    ),
  );
}

Widget validityRow(String validity, String sub) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        children: [
          Text(
            "Validity: ",
            textScaleFactor: 0.8,
            style: TextStyle(
                fontSize: 17, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Text(
            validity,
            textScaleFactor: 1.1,
            style: TextStyle(
                fontSize: 15,
                color: Vx.hexToColor("#800000"),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
      InkWell(
        onTap: () {
          launchURL(sub.toString());
        },
        child: Card(
          elevation: 5,
          color: Colors.green,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            margin: EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Text(
              "Subscribe",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ).px4(),
        ),
      )
    ],
  );
}

launchURL(String sub) async {
  String url = 'tel:${sub.toString()}';
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  } else {
    throw 'Could not launch $url';
  }
}
