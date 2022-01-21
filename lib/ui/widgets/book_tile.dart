import 'package:flutter/material.dart';


class BookTile extends StatelessWidget {
  String? author;
  // double? rating;
  String? category;
  String? imageLink;
  String? title;
  void Function() onTap;

  BookTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.author,
    required this.category,
    required this.imageLink,

    // required this.rating
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(10.0),
        height: 125.0,
        width: 250.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF40000000),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 75.0,
              height: 200.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11.0),
                child: imageLink != null
                    ? Image.network(
                        imageLink!,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        'assets/images/book_logo.png',
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20.0),
                SizedBox(
                  width: 200.0,
                  child: Text(
                    'by $author',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200.0,
                  child: Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  '⭐ 4.2',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  child: category == null
                      ? SizedBox()
                      : Text(
                          category!,
                          style: TextStyle(
                              fontSize: 10.0, color: Colors.blue[800]),
                        ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
