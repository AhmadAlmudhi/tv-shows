import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    required this.onButtonPressed,
  });

  final Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(data: "error_message"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                onButtonPressed.call();
              },
              child: const CustomText(data: "try_again"),
            ),
          ),
        ],
      ),
    );
  }
}
