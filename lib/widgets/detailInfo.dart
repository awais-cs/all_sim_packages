import 'package:all_sim_packages/models/cardInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  final CardInfo cardInfo;

  const DetailInfo({Key key, @required this.cardInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "${cardInfo.name}",
              textScaleFactor: 1.8,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // on-Mins
          details(
            cardInfoC1: cardInfo.onMins,
            titleC1: "On-Net",
            cardInfoC2: cardInfo.offMins,
            titleC2: "Off-Net",
            isMints: true,
          ),
          // Row 2
          details(
            cardInfoC1: cardInfo.sms,
            titleC1: "SMS",
            cardInfoC2: cardInfo.mbs,
            titleC2: "Mbs",
          ),
          // Row 3
          details(
            cardInfoC1: cardInfo.valid,
            titleC1: "Validity",
            cardInfoC2: cardInfo.price,
            titleC2: "Price",
            rs: "Rs",
          ),
          // Row 4
          details(
            cardInfoC1: cardInfo.sub,
            titleC1: "Subscribe",
            cardInfoC2: cardInfo.unSub,
            titleC2: "Un-Subscribe",
          ),
        ],
      ),
    );
  }
}

Widget details(
    {@required var cardInfoC1,
    @required String titleC1,
    @required var cardInfoC2,
    @required String titleC2,
    String rs = "",
    bool isMints = false}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          constraints: BoxConstraints(maxHeight: 60),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleC1,
                textScaleFactor: 1.4,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                isMints
                    ? "${cardInfoC1.toString()} Mints"
                    : "${cardInfoC1.toString()}",
                textScaleFactor: 1.4,
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          constraints: BoxConstraints(maxHeight: 60),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titleC2,
                textScaleFactor: 1.4,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  isMints
                      ? "${cardInfoC2.toString()} Mints"
                      : "$rs ${cardInfoC2.toString()}",
                  textScaleFactor: 1.4,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
