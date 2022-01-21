import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final void Function() onPressed; // or VoidCallBack
  final double? width;

  const CustomTextButton({
    required this.label,
    required this.onPressed,
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0, top: 0.0),
      child: SizedBox(
        height: 50.0,
        width: width,
        child: TextButton(
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
