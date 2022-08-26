import 'package:flutter/material.dart';

import '../../../core/global/styles/app_colors/app_colors_dark.dart';
import '../../../core/utils/values_manager.dart';

class TextFormFieldComponent extends StatelessWidget {
  final Function(String?) onChanged;
  final String hintText;

  const TextFormFieldComponent({
    Key? key,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: AppColorsDark.redAccentColor,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(AppSize.s10),
        hintText: hintText,
      ),
    );
  }
}
