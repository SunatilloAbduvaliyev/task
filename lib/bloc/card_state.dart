import '../data/model.dart';

abstract class CardState {}

class LoadingState extends CardState {}

class ErrorState extends CardState {
  String errorText;

  ErrorState({required this.errorText});
}

class OkState extends CardState {
  List<CardModel> cards;

  OkState({required this.cards});
}