import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/login_screen/login_screen_provider.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_textstyle.dart';

class AlertDialogBoxWidget extends ConsumerStatefulWidget {
  Widget content;
  String buttonString;
  AlertDialogBoxWidget(
      {required this.buttonString, required this.content, Key? key})
      : super(key: key);
  @override
  _AlertDialogBoxWidgetState createState() => _AlertDialogBoxWidgetState();
}

class _AlertDialogBoxWidgetState extends ConsumerState<AlertDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,

      content: SingleChildScrollView(child: widget.content),
      title: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),

      //  SignupWidget(),

      actions: [
        const Divider(
          color: AppColors.borderColor,
        ),
        TextButton(
            style: ButtonStyle(
                backgroundColor: ref.watch(textFieldProvider).contains("")
                    ? MaterialStateProperty.all<Color>(AppColors.blackColor)
                    : MaterialStateProperty.all<Color>(
                        AppColors.buttonactiveColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            onPressed: () {
              print(screenWidth * 0.446);
            },
            child: Text(
              widget.buttonString,
              // AppStrings.next,
              style: AppTextStyle.subText.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
