import 'package:flutter/material.dart';


// ignore: must_be_immutable
class TextInputField extends StatelessWidget {
  TextInputField({super.key, required this.title, required this.labelHint, required this.content});

  String title;
  String labelHint;
  void Function(String) content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
            child: TextField(
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.name,
              onChanged: content,
              decoration: InputDecoration(
                  labelText: labelHint
              ),
            )
        )
      ],
    );
  }
}