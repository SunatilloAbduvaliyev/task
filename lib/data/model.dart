import 'dart:ui';

import 'package:flutter/material.dart';

class CardModel {
  final String uuid;
  final String cardName;
  final String expireDate;
  final String cardNumber;
  final String ownerName;
  final double amount;
  final Color color;
  final String bankName;
  final bool isMain;

  CardModel({
    required this.color,
    required this.amount,
    required this.cardNumber,
    required this.expireDate,
    required this.bankName,
    required this.cardName,
    required this.isMain,
    required this.ownerName,
    required this.uuid,
  });

  CardModel copyWith({
    String? uuid,
    String? cardName,
    String? expireDate,
    String? cardNumber,
    String? ownerName,
    double? amount,
    Color? color,
    String? bankName,
    bool? isMain,
  }) {
    return CardModel(
      color: color ?? this.color,
      amount: amount ?? this.amount,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      bankName: bankName ?? this.bankName,
      cardName: cardName ?? this.cardName,
      isMain: isMain ?? this.isMain,
      ownerName: ownerName ?? this.ownerName,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "color": color.value, // Color obyektining .value xususiyati orqali rangni int ko'rinishida olish
      "amount": amount,
      "card_number": cardNumber,
      "expire_date": expireDate,
      "bank_name": bankName,
      "card_name": cardName,
      "is_main": isMain,
      "owner_name": ownerName,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "color": color.value, // Color obyektining .value xususiyati orqali rangni int ko'rinishida olish
      "_uuid": uuid,
      "amount": amount,
      "card_number": cardNumber,
      "expire_date": expireDate,
      "bank_name": bankName,
      "card_name": cardName,
      "is_main": isMain,
      "owner_name": ownerName,
    };
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      uuid: json["_uuid"] as String? ?? "",
      color: Color(json["color"] as int? ?? 0), // Int qiymatni Color obyektiga o'zgartirish
      amount: json["amount"] as double? ?? 0.0,
      cardNumber: json["card_number"] as String? ?? "",
      expireDate: json["expire_date"] as String? ?? "",
      bankName: json["bank_name"] as String? ?? "", // Mavjud key nomi bo'lib ban_name emas, bank_name bo'lishi kerak
      cardName: json["card_name"] as String? ?? "",
      isMain: json["is_main"] as bool? ?? false,
      ownerName: json["owner_name"] as String? ?? "",
    );
  }

  static initial() => CardModel(
    color: Colors.transparent, // Standart rangni o'rnating
    amount: 0.0,
    cardNumber: "",
    expireDate: "",
    bankName: "",
    cardName: "",
    isMain: false,
    ownerName: "",
    uuid: "",
  );
}
