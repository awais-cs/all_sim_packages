import 'package:flutter/material.dart';

class CardInfoModel {
  static List<CardInfo> cardInfolist;
  static List<CardInfo> cardInfolist2;
}

class CardInfo {
  final String id;
  final String image;
  final String campImage;
  final String name;
  final String onMins;
  final String offMins;
  final String sms;
  var mbs;
  final String validity;
  final String desc;
  var price;
  final Color color;
  final String rechargeReq;
  final String sub;
  final String unSub;
  final String status;
  final String info;
  final String valid;
  final String terms;
  CardInfo({
    this.id,
    this.image,
    this.campImage,
    this.name,
    this.onMins,
    this.offMins,
    this.sms,
    this.mbs,
    this.validity,
    this.desc,
    this.price,
    this.color,
    this.rechargeReq,
    this.sub,
    this.unSub,
    this.status,
    this.info,
    this.terms,
    this.valid,
  });

  factory CardInfo.fromMap(Map<String, dynamic> map) {
    return CardInfo(
      id: map["id"],
      name: map["name"],
      onMins: map["onMins"],
      offMins: map["offMins"],
      sms: map["sms"],
      mbs: map["mbs"],
      validity: map["validity"],
      desc: map["desc"],
      price: map["price"],
      // color: map["color"],
      image: map["image"],
      campImage: map["campImage"],
      status: map["status"],
      valid: map["valid"],
      sub: map["sub"],
      terms: map["map"],
      unSub: map["unsub"],
      rechargeReq: map["rechargeReq"],
      info:  map["info"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'onMins': onMins,
      'offMins': offMins,
      'sms': sms,
      'mbs': mbs,
      'validity': validity,
      'desc': desc,
      'price': price,
      'color': color.value,
      'image': image,
      'campImage': campImage,
      "status": status,
      "valid": valid,
      "sub": sub,
      "map": terms,
      "unsub": unSub,
      "rechargeReq": rechargeReq,
      "info": info,
    };
  }
}