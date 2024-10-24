import 'package:flutter/material.dart';
import 'package:flutter_book_app/ui/pages/book_search/book_search_view_model.dart';
import 'package:flutter_book_app/ui/widgets/book_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookSearchViewModel);
    final vm = ref.read(bookSearchViewModel.notifier);
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
              onSubmitted: vm.search,
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
                vm.search(textEditingController.text);
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
            itemCount: state?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = state![index];
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
                        link: item.link,
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
