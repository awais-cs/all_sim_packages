import 'package:all_sim_packages/pages/offersPage.dart';
import 'package:flutter/material.dart';

class CustomTabs extends StatefulWidget {
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final String listName;
  final String jsonFilePath;
  final bool jazz;

  const CustomTabs(
      {Key key,
      this.iconColor,
      this.backgroundColor,
      this.title = "",
      this.listName = "",
      this.jsonFilePath = "assets/files/ufone.json",
      this.jazz = false})
      : super(key: key);
  @override
  _CustomTabsState createState() => _CustomTabsState(
      this.iconColor,
      this.backgroundColor,
      this.title,
      this.listName,
      this.jsonFilePath,
      this.jazz);
}

class _CustomTabsState extends State<CustomTabs> {
  Color iconColor;
  Color backgroundColor;
  String title;
  String listName;
  String jsonFilePath;
  bool jazz;

  _CustomTabsState(this.iconColor, this.backgroundColor, this.title,
      this.listName, this.jsonFilePath, this.jazz);

  final tabs = <Tab>[
    Tab(
        child: Text(
      "Daily/Weekly/Monthly",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    Tab(
        child: Text(
      "Hybrid/Others",
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: iconColor,
          title: Text(title),
          bottom: TabBar(
            tabs: tabs,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            OffersPage(
              title: "$title Call Offers",
              listName: listName,
              jsonFilePath: jsonFilePath,
              iconColor: iconColor,
              backgroundColor: backgroundColor,
            ),
            OffersPage(
              title: "$title others Offers",
              listName: jazz == true ? "othersHybrid" : "others$listName",
              jsonFilePath: jsonFilePath,
              iconColor: iconColor,
              backgroundColor: backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
