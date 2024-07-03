import 'package:flutter/foundation.dart';
import 'package:qanoun_sahl/views/core/home/home_screen.dart';

class HomeProvider extends ChangeNotifier {
  SearchCategory searchCategory = SearchCategory.Mahkama;

  void changeCategory(SearchCategory category) {
    searchCategory = category;
    notifyListeners();
  }
}
