// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Dostor {
  final String id;
  final int sectionNumber;
  final String sectionName;
  final int chapterNumber;
  final String chapterName;
  final int articleNumber;
  final String articleText;
  Dostor({
    required this.id,
    required this.sectionNumber,
    required this.sectionName,
    required this.chapterNumber,
    required this.chapterName,
    required this.articleNumber,
    required this.articleText,
  });

  Dostor copyWith({
    String? id,
    int? sectionNumber,
    String? sectionName,
    int? chapterNumber,
    String? chapterName,
    int? articleNumber,
    String? articleText,
  }) {
    return Dostor(
      id: id ?? this.id,
      sectionNumber: sectionNumber ?? this.sectionNumber,
      sectionName: sectionName ?? this.sectionName,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      chapterName: chapterName ?? this.chapterName,
      articleNumber: articleNumber ?? this.articleNumber,
      articleText: articleText ?? this.articleText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'section_number': sectionNumber,
      'section_name': sectionName,
      'chapter_number': chapterNumber,
      'chapter_name': chapterName,
      'article_number': articleNumber,
      'article_text': articleText,
    };
  }

  factory Dostor.fromMap(Map<String, dynamic> map) {
    return Dostor(
      id: map['_id'] ?? "",
      sectionNumber: (map['section_number'] ?? -1) + 1,
      sectionName: map['section_name'] ?? "",
      chapterNumber: (map['chapter_number'] ?? -1) + 1,
      chapterName: map['chapter_name'] ?? "",
      articleNumber: (map['article_number'] ?? -1) + 1,
      articleText: map['article_text'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Dostor.fromJson(String source) =>
      Dostor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dostor(id: $id, section_number: $sectionNumber, section_name: $sectionName, chapter_number: $chapterNumber, chapter_name: $chapterName, article_number: $articleNumber, article_text: $articleText)';
  }

  @override
  bool operator ==(covariant Dostor other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.sectionNumber == sectionNumber &&
        other.sectionName == sectionName &&
        other.chapterNumber == chapterNumber &&
        other.chapterName == chapterName &&
        other.articleNumber == articleNumber &&
        other.articleText == articleText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        sectionNumber.hashCode ^
        sectionName.hashCode ^
        chapterNumber.hashCode ^
        chapterName.hashCode ^
        articleNumber.hashCode ^
        articleText.hashCode;
  }
}
