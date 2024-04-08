import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/card_event.dart';
import 'package:task/bloc/card_state.dart';
import 'package:task/data/api_provider/api_provider.dart';
import 'package:task/data/models/my_respons/my_respons.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  ApiProvider apiProvider;

  CardBloc({required this.apiProvider}) : super(LoadingState()) {
    on<CallCardEvent>(_callProducts);
    on<SolveCardEvent>(_solveCard);
  }

  _callProducts(CallCardEvent callProduct, Emitter<CardState> emit) async {
    emit(LoadingState());
    MyResponse myResponse = await apiProvider.callCards();
    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      emit(OkState(cards: myResponse.data));
    }
  }

  _solveCard(SolveCardEvent solveCardEvent, Emitter<CardState> emit) async {
    solveCardEvent.cardModelOn = solveCardEvent.cardModelOn.copyWith(
        amount: solveCardEvent.cardModelOn.amount - solveCardEvent.money);
    solveCardEvent.cardModelTo = solveCardEvent.cardModelTo.copyWith(
        amount: solveCardEvent.cardModelTo.amount + solveCardEvent.money);

    MyResponse myResponse = await apiProvider.updateCards(
        cardModel: [solveCardEvent.cardModelOn, solveCardEvent.cardModelTo]);

    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      emit(OkState(cards: myResponse.data));
    }
  }
}
