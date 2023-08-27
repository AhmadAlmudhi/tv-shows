import 'package:flutter/material.dart';

class ShowTitle extends StatelessWidget {
  const ShowTitle({
    super.key,
    required this.showName,
  });

  final String showName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Center(
        child: Text(
          showName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
