import 'package:flutter/material.dart';
import 'package:flutter_book_app/ui/pages/book_detail/book_detail_page.dart';

class BookBottomSheet extends StatelessWidget {
  String imgUrl;
  String title;
  String author;
  String content;
  String link;

  BookBottomSheet({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.author,
    required this.content,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 50,
      ),
      child: Row(
        children: [
          Image.network(
            imgUrl,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return BookDetailPage(title: title, link: link);
                      },
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      '자세히 보기',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
