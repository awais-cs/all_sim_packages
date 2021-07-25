import 'package:all_sim_packages/models/cardInfo.dart';
import 'package:all_sim_packages/widgets/detailInfo.dart';
import 'package:all_sim_packages/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget {
  final CardInfo cardInfo;

  const DetailPage({Key key, @required this.cardInfo})
      : assert(cardInfo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.hexToColor("#800000"),
      appBar: AppBar(
        backgroundColor: Vx.hexToColor("#800000"),
        title: Text("Jazz + Warid"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailInfo(cardInfo: cardInfo),
              subRow((cardInfo.sub).toString()),
              machanics(
                title: "Recharge required",
                cardInf: cardInfo.rechargeReq,
              ),
              machanics(
                title: "Status",
                cardInf: cardInfo.status,
              ),
              machanics(
                title: "Info",
                cardInf: cardInfo.info,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RichText(
                  textScaleFactor: 1.2,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Description: ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "${cardInfo.desc}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget machanics({String title, String cardInf}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Text(
            "$title:  ",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            cardInf == null ? "Rs ${cardInfo.price}" : cardInf,
            textScaleFactor: 1.4,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

Widget subRow(String sub) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Icon(
          Icons.share,
          color: Colors.white,
        )),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              launchURL(sub);
            },
            child: Card(
              shape: StadiumBorder(),
              elevation: 5,
              color: Colors.yellowAccent,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "Subscribe",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Icon(
          Icons.favorite,
          color: Colors.white,
        ))
      ],
    ),
  );
}

// Widget machanics({String title, var cardInfo}) {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//     child: Row(
//       children: [
//         Text(
//           "$title: ",
//           textScaleFactor: 1.2,
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         Text(
//           cardInfo.rechargeReq == null
//               ? "Rs ${cardInfo.price}"
//               : (cardInfo).toString(),
//           textScaleFactor: 1.4,
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ],
//     ),
//   );
// }
