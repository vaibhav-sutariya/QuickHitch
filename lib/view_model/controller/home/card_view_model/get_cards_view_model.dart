import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:quick_hitch/model/home/card_model.dart';
import 'package:quick_hitch/repository/card_repository/get_card_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class GetCardsViewModel with ChangeNotifier {
  CardModel? _cardModel;
  CardModel? get cardModel => _cardModel;

  bool _getCardModelLoading = false;
  bool get getCardModelLoadingLoading => _getCardModelLoading;

  setCardModelLoading(bool value) {
    _getCardModelLoading = value;
    notifyListeners();
  }

  String? selectedCardId;

  void selectCard(String id) {
    selectedCardId = id == selectedCardId ? null : id; // Toggle selection
    notifyListeners();
  }

  Future<void> getAllCards() async {
    try {
      setCardModelLoading(true);
      String token = await getToken();

      final cards = await GetCardRepository().getCards(token);
      _cardModel = cards;
    } catch (e) {
      log("Error get cards: $e");
    } finally {
      setCardModelLoading(false);
      notifyListeners();
    }
  }

  Future<void> setDefaultCard(String cardId) async {
    try {
      setCardModelLoading(true);
      String token = await getToken();
      var data = {
        "cardId": cardId,
      };

      final card = await GetCardRepository().setDefaultCard(data, token);
      _cardModel = card;
    } catch (e) {
      log("Error set default card: $e");
    } finally {
      setCardModelLoading(false);
      notifyListeners();
    }
  }

  Future<void> deleteCard(String id) async {
    try {
      setCardModelLoading(true);
      String token = await getToken();

      final card = await GetCardRepository().deleteCard(id, token);
      _cardModel = card;
    } catch (e) {
      log("Error Delete card: $e");
    } finally {
      setCardModelLoading(false);
      notifyListeners();
    }
  }
}
