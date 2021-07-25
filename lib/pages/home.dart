import 'package:all_sim_packages/pages/offersMenu.dart';
import 'package:all_sim_packages/widgets/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text("All Sim/Network Packages"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(child: containerColumn(context)),
          ),
        ),
      ),
      tab: Scaffold(
        appBar: AppBar(
          title: Text("All Sim/Network Packages"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: containerColumn(context,
                  mediaQueryDevided: 2, positionLeft: 200),
            ),
          ),
        ),
      ),
    );
  }

  Column containerColumn(BuildContext context,
      {double mediaQueryDevided = 1, double positionLeft = 155}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        row(context,
            simTitle: "Jazz",
            pageName: OffersMenu(
              drawerImage: "assets/images/jazz_warid.png",
              title: "Jazz + Warid Offers",
              titleAppBar: "Jazz + Warid",
              jsonFilePath: "assets/files/jazzCall.json",
              jazz: true,
              color: Vx.hexToColor("#990000"),
              backgroundColor: Vx.hexToColor("#800000"),
            ),
            color: Vx.hexToColor("#800000"),
            simLogo: "assets/images/jazz_logo.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
        row(context,
            simTitle: "Warid",
            pageName: OffersMenu(
              drawerImage: "assets/images/jazz_warid.png",
              title: "Jazz + Warid Offers",
              titleAppBar: "Jazz + Warid",
              jsonFilePath: "assets/files/jazzCall.json",
              jazz: true,
              color: Colors.blue,
              backgroundColor: Colors.blueAccent,
            ),
            color: Colors.blueAccent,
            simLogo: "assets/images/warid_logo.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
        row(context,
            simTitle: "Zong",
            pageName: OffersMenu(
              drawerImage: "assets/images/zong_campaign.png",
              title: "Zong Offers",
              titleAppBar: "Zong",
              jsonFilePath: "assets/files/ufone.json",
              color: Vx.hexToColor("#0c980c"),
              backgroundColor: Vx.hexToColor("#0fbe0f"),
            ),
            color: Vx.hexToColor("#0fbe0f"),
            simLogo: "assets/images/zong_campaign.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
        row(context,
            simTitle: "Telenor",
            pageName: OffersMenu(
              drawerImage: "assets/images/telenor_campaign.png",
              title: "Telenor Offers",
              titleAppBar: "Telenor",
              jsonFilePath: "assets/files/ufone.json",
              color: Vx.hexToColor("#45b3e0"),
              backgroundColor: Vx.hexToColor("#87ceeb"),
            ),
            color: Vx.hexToColor("#45b3e0"),
            simLogo: "assets/images/telenor_logo.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
        row(context,
            simTitle: "Ufone",
            pageName: OffersMenu(
              drawerImage: "assets/images/ufone_campaign.png",
              title: "Ufone Offers",
              titleAppBar: "Ufone",
              jsonFilePath: "assets/files/ufone.json",
              color: Vx.hexToColor("#ffa500"),
              backgroundColor: Colors.orangeAccent,
            ),
            color: Vx.hexToColor("#ffa500"),
            simLogo: "assets/images/ufone_logo.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
        row(context,
            simTitle: "PTCL",
            pageName: OffersMenu(
              drawerImage: "assets/images/ptcl_campaign.png",
              title: "PTCL Offers",
              titleAppBar: "PTCL",
              jsonFilePath: "assets/files/ufone.json",
              color: Vx.hexToColor("#006700"),
              backgroundColor: Vx.hexToColor("#008000"),
            ),
            color: Vx.hexToColor("#006700"),
            simLogo: "assets/images/ptcl_campaign.png",
            mediaQueryDevided: mediaQueryDevided,
            positionLeft: positionLeft),
      ],
    );
  }

  Widget row(BuildContext context,
      {Widget pageName,
      String simLogo,
      String simTitle,
      Color color,
      double mediaQueryDevided,
      double positionLeft}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pageName));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8
            // vertical: MediaQuery.of(context).size.height / 20
            ),
        child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90),
              bottomRight: Radius.circular(90),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -4),
                  color: Colors.grey[400],
                  blurRadius: 3),
              BoxShadow(
                  offset: Offset(0, 5), color: Colors.grey[500], blurRadius: 3),
            ],
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: MediaQuery.of(context).size.height / 9,
                child: Image.asset(
                  simLogo,
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width / 2.1) + .30,
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                  child: Text(
                    simTitle,
                    textScaleFactor: 2.5,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
