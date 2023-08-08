import 'package:flutter/material.dart';

Future nuriDialog (BuildContext context, List<Widget> children){
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children
        ),
      ),
    ),
  );
}