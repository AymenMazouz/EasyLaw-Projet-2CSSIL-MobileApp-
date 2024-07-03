import "dart:developer";

import "package:flutter/material.dart";
import "package:qanoun_sahl/models/djarida.dart";
import "package:qanoun_sahl/services/djarida_service.dart";

class DjaridaProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;
  bool keepLoading = false;
  String? searchQuery,
      ministry,
      textNumber,
      textType,
      journalStartDate,
      journalEndDate,
      signatureStartDate,
      signatureEndDate,
      field;

  DjaridaProvider({
    this.searchQuery,
    this.ministry,
    this.textNumber,
    this.textType,
    this.journalStartDate,
    this.journalEndDate,
    this.signatureStartDate,
    this.signatureEndDate,
    this.field,
  }) {
    keepLoading = false;
    allDjarida = [];
    getDjarida(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getDjarida(page: page++);
      }
    });
  }

  List<Djarida> allDjarida = [];

  bool isLoading = true;

  void getDjarida({int page = 1}) async {
    isLoading = true;
    final data = await DjaridaService.getLaws(
      searchQuery: searchQuery ?? "",
      ministry: ministry ?? "",
      textNumber: textNumber ?? "",
      textType: textType ?? "",
      journalStartDate: journalStartDate ?? "",
      journalEndDate: journalEndDate ?? "",
      signatureStartDate: signatureStartDate ?? "",
      signatureEndDate: signatureEndDate ?? "",
      field: field ?? "",
      perPage: perPage,
      page: page,
    );
    allDjarida.addAll(data["data"]);
    isLoading = false;
    keepLoading = data["hasMore"] as bool;
    notifyListeners();
  }
}
