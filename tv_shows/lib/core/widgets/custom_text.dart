import 'package:flutter/material.dart';
import '../../features/settings/bloc/localization/utils/app_localization.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.tr(context),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
