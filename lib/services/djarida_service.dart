import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/djarida.dart';

class DjaridaService {
  static Future<Map<String, dynamic>> getLaws({
    String searchQuery = "",
    String ministry = "",
    String textNumber = "",
    String textType = "",
    String journalStartDate = "",
    String journalEndDate = "",
    String signatureStartDate = "",
    String signatureEndDate = "",
    String field = "",
    int perPage = 10,
    int page = 1,
  }) async {
    bool hasMore = false;
    List<Djarida> laws = [];
    String url =
        "$BASE_URL/laws/search?${ministry != "" ? "&ministry=$ministry" : ""}${searchQuery != "" ? "&search_query=$searchQuery" : ""}${textNumber != "" ? "&text_number=$textNumber" : ""}${textType != "" ? "&text_type=$textType" : ""}${journalStartDate != "" ? "&journal_start_date=$journalStartDate" : ""}${journalEndDate != "" ? "&journal_end_date=$journalEndDate" : ""}${signatureStartDate != "" ? "&signature_start_date=$signatureStartDate" : ""}${signatureEndDate != "" ? "&signature_end_date=$signatureEndDate" : ""}&page=$page&per_page=$perPage";

    log(url);
    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      hasMore = decodedResponse["has_more"];
      for (var item in decodedResponse['data']) {
        laws.add(Djarida.fromMap(item));
      }
    }
    return {"hasMore": hasMore, "data": laws};
  }
}
