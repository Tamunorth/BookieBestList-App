import 'dart:convert';

import 'package:appandup_take_home/models/best_sellers_list.dart';
import 'package:appandup_take_home/models/search_results.dart' as searchResult;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

String apiKey = 'tcmVGd19LM9m8qDAFysL44hmlmAcrZLw';

class NetworkManager extends ChangeNotifier {
  List<Books> _currentBestsellers = [];

  List<Books> get currentBestsellers {
    return [..._currentBestsellers];
  }

  List<searchResult.Results> _searchResults = [];

  List<searchResult.Results> get searchResults {
    return [..._searchResults];
  }

  Future<BestSellersList?> getBook() async {
    List<Books> loadedBooks = [];

    String apiUrl =
        'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=$apiKey';
    BestSellersList? bestSellers;
    Uri url = Uri.parse(apiUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        bestSellers = BestSellersList.fromJson(jsonDecode(response.body));
        bestSellers.results!.books!.forEach((book) {
          loadedBooks.add(book);
        });
        _currentBestsellers = loadedBooks;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return bestSellers;
  }

  Future<searchResult.SearchResults?> getSearchResults(
      String searchText) async {
    print('getresukts fired');
    List<searchResult.Results> loadedBooks = [];

    String apiUrl =
        'https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?title=$searchText&api-key=$apiKey';
    searchResult.SearchResults? bestSellers;
    Uri url = Uri.parse(apiUrl);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        bestSellers =
            searchResult.SearchResults.fromJson(jsonDecode(response.body));
        bestSellers.results!.forEach((result) {
          loadedBooks.add(result);
        });
        _searchResults = loadedBooks;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return bestSellers;
  }
}
