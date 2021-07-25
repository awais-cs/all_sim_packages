import 'package:all_sim_packages/pages/offersPage.dart';
import 'package:all_sim_packages/widgets/customTabs.dart';
import 'package:all_sim_packages/widgets/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:all_sim_packages/widgets/myDrawer.dart';

// ignore: must_be_immutable
class OffersMenu extends StatelessWidget {
  String drawerImage;
  Color color;
  Color backgroundColor;
  String title;
  String titleAppBar;
  String jsonFilePath;
  bool jazz;

  OffersMenu(
      {Key key,
      this.drawerImage,
      this.color,
      this.backgroundColor,
      this.title,
      this.titleAppBar,
      this.jsonFilePath,
      this.jazz})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(
          color: color,
          drawerImage: drawerImage,
        ),
        appBar: AppBar(
          backgroundColor: color,
          title: Text(title),
          centerTitle: true,
        ),
        body: ResponsiveWidget(
          mobile: SingleChildScrollView(child: offersMenuContainer(context)),
          tab: SingleChildScrollView(
            child: Center(
                child: offersMenuContainer(context,
                    mediaQueryDevided: 1.5, height: 60, iconRadius: 23)),
          ),
        ));
  }

  Container offersMenuContainer(BuildContext context,
      {double mediaQueryDevided = 1,
      double height = 70,
      double iconRadius = 28}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width / mediaQueryDevided,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          offersList(
            context,
            page: CustomTabs(
              title: "$titleAppBar Call Offers",
              listName: "call",
              jsonFilePath: jsonFilePath,
              jazz: jazz,
              iconColor: color,
              backgroundColor: backgroundColor,
            ),
            color: color,
            icon: Icons.call,
            iconRadius: iconRadius,
            height: height,
            title: "Call Offers",
          ),
          offersList(context,
              page: CustomTabs(
                title: "$titleAppBar SMS Offers",
                listName: "sms",
                jsonFilePath: jsonFilePath,
                jazz: jazz,
                iconColor: color,
                backgroundColor: backgroundColor,
              ),
              color: color,
              icon: Icons.sms,
              iconRadius: iconRadius,
              height: height,
              title: "SMS Offers"),
          offersList(context,
              page: CustomTabs(
                title: "$titleAppBar Internet Offers",
                listName: "internet",
                jsonFilePath: jsonFilePath,
                jazz: jazz,
                iconColor: color,
                backgroundColor: backgroundColor,
              ),
              color: color,
              icon: Icons.wifi,
              iconRadius: iconRadius,
              height: height,
              title: "Internet Offers"),
          offersList(context,
              page: OffersPage(
                title: "$titleAppBar Location Base Offers",
                showAppBar: true,
                listName: "locationBase",
                jsonFilePath: jsonFilePath,
                iconColor: color,
                backgroundColor: backgroundColor,
              ),
              color: color,
              icon: Icons.location_on,
              iconRadius: iconRadius,
              height: height,
              title: "Location Based Offers"),
          offersList(context,
              page: OffersPage(
                title: "$titleAppBar Other Offers",
                showAppBar: true,
                listName: "others",
                jsonFilePath: jsonFilePath,
                iconColor: color,
                backgroundColor: backgroundColor,
              ),
              color: color,
              icon: Icons.card_giftcard,
              iconRadius: iconRadius,
              height: height,
              title: "Other Offers"),
        ],
      ),
    );
  }
}

Widget offersList(BuildContext context,
    {@required Widget page,
    Color color,
    String title,
    IconData icon,
    double height,
    double iconRadius}) {
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    ),
    child: Container(
      padding: EdgeInsets.all(3),
      height: height,
      child: Card(
        shape: StadiumBorder(),
        elevation: 5,
        color: color,
        child: Row(
          children: [
            CircleAvatar(
              radius: iconRadius,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: color,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                title,
                textScaleFactor: 1.5,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
