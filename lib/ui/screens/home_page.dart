import 'package:appandup_take_home/models/best_sellers_list.dart';
import 'package:appandup_take_home/provider/book_list.dart';
import 'package:appandup_take_home/ui/screens/detail_page.dart';
import 'package:appandup_take_home/ui/widgets/widgets.dart';
import 'package:appandup_take_home/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///context.watch<User?>()!.email.toString() (TO get user data)

  Future<BestSellersList?>? _book;

  final searchController = TextEditingController();

  List<String> bookImages = [
    'assets/images/book1.png',
    'assets/images/book1.png',
    'assets/images/book1.png',
    'assets/images/book1.png',
    'assets/images/book1.png',
  ];

  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _book = Provider.of<NetworkManager>(context, listen: false).getBook();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //This returns the current  firebase user and all its identifying parameters
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  avatarImage: user.photoURL == null
                      ? AssetImage('assets/images/book_logo.png')
                      : NetworkImage(user.photoURL!),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text('Discover',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                      )),
                ),
                SearchTextField(
                  controller: searchController,
                  onSubmitted: (searchText) async {
                    await Provider.of<NetworkManager>(context, listen: false)
                        .getSearchResults(searchText);
                    Navigator.pushNamed(
                        context, RoutingConstants.SearchResultsRoute);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Best Sellers',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SingleChildScrollView(
          //   physics: BouncingScrollPhysics(),
          //   padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //       children: bookImages
          //           .map((e) => Container(
          //                 height: 150.0,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10.0),
          //                 ),
          //                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
          //                 child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(11.0),
          //                     child: Image.asset('assets/images/book1.png')),
          //               ))
          //           .toList()),
          // ),
          FutureBuilder<BestSellersList?>(
              future: _book,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        // shrinkWrap: true,
                        itemCount: snapshot.data!.numResults,
                        itemBuilder: (context, index) {
                          return BookTile(
                            title: snapshot.data!.results!.books![index].title,
                            author:
                                snapshot.data!.results!.books![index].author,
                            category: snapshot.data!.results!.listName,
                            imageLink:
                                snapshot.data!.results!.books![index].bookImage,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailPage(
                                  index: index,
                                );
                              }));
                            },
                          );
                        }),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return const Text(
                    'Tor,\n Casala don burst o!!!,\n You go need chill small try am again\n 🤧',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: Colors.black, strokeWidth: 3.0));
                }
              }),
          // BookListView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        iconSize: 30.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}
