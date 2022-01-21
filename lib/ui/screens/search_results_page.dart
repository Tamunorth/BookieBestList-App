import 'package:appandup_take_home/provider/book_list.dart';
import 'package:appandup_take_home/ui/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snapshot = Provider.of<NetworkManager>(context).searchResults;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green,
          child: Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                // shrinkWrap: true,
                itemCount: snapshot.length,
                itemBuilder: (context, index) {
                  final url = 'https://www.nytimes.com/';

                  return BookTile(
                    title: snapshot[index].title,
                    author: snapshot[index].author,
                    category: 'No data',
                    imageLink: snapshot.toString(),
                    onTap: () {},
                  );
                }),
          ),
        ),
      ),
    );
  }
}
