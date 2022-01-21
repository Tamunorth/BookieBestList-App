import 'package:appandup_take_home/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leadingIcon;
  final VoidCallback? leadingIconCallBack;
  final avatarImage;

  const CustomAppBar({
    Key? key,
    this.leadingIcon = Icons.menu,
    this.leadingIconCallBack,
    this.avatarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 30.0,
            icon: Icon(leadingIcon),
            onPressed: leadingIconCallBack,
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthService>().signOut();
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundColor: CupertinoColors.black,
              backgroundImage: avatarImage,
            ),
          ),
        ],
      ),
    );
  }
}
