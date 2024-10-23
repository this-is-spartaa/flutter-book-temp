import 'dart:convert';

import 'package:flutter_book_app/data/model/book_response.dart';
import 'package:http/http.dart';

class NaverBookRepository {
  Future<BookResponse?> search(String query) async {
    try {
      final client = Client();
      final result = await client.get(
          Uri.parse(
              'https://openapi.naver.com/v1/search/book.json?query=$query'),
          headers: {
            'X-Naver-Client-Id': 'Fr8WRdHW93iHVIUdQ_Ph',
            'X-Naver-Client-Secret': '9B_N4Opr9x',
          });

      if (result.statusCode == 200) {
        return BookResponse.fromJson(jsonDecode(result.body));
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
