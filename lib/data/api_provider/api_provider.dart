import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model.dart';
import '../models/my_respons/my_respons.dart';
import 'api_clint.dart';

String token = "-HiR8E4726kmzBbUClaexQdoTKoWNkoiauJUOvbUrj3940KWSQ";

class ApiProvider extends ApiClient {
  Future<MyResponse> callCards() async {
    try {
      Response response = await dio.get(
        "https://crudapi.co.uk/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return MyResponse(
            data: (response.data["items"] as List?)
                ?.map((e) => CardModel.fromJson(e))
                .toList() ??
                []
        );
      }
    } catch (error) {
      debugPrint(error.toString());
    }

    return MyResponse();
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

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }
    return myResponse;
  }

  Future<MyResponse> insertCards({required CardModel cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.post(
        data: jsonEncode([cardModel.toJson()]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        myResponse.data = "Query oky";
      }
    } catch (_) {
      debugPrint(_.toString());
      myResponse.errorText = "catch (_)";
    }
    return myResponse;
  }

  Future<MyResponse> deleteCards({required CardModel cardModel}) async {
    MyResponse myResponse = MyResponse();
    try {
      Response response = await dio.delete(
        data: jsonEncode([
          {"_uuid": cardModel.uuid}
        ]),
        "/api/v1/products",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

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