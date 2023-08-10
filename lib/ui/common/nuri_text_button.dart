// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NuriTextButton extends StatelessWidget {
  NuriTextButton({super.key, required this.title, this.textStyle});

  String title;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(title,style: textStyle,),
      onTap: (){

      },
    );
  }
}
