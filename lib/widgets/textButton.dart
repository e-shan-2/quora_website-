import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextButtonClass extends ConsumerStatefulWidget {
  MaterialStateProperty<Color> backgroundColor;
  void Function()? onPressed;
  Widget text;
  TextButtonClass(
      {required this.text,
      required this.onPressed,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextButtonClassState();
}

class _TextButtonClassState extends ConsumerState<TextButtonClass> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: widget.backgroundColor,
          //     MaterialStateProperty.all<Color>(
          // AppColors.buttonTransparentColor,
          // ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      onPressed: widget.onPressed,
      child: widget.text,

      //  Text(
      //   AppStrings.signupEmail,
      //   style: AppTextStyle.subText
      //       .copyWith(color: Colors.white),
      // )
    );
  }
}
