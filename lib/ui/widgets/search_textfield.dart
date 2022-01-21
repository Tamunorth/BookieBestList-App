import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;

  SearchTextField({
    this.hintText = 'Search for books...',
    required this.controller,
    this.onSubmitted,
  });

  final OutlineInputBorder _borderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(10.0),
  );

  final TextEditingController controller;
  final Function(String)? onSubmitted;

  final Color accent1 = Color(0xffC4C4C4);
  final Color accent2 = Color(0xff9E9E9E);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffE8E8E8),
        focusColor: Color(0xff6C2C00),
        prefixIcon: Icon(
          Icons.search,
          color: accent1,
          size: 30.0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: hintText,
        labelStyle: TextStyle(color: accent2),
        focusedBorder: _borderStyle.copyWith(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: _borderStyle,
      ),
    );
  }
}
