import 'package:flutter/material.dart';

class KegiatanEmptyWidget extends StatelessWidget {
  final String message;

  const KegiatanEmptyWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }
}
