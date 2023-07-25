import 'package:flutter/material.dart';
import 'package:nuri/config/scaffold.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      isInAppbar: false,
      child: const SafeArea(
        child: Column(
          children: [
            Text("error page!"),
            Text("알 수 없는 이유로 오류가 발생했습니다.")
          ],
        ),
      ),
    );
  }
}
