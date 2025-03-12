import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quick_hitch/model/home/recent_search_model.dart';
import 'package:quick_hitch/repository/search_ride_repository/recent_search_repository.dart';
import 'package:quick_hitch/view_model/services/get_data/get_token.dart';

class RecentSearchViewModel with ChangeNotifier {
  RecentSearchModel? _recentSearch;
  RecentSearchModel? get recentSearch => _recentSearch;

  bool _getRecentSerchLoadingLoading = false;
  bool get getRecentSerchLoadingLoading => _getRecentSerchLoadingLoading;

  setRecentSerchLoading(bool value) {
    _getRecentSerchLoadingLoading = value;
    notifyListeners();
  }

  Future<void> recentSearches() async {
    try {
      setRecentSerchLoading(true);
      String token = await getToken();

      final recentSearches = await RecentSearchRepository().recentSearch(token);
      _recentSearch = recentSearches;
    } catch (e) {
      log("Error Recent Search rides: $e");
    } finally {
      setRecentSerchLoading(false);
      notifyListeners();
    }
  }
}
