import 'package:flutter/material.dart';
import 'package:learn_material_3/extensions/build_context_extension.dart';
import 'package:learn_material_3/extensions/text_style_extension.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16).bold,
          ),
        ),
      ),
    );
  }
}
