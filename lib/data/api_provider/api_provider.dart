import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/data/api_provider/api_clint.dart';
import 'package:task/data/models/card/card_model.dart';
import 'package:task/data/models/my_respons/my_respons.dart';

String token = "-HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ";

class ApiProvider extends ApiClient {
  Future<MyResponse> callCards() async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.get(
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = (response.data["items"] as List?)
            ?.map((e) => CardModel.fromJson(e))
            .toList() ??
            [];
        debugPrint(myResponse.data.toString());
      }
    } catch (_) {
      debugPrint("asdfasd");
    }
    // debugPrint(myResponse.data.toString());

    return myResponse;
  }

  Future<MyResponse> updateCards({required List<CardModel> cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.put(
        data: jsonEncode([
          cardModel[0].toJsonForUpdate(),
          cardModel[1].toJsonForUpdate(),

        ]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      // Response response = await dio.put(
      //   "https://crudapi.co.uk/api/v1/products",
      //   data: {
      //     [cardModels[0].toJsonForUpdate(), cardModels[0].toJsonForUpdate()]
      //   },
      //   options: Options(
      //     headers: {
      //       "Authorization": "Bearer $token",
      //       "Content-Type": "application/json"
      //     },
      //   ),
      //);
      // debugPrint(response.data.toString());

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }

    return myResponse;
  }
}
