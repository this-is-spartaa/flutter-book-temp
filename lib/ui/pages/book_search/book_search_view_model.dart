import 'package:flutter_book_app/data/model/book.dart';
import 'package:flutter_book_app/data/repository/naver_book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookSearchViewModel =
    NotifierProvider.autoDispose<BookSearchViewModel, List<Book>?>(
        BookSearchViewModel.new);

class BookSearchViewModel extends AutoDisposeNotifier<List<Book>?> {
  @override
  List<Book>? build() {
    return null;
  }

  final naverBookRepo = NaverBookRepository();

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      return;
    }
    final result = await naverBookRepo.search(query);
    state = result?.items ?? [];
  }
}
