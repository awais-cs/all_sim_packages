import 'dart:convert';

import 'package:all_sim_packages/models/cardInfo.dart';
import 'package:all_sim_packages/widgets/basicInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'detailPage.dart';

class OffersPage extends StatefulWidget {
  final bool showAppBar;
  final String listName;
  final String title;
  final String listMonthly;
  final String jsonFilePath;
  final Color iconColor;
  final Color backgroundColor;

  const OffersPage(
      {Key key,
      this.showAppBar = false,
      this.listName = "",
      this.title = "",
      this.listMonthly = "",
      this.iconColor,
      this.backgroundColor,
      this.jsonFilePath = "assets/files/jazzCall.json"})
      : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState(
      this.showAppBar,
      this.listName,
      this.title,
      this.listMonthly,
      this.jsonFilePath,
      this.iconColor,
      this.backgroundColor);
}

class _OffersPageState extends State<OffersPage> {
  final bool showAppBar;
  final String listName;
  final String title;
  final String listMonthly;
  final String jsonFilePath;
  final Color iconColor;
  final Color backgroundColor;

  _OffersPageState(this.showAppBar, this.listName, this.title, this.listMonthly,
      this.jsonFilePath, this.iconColor, this.backgroundColor);
  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    final jsonFile = await rootBundle.loadString(jsonFilePath);
    final decodedData = jsonDecode(jsonFile);
    var fileData = decodedData[listName];

    CardInfoModel.cardInfolist = List.from(fileData)
        .map<CardInfo>((cardInfolist) => CardInfo.fromMap(cardInfolist))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: showAppBar == false
          ? null
          : AppBar(
              backgroundColor: iconColor,
              title: Text(title),
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: (CardInfoModel.cardInfolist != null &&
                CardInfoModel.cardInfolist.isNotEmpty)
            ? ListView.builder(
                itemCount: CardInfoModel.cardInfolist.length,
                itemBuilder: (context, index) {
                  final cardInfo = CardInfoModel.cardInfolist[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(cardInfo: cardInfo),
                        ),
                      );
                    },
                    child: BasicInfoCard(
                      cardInfo: cardInfo,
                      iconColor: iconColor,
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
