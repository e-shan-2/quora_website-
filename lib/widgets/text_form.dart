import 'package:flutter/material.dart';
import 'package:social_app/utils/app_colors.dart';

// ignore: must_be_immutable
class TextFormFieldClass extends StatefulWidget {
  TextEditingController controller;
  void Function(String)? onChanged;
  String text;
  TextFormFieldClass(
      {this.onChanged,
      required this.text,
      required this.controller,
      super.key});

  @override
  State<TextFormFieldClass> createState() => _TextFormFieldClassState();
}

class _TextFormFieldClassState extends State<TextFormFieldClass> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.text,
        contentPadding: const EdgeInsets.only(bottom: 5, left: 5),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.borderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: AppColors.borderColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.borderColor)),

        //                           border: Border.all()
      ),
    );
  }
}
