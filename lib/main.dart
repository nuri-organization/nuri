import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/home.dart';
import 'package:nuri/nuri_observer.dart';

void main() {
  Bloc.observer = NuriObserver();
  runApp(const NuriApp());
}

class NuriApp extends MaterialApp{
  const NuriApp({super.key}) : super(
      home: const HomePage()
  );
}
