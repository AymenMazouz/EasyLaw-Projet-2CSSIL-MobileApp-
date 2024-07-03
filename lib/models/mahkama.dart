import 'dart:convert';

class Mahkama {
  final int number;
  final String subject;
  final String reference;
  final String principle;
  final String date;
  final String parties;
  final String verdict;
  final String president;
  final String reportingJudge;
  final String groundAppeal;
  final String response;
  final List<String> keywords;

  Mahkama({
    required this.number,
    required this.subject,
    required this.reference,
    required this.principle,
    required this.date,
    required this.parties,
    required this.verdict,
    required this.president,
    required this.reportingJudge,
    required this.groundAppeal,
    required this.response,
    required this.keywords,
  });

  Mahkama copyWith({
    int? number,
    String? subject,
    String? reference,
    String? principle,
    String? date,
    String? parties,
    String? verdict,
    String? president,
    String? reportingJudge,
    String? groundAppeal,
    String? response,
    List<String>? keywords,
  }) {
    return Mahkama(
      number: number ?? this.number,
      subject: subject ?? this.subject,
      reference: reference ?? this.reference,
      principle: principle ?? this.principle,
      date: date ?? this.date,
      parties: parties ?? this.parties,
      verdict: verdict ?? this.verdict,
      president: president ?? this.president,
      reportingJudge: reportingJudge ?? this.reportingJudge,
      groundAppeal: groundAppeal ?? this.groundAppeal,
      response: response ?? this.response,
      keywords: keywords ?? this.keywords,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'subject': subject,
      'reference': reference,
      'principle': principle,
      'date': date,
      'parties': parties,
      'verdict': verdict,
      'president': president,
      'reporting_judge': reportingJudge,
      'ground_of_appeal': groundAppeal,
      'supreme_court_response': response,
      'keywords': keywords,
    };
  }

  factory Mahkama.fromMap(Map<String, dynamic> map) {
    return Mahkama(
      number: map['number'] as int,
      subject: map['subject'] ?? "",
      reference: map['reference'] ?? "",
      principle: map['principle'] ?? "",
      date: map['date'] ?? "",
      parties: map['parties'] ?? "",
      verdict: map['verdict'] ?? "",
      president: map['president'] ?? "",
      reportingJudge: map['reporting_judge'] ?? "",
      groundAppeal: map['ground_of_appeal'] ?? "",
      response: map['supreme_court_response'] ?? "",
      keywords: List<String>.from((map['keywords'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mahkama.fromJson(String source) =>
      Mahkama.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MahkamaResult(number: $number, subject: $subject, reference: $reference, principle: $principle, date: $date, parties: $parties, verdict: $verdict, president: $president, reportingJudge: $reportingJudge, groundAppeal: $groundAppeal, response: $response, keywords: $keywords)';
  }
}
