
import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  final String label;
  final bool isTextObscured;
  final TextEditingController controller;

  const TextFieldBox({
    Key? key,
    required this.label,
    this.isTextObscured = false,
    required  this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Container(
          width: 300.0,
          padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
          child: TextField(
            onSubmitted: (value) {
              print(value);
              controller.text = value;
            },
            controller: controller,
            obscureText: isTextObscured,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
