import 'package:appandup_take_home/models/best_sellers_list.dart';
import 'package:appandup_take_home/provider/book_list.dart';
import 'package:appandup_take_home/ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  final index;
  DetailPage({required this.index});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<NetworkManager>(context, listen: false).getBook();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final _currentBestSellers =
        Provider.of<NetworkManager>(context, listen: false).currentBestsellers;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                CustomAppBar(
                  leadingIcon: Icons.arrow_back_ios,
                  leadingIconCallBack: () {
                    Navigator.pop(context);
                  },
                  avatarImage: NetworkImage(user.photoURL!),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    _currentBestSellers[widget.index].bookImage.toString(),
                    height: 375.0,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          _descriptionBox(context, _currentBestSellers),
        ],
      ),
    );
  }

  Column _descriptionBox(
      BuildContext context, List<Books> _currentBestSellers) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          color: Color(0xFFEFEFEF),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: _currentBestSellers == null
                      ? LinearProgressIndicator(
                          color: Colors.black,
                          backgroundColor: Colors.black.withOpacity(0.5),
                        )
                      : Text(
                          _currentBestSellers[widget.index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
                Text(
                  _currentBestSellers[widget.index].description.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        BottomButtons(
          url: _currentBestSellers[widget.index].amazonProductUrl.toString(),
        ),
      ],
    );
  }
}

class BottomButtons extends StatelessWidget {
  final String url;
  const BottomButtons({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      color: Color(0xFFFFFFFFF),
      child: Row(
        children: [
          Container(
            color: Color(0xFFEFEFEF),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(right: 20.0),
            child: IconButton(
              constraints: BoxConstraints.tight(Size(25, 25)),
              padding: EdgeInsets.zero,
              icon: Icon(CupertinoIcons.tag_fill),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CustomTextButton(
                label: 'Buy Book',
                onPressed: () =>
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return SafeArea(child: WebView(initialUrl: url));
                    }))),
          )
        ],
      ),
    );
  }
}
