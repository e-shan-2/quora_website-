import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/login_screen/login_screen_provider.dart';
import 'package:social_app/utils/app_assets.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/login_widget.dart';
import 'package:social_app/widgets/lllogin/quora_login_webview.dart';
import 'package:social_app/widgets/signup_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;

  // @override
  // void initState() {
  //   super.initState();

  //   ref.read(colourProvider);
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  // }

  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context).orientation;
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // bool value = ref.watch(hoverProvider);
    // final cell = ref.watch(emptyorNOt);
    // String value = ref.watch(textFieldProvider);

    return SafeArea(
      child: Scaffold(
          body: screenWidth <= 400
              ? Container(
                  color: AppColors.loginpagePhoneColour,
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.mobileLoginPage,
                        ),
                        Image.asset(
                          AppAssets.quoraLogoWhiteColour,
                          scale: 2,
                        ),
                        Text(
                          AppStrings.quoraTagline,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.loginFotterFont.copyWith(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        RichText(
                            text: TextSpan(
                                text: AppStrings.byContinuing,
                                style: AppTextStyle.subText
                                    .copyWith(color: Colors.white),
                                children: [
                              TextSpan(
                                text: AppStrings.termofService,
                                style: AppTextStyle.subText
                                    .copyWith(color: AppColors.blueColor),
                              ),
                              TextSpan(
                                text: AppStrings.and,
                                style: AppTextStyle.subText
                                    .copyWith(color: Colors.white),
                              ),
                              TextSpan(
                                text: AppStrings.privacyPolicy,
                                style: AppTextStyle.subText
                                    .copyWith(color: AppColors.blueColor),
                              ),
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   height: 42,

                        //   //  350,

                        //   // creenWidth * 0.318,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(5),
                        //       border: Border.all(color: AppColors.borderColor)),
                        //   child: Row(
                        //     children: [
                        //       Image.asset(
                        //         AppAssets.googleLogo,
                        //         // scale: 7,
                        //         height: 30,
                        //       ),
                        //       Text(
                        //         AppStrings.continueWithGoogle,
                        //         style: AppTextStyle.loginFotterFont
                        //             .copyWith(color: AppColors.blackColor),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   height: 42,
                        //   // width: 350,
                        //   // screenWidth * 0.318,
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(5),
                        //       border: Border.all(color: AppColors.borderColor)),
                        //   child: Row(
                        //     children: [
                        //       Image.asset(
                        //         AppAssets.facebook,
                        //         height: 30,
                        //       ),
                        //       Text(
                        //         AppStrings.continueWithFacebook,
                        //         style: AppTextStyle.loginFotterFont
                        //             .copyWith(color: AppColors.blackColor),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.44,
                              height: 30,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.buttonTransparentColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      useRootNavigator: true,
                                      context: context,
                                      // constraints:
                                      //     BoxConstraints(maxHeight: _screenHeight,minHeight: _screenHeight,),
                                      builder: (BuildContext context) {
                                        return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const LoginWiidget());
                                      },
                                    );

                                    // print(screenWidth * 0.318);
                                  },
                                  child: Text(
                                    AppStrings.login,
                                    style: AppTextStyle.subText
                                        .copyWith(color: Colors.white),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: screenWidth * 0.45,
                              height: 30,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.buttonTransparentColor,
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ))),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      useRootNavigator: true,
                                      context: context,
                                      // constraints:
                                      //     BoxConstraints(maxHeight: _screenHeight,minHeight: _screenHeight,),
                                      builder: (BuildContext context) {
                                        return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: SignupWidget(
                                              value: false,
                                            ));
                                      },
                                    );
                                  },
                                  child: Text(
                                    AppStrings.signupEmail,
                                    style: AppTextStyle.subText
                                        .copyWith(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.about,
                              style: AppTextStyle.loginFotterFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const CircleAvatar(
                              radius: 1,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppStrings.careers,
                              style: AppTextStyle.loginFotterFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const CircleAvatar(
                              radius: 1,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppStrings.languages,
                              style: AppTextStyle.loginFotterFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const CircleAvatar(
                              radius: 1,
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppStrings.quoraInc,
                              style: AppTextStyle.loginFotterFont.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const LoginWebview()),
    );
  }
}
