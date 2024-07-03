import "dart:developer";

import "package:flutter/material.dart";
import "package:qanoun_sahl/models/qadaa.dart";
import "package:qanoun_sahl/services/qadaa_service.dart";

class QadaaProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  int page = 1;
  final int perPage = 10;

  String? searchQuery, number, procedure, chamber, startDate, endDate;

  bool keepLoading = false;

  QadaaProvider({
    this.searchQuery,
    this.number,
    this.procedure,
    this.chamber,
    this.startDate,
    this.endDate,
  }) {
    keepLoading = false;
    allConseils = [];
    getConseils(page: page++);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          getConseils(page: page++);
        });
      }
    });
  }

  List<Qadaa> allConseils = [];

  bool isLoading = true;

  void getConseils({int page = 1}) async {
    isLoading = true;
    final data = await QadaaService.getConseils(
      searchQuery: searchQuery ?? "",
      number: number ?? "",
      procedure: procedure ?? "",
      chamber: chamber ?? "",
      startDate: startDate ?? "",
      endDate: endDate ?? "",
      page: page,
      perPage: perPage,
    );
    allConseils.addAll(data["data"]);
    isLoading = false;
    keepLoading = data["hasMore"] as bool;
    notifyListeners();
  }
}
