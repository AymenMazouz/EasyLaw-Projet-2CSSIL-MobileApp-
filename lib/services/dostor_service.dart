import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/dostor.dart';

class DostorService {
  static Future<Map<String, dynamic>> getConstitutions({
    String searchQuery = "",
    String articleNumber = "",
    String chapterNumber = "",
    String chapterName = "",
    String sectionNumber = "",
    String sectionName = "",
    int perPage = 10,
    int page = 1,
  }) async {
    bool hasMore = false;
    List<Dostor> constitutions = [];
    String url =
        "$BASE_URL/constitution/search?${searchQuery != "" ? "&search_query=$searchQuery" : ""}${articleNumber != "" ? "&article_number=$articleNumber" : ""}${chapterNumber != "" ? "&chapter_number=$chapterNumber" : ""}${chapterName != "" ? "&chapter_name=$chapterName" : ""}${sectionNumber != "" ? "&section_number=$sectionNumber" : ""}${sectionName != "" ? "&section_name=$sectionName" : ""}&page=$page&per_page=$perPage";
    log(url);
    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      hasMore = decodedResponse["has_more"];
      log(decodedResponse['data'].toString());
      for (var item in decodedResponse['data']) {
        constitutions.add(Dostor.fromMap(item));
      }
    }
    return {"hasMore": hasMore, "data": constitutions};
  }
}
