import 'package:flutter_book_app/data/model/book.dart';

class BookResponse {
  BookResponse({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
    required this.items,
  });
  String lastBuildDate;
  int total;
  int start;
  int display;
  List<Book> items;

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      lastBuildDate: json['lastBuildDate'],
      total: json['total'],
      start: json['start'],
      display: json['display'],
      items: List.of(json['items']).map((e) {
        return Book.fromJson(e);
      }).toList(),
    );
  }
}
