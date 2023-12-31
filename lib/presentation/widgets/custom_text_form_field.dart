import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/colors.dart';

class CustomTextFormField1 extends StatelessWidget {
  const CustomTextFormField1({
    Key? key,
    required this.nameControler,
    required this.hintText,
    required this.validator,
    this.maxLength,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController nameControler;
  final String hintText;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      controller: nameControler,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: mediumGrey.withOpacity(0.4),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: mediumGrey.withOpacity(0.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: green),
        ),
      ),
      validator: validator,
    );
  }
}
