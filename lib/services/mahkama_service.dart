import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/mahkama.dart';

class MahkamaService {
  static Future<Map<String, dynamic>> getCourts({
    String searchQuery = "",
    String decisionSubject = "",
    String startDate = "",
    String endDate = "",
    String decisionNumber = "",
    int perPage = 10,
    int page = 1,
  }) async {
    bool hasMore = false;
    List<Mahkama> courts = [];
    String url =
        "$BASE_URL/supreme-court/search?${searchQuery != "" ? "search_query=$searchQuery" : ""}${decisionNumber != "" ? "&decision_number=$decisionNumber" : ""}${decisionSubject != "" ? "&decision_subject=$decisionSubject" : ""}${startDate != "" ? "&start_date=$startDate" : ""}${endDate != "" ? "&end_date=$endDate" : ""}&page=$page&per_page=$perPage";
    log(url);

    log("HELLO");

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      hasMore = decodedResponse["has_more"];
      for (var item in decodedResponse['data']) {
        courts.add(Mahkama.fromMap(item));
      }
    }
    return {"hasMore": hasMore, "data": courts};
  }
}




//${searchQuery != null ? "&search_query=$searchQuery" : ""}
