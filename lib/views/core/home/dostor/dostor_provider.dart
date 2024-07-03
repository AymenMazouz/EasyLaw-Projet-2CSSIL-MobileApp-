import "dart:developer";

import "package:flutter/material.dart";
import "package:qanoun_sahl/models/dostor.dart";
import "package:qanoun_sahl/services/dostor_service.dart";

class DostorProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;
  bool keepLoading = false;
  String? searchQuery,
      sectionNumber,
      sectionName,
      chapterNumber,
      chapterName,
      articleNumber;

  DostorProvider({
    this.searchQuery,
    this.sectionNumber,
    this.sectionName,
    this.chapterNumber,
    this.chapterName,
    this.articleNumber,
  }) {
    keepLoading = false;
    allDostor = [];
    getConstitutions(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getConstitutions(page: page++);
      }
    });
  }

  List<Dostor> allDostor = [];

  bool isLoading = true;

  void getConstitutions({int page = 1}) async {
    isLoading = true;
    final data = await DostorService.getConstitutions(
      searchQuery: searchQuery ?? "",
      articleNumber: articleNumber ?? "",
      chapterNumber: chapterNumber ?? "",
      chapterName: chapterName ?? "",
      sectionNumber: sectionNumber ?? "",
      sectionName: sectionName ?? "",
      perPage: perPage,
      page: page,
    );
    allDostor.addAll(data["data"]);
    isLoading = false;
    keepLoading = data["hasMore"] as bool;
    notifyListeners();
  }
}
