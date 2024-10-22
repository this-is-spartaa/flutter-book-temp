class NaverBookItem {
  NaverBookItem({
    required this.title,
    required this.link,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  factory NaverBookItem.fromJson(Map<String, dynamic> map) {
    return NaverBookItem(
      title: map['title'],
      link: map['link'],
      image: map['image'],
      author: map['author'],
      discount: map['discount'],
      publisher: map['publisher'],
      pubdate: map['pubdate'],
      isbn: map['isbn'],
      description: map['description'],
    );
  }
}
