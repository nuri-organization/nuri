import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatefulWidget {
  ProfileDetailScreen({super.key, required this.userId});

  String userId;

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
