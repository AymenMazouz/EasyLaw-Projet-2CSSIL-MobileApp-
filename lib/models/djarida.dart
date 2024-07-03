import 'dart:convert';

class Djarida {
  final String id;
  final String signatureDate;
  final String journalDate;
  final String textType;
  final String textNumber;
  final String ministry;
  final String field;
  final String content;
  final String longContent;
  final int journalNumber;
  final int journalPage;

  Djarida({
    required this.id,
    required this.signatureDate,
    required this.journalDate,
    required this.textType,
    required this.textNumber,
    required this.ministry,
    required this.field,
    required this.content,
    required this.longContent,
    required this.journalNumber,
    required this.journalPage,
  });

  Djarida copyWith({
    String? id,
    String? signatureDate,
    String? journalDate,
    String? textType,
    String? textNumber,
    String? ministry,
    String? field,
    String? content,
    String? longContent,
    int? journalNumber,
    int? journalPage,
  }) {
    return Djarida(
      id: id ?? this.id,
      signatureDate: signatureDate ?? this.signatureDate,
      journalDate: journalDate ?? this.journalDate,
      textType: textType ?? this.textType,
      textNumber: textNumber ?? this.textNumber,
      ministry: ministry ?? this.ministry,
      field: field ?? this.field,
      content: content ?? this.content,
      longContent: longContent ?? this.longContent,
      journalNumber: journalNumber ?? this.journalNumber,
      journalPage: journalPage ?? this.journalPage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'signature_date': signatureDate,
      'journal_date': journalDate,
      'text_type': textType,
      'text_number': textNumber,
      'ministry': ministry,
      'field': field,
      'content': content,
      'long_content': longContent,
      'journal_num': journalNumber,
      'journal_page': journalPage,
    };
  }

  factory Djarida.fromMap(Map<String, dynamic> map) {
    return Djarida(
      id: map['_id'] as String,
      signatureDate: map['signature_date'] as String,
      journalDate: map['journal_date'] as String,
      textType: map['text_type'] as String,
      textNumber: map['text_number'] as String,
      ministry: map['ministry'] as String,
      field: map['field'] as String,
      content: map['content'] as String,
      longContent: map['long_content'] as String,
      journalNumber: map['journal_num'] as int,
      journalPage: map['journal_page'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Djarida.fromJson(String source) =>
      Djarida.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Law(id: $id, signature_date: $signatureDate, journal_date: $journalDate, text_type: $textType, text_number: $textNumber, ministry: $ministry, field: $field, content: $content, long_content: $longContent, journal_number: $journalNumber, journal_page: $journalPage)';
  }

  @override
  bool operator ==(covariant Djarida other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.signatureDate == signatureDate &&
        other.journalDate == journalDate &&
        other.textType == textType &&
        other.textNumber == textNumber &&
        other.ministry == ministry &&
        other.field == field &&
        other.content == content &&
        other.longContent == longContent &&
        other.journalNumber == journalNumber &&
        other.journalPage == journalPage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        signatureDate.hashCode ^
        journalDate.hashCode ^
        textType.hashCode ^
        textNumber.hashCode ^
        ministry.hashCode ^
        field.hashCode ^
        content.hashCode ^
        longContent.hashCode ^
        journalNumber.hashCode ^
        journalPage.hashCode;
  }
}
