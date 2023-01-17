import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/login_screen/login_screen_provider.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/text_form.dart';

class SignupWidget extends ConsumerStatefulWidget {
  bool value;

  SignupWidget({this.value = true, Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends ConsumerState<SignupWidget> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints(minWidth: 600, minHeight: 250),
      height: widget.value ? _screenHeight * 0.3 : _screenHeight,
      width: screenWidth * 0.42,
      child: Form(
        onChanged: () {
          ref
              .read(textFieldProvider.notifier)
              .onChanging([_emailController.text, _nameController.text]);
        },
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: const Icon(Icons.close)),
              // const SizedBox(height: 30),
              widget.value
                  ? const SizedBox()
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
                                AppStrings.next,
                                style: AppTextStyle.subText
                                    .copyWith(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  AppStrings.signup,
                  style: AppTextStyle.loginFotterFont.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  AppStrings.name,
                  style: AppTextStyle.subText.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.blackColor),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: TextFormFieldClass(
                    text: AppStrings.nickName, controller: _nameController),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  AppStrings.email,
                  style: AppTextStyle.subText.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.blackColor),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: TextFormFieldClass(
                    text: AppStrings.yourEmail, controller: _emailController),
              ),
            ]),
      ),
    );
  }
}
