import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_book_app/book_bottom_sheet.dart';
import 'package:flutter_book_app/model/naver_book_item.dart';
import 'package:flutter_book_app/model/naver_book_response.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NaverBookItem>? items;
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onSubmitted(String value) async {
    print('onSubmitted called : $value');
    final client = Client();
    final result = await client.get(
        Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$value'),
        headers: {
          'X-Naver-Client-Id': 'Fr8WRdHW93iHVIUdQ_Ph',
          'X-Naver-Client-Secret': '9B_N4Opr9x',
        });

    if (result.statusCode == 200) {
      final res = NaverBookResponse.fromJson(jsonDecode(result.body));

      setState(() {
        items = res.items;
      });
    }
  }

  void onSearch() {
    onSubmitted(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 20, right: 10),
            width: double.infinity,
            height: 50,
            child: TextField(
              maxLines: 1,
              controller: textEditingController,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                border: MaterialStateOutlineInputBorder.resolveWith(
                  (states) {
                    // print(states);
                    // print(states.contains(WidgetState.focused));
                    if (states.contains(WidgetState.focused)) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      );
                    }
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    );
                  },
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10),
                //   borderSide: BorderSide(color: Colors.grey),
                // ),
              ),
            ),
          ),
          titleSpacing: 0,
          centerTitle: false, // for title spacing
          actions: [
            GestureDetector(
              onTap: onSearch,
              child: Container(
                color: Colors.transparent,
                width: 50,
                height: 50,
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: items?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = items![index];
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return BookBottomSheet(
                        imgUrl: item.image,
                        title: item.title,
                        author: item.author,
                        content: item.description,
                      );
                    },
                  );
                },
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
