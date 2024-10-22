import 'package:flutter/material.dart';
import 'package:flutter_book_app/book_bottom_sheet.dart';

class HomePage extends StatelessWidget {
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
              onSubmitted: (value) {
                print('onSubmitted called : $value');
              },
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
              onTap: () {
                print("test");
              },
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
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return BookBottomSheet(
                        imgUrl: 'https://image.yes24.com/goods/82935976/XL',
                        title: '해리포터',
                        author: 'J. K. 롤링',
                        content: '마법사의 돌을 찾아서',
                      );
                    },
                  );
                },
                child: Image.network(
                  'https://image.yes24.com/goods/82935976/XL',
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
