import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        data,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.left,
      ),
    );
  }
}
