import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text.dart';

class SettingField extends StatelessWidget {
  const SettingField({
    super.key,
    required this.light,
    required this.onChange,
    required this.data,
  });

  final bool light;
  final Function(bool value) onChange;
  final String data;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(data: data),
        Switch(
          thumbIcon: thumbIcon,
          value: light,
          onChanged: (bool value) {
            onChange.call(value);
          },
        ),
      ],
    );
  }
}
