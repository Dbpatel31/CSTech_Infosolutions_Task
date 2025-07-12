import 'package:csteachassignment/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? prefixImagePath;
  final String? suffixImagePath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixImagePath,
    this.controller,
    this.validator,
    this.suffixImagePath
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(

        hintText: hintText,
        suffixIcon:  prefixImagePath != null
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            prefixImagePath!,
            width: 20,
            height: 20,
          ),
        )
            : null,
        prefixIcon:  suffixImagePath != null
            ? Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            suffixImagePath!,
            width: 20,
            height: 20,
          ),
        ) : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.borders,
            width: 1.0
          )
        ),

      ),

    );
  }
}
