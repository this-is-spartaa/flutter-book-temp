import 'package:flutter_book_app/model/naver_book_item.dart';

class NaverBookResponse {
  NaverBookResponse({
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
  List<NaverBookItem> items;

  factory NaverBookResponse.fromJson(Map<String, dynamic> json) {
    return NaverBookResponse(
      lastBuildDate: json['lastBuildDate'],
      total: json['total'],
      start: json['start'],
      display: json['display'],
      items: List.of(json['items']).map((e) {
        return NaverBookItem.fromJson(e);
      }).toList(),
    );
  }
}
