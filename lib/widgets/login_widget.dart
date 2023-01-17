import 'package:flutter/material.dart';
import 'package:social_app/utils/app_assets.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/forgot_password.dart';
import 'package:social_app/widgets/text_form.dart';

class LoginWiidget extends StatefulWidget {
  const LoginWiidget({super.key});

  @override
  State<LoginWiidget> createState() => _LoginWiidgetState();
}

class _LoginWiidgetState extends State<LoginWiidget> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssets.quoraQ,
                scale: 7,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.buttonactiveColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                  onPressed: () {
                    // print(screenWidth * 0.318);
                  },
                  child: Text(
                    AppStrings.login,
                    style: AppTextStyle.subText.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Text(
            AppStrings.loginToQuora,
            style: AppTextStyle.loginFotterFont.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.blackColor),
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Text(
            AppStrings.email,
            style: AppTextStyle.subText.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.blackColor),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: TextFormFieldClass(
            controller: _emailController,
            text: AppStrings.yourEmail,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Text(
            AppStrings.password,
            style: AppTextStyle.subText.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: TextFormFieldClass(
              text: AppStrings.yourPassword, controller: _passwordController),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return ForgotPassword(
                          value: false,
                        );
                      });
                },
                child: Text(
                  AppStrings.forgotPassword,
                  style:
                      AppTextStyle.subText.copyWith(color: AppColors.greyColor),
                ),
              ),
              // TextButton(
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(
              //             AppColors.buttonactiveColor),
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(18.0),
              //         ))),
              //     onPressed: () {
              //       // print(screenWidth * 0.318);
              //     },
              //     child: Text(
              //       AppStrings.login,
              //       style: AppTextStyle.subText.copyWith(color: Colors.white),
              //     ))
            ],
          ),
        )
      ],
    );
  }
}
