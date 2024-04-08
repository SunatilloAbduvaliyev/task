import 'package:task/data/models/card/card_model.dart';

abstract class CardEvent {}

class CallCardEvent extends CardEvent {}

class SolveCardEvent extends CardEvent {
  CardModel cardModelOn;
  CardModel cardModelTo;
  double money;

  SolveCardEvent(
      {required this.cardModelOn,
      required this.cardModelTo,
      required this.money});
}
