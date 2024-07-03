import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/qadaa.dart';

class QadaaService {
  static Future<Map<String, dynamic>> getConseils({
    String searchQuery = "",
    String number = "",
    String procedure = "",
    String chamber = "",
    String startDate = "",
    String endDate = "",
    int perPage = 10,
    int page = 1,
  }) async {
    bool hasMore = false;
    List<Qadaa> conseils = [];
    String url =
        "$BASE_URL/conseil-etat/search?${searchQuery != "" ? "&search_query=$searchQuery" : ""}${number != "" ? "&number=$number" : ""}${procedure != "" ? "&procedure=$procedure" : ""}${chamber != "" ? "&chamber=$chamber" : ""}${startDate != "" ? "&start_date=$startDate" : ""}${endDate != "" ? "&end_date=$endDate" : ""}&page=$page&per_page=$perPage";
    log(url);
    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      hasMore = decodedResponse["has_more"];
      for (var item in decodedResponse['data']) {
        conseils.add(Qadaa.fromMap(item));
      }
    }
    return {"hasMore": hasMore, "data": conseils};
  }
}
