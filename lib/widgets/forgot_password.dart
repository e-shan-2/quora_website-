import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/login_screen/login_screen_provider.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/text_form.dart';

// ignore: must_be_immutable
class ForgotPassword extends ConsumerStatefulWidget {
  bool value;
  ForgotPassword({this.value = true, Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  late TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.40,
      //  screenWidth * 0.35,
      height: widget.value ? screenHeight * 0.3 : screenHeight,
      // height: 270,

      // padding: const EdgeInsets.symmetric(horizontal: 14),
      constraints: const BoxConstraints(minWidth: 600
          // screenWidth * 1.16,
          ),
      // height:260 ,
      child: Form(
        onChanged: () {
          ref.read(textFieldProvider.notifier).onChanging([
            _emailController.text,
          ]);
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.value
                  ? const SizedBox()
                  // For webview
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, right: 14, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close)),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      ref.watch(textFieldProvider).contains("")
                                          ? MaterialStateProperty.all<Color>(
                                              AppColors.blackColor)
                                          : MaterialStateProperty.all<Color>(
                                              AppColors.buttonactiveColor),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                              onPressed: () {
                                // print(screenWidth * 0.318);
                              },
                              child: Text(
                                AppStrings.submit,
                                style: AppTextStyle.subText
                                    .copyWith(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  AppStrings.findYourAccount,
                  style: AppTextStyle.loginFotterFont.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  AppStrings.enterresetEmail,
                  style: AppTextStyle.subText.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.blackColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: TextFormFieldClass(
                    text: AppStrings.yourEmail, controller: _emailController),
              )
            ],
          ),
        ),
      ),
    );
  }
}
