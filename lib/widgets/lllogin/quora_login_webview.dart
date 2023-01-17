import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/login_screen/login_screen_provider.dart';
import 'package:social_app/utils/app_assets.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_constants.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/alert_dialogbox.dart';
import 'package:social_app/widgets/dot_widget.dart';
import 'package:social_app/widgets/forgot_password.dart';
import 'package:social_app/widgets/signup_widget.dart';
import 'package:social_app/widgets/text_form.dart';

part 'provider.dart';

class LoginWebview extends ConsumerStatefulWidget {
  const LoginWebview({Key? key}) : super(key: key);

  @override
  _LoginWebviewState createState() => _LoginWebviewState();
}

class _LoginWebviewState extends ConsumerState<LoginWebview> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    ref.read(colourProvider);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.backgroundImageLoginPage),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),

          //  padding: EdgeInsets.symmetric(horizontal:200),
          // height: 500,
          // width:700,
          //  screenWidth * 0.742,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  AppAssets.quoraLogo,
                  scale: 2.6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.quoraTagline,
                  style: AppTextStyle.loginFotterFont.copyWith(
                      fontSize: 15,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const FittedBox(
                              child: Text(
                                AppStrings.byContinuing,
                                style: AppTextStyle.subText,
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    AppStrings.quoras,
                                    style: AppTextStyle.subText,
                                  ),
                                  Text(
                                    AppStrings.termofService,
                                    style: AppTextStyle.subText
                                        .copyWith(color: AppColors.blueColor),
                                  ),
                                  const Text(
                                    AppStrings.and,
                                    style: AppTextStyle.subText,
                                  ),
                                  Text(
                                    AppStrings.privacyPolicy,
                                    style: AppTextStyle.subText
                                        .copyWith(color: AppColors.blueColor),
                                  ),
                                  // Text(AppStrings.),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 42,

                              constraints: const BoxConstraints(
                                maxWidth: 300,
                              ),

                              // screenWidth * 0.318,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.googleLogo,
                                    scale: 7,
                                  ),
                                  Text(
                                    AppStrings.continueWithGoogle,
                                    style: AppTextStyle.loginFotterFont
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 42,
                              constraints: const BoxConstraints(maxWidth: 300),
                              // screenWidth * 0.318,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: AppColors.borderColor)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.facebook,
                                    height: 30,
                                  ),
                                  Text(
                                    AppStrings.continueWithFacebook,
                                    style: AppTextStyle.loginFotterFont
                                        .copyWith(color: AppColors.blackColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialogBoxWidget(
                                        content: SignupWidget(),
                                        buttonString: AppStrings.next,
                                      );
                                    });
                              },
                              child: Text(
                                AppStrings.signupEmail,
                                style: AppTextStyle.subText.copyWith(
                                    color: AppColors.loginFooterStringColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(thickness: 1),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24, bottom: 24),
                          child: Form(
                            onChanged: () {
                              // if(){}
                              bool previousIsValidated =
                                  ref.watch(_isValidatedProvider);

                              bool isValidated =
                                  _emailController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty;

                              if (isValidated != previousIsValidated) {
                                ref.read(_isValidatedProvider.notifier).state =
                                    isValidated;
                              }

                              // ref.read(textFieldProvider.notifier).onChanging([
                              //   _emailController.text,
                              //   _passwordController.text
                              // ]);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.login,
                                  style: AppTextStyle.loginFotterFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  AppStrings.email,
                                  style: AppTextStyle.subText.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormFieldClass(
                                  controller: _emailController,
                                  text: AppStrings.yourEmail,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  AppStrings.password,
                                  style: AppTextStyle.subText.copyWith(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormFieldClass(
                                    text: AppStrings.yourPassword,
                                    controller: _passwordController),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialogBoxWidget(
                                                content: ForgotPassword(),
                                                buttonString: AppStrings.submit,
                                              );
                                            });
                                      },
                                      child: Text(
                                        AppStrings.forgotPassword,
                                        style: AppTextStyle.subText.copyWith(
                                            color: AppColors.greyColor),
                                      ),
                                    ),

                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor: !ref
                                                    .watch(_isValidatedProvider)
                                                ? MaterialStateProperty.all<
                                                    Color>(AppColors.blackColor)
                                                : MaterialStateProperty
                                                    .all<Color>(AppColors
                                                        .buttonactiveColor),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ))),
                                        onPressed:
                                            ref.watch(_isValidatedProvider)
                                                ? null
                                                : () {
                                                    // print(screenWidth * 0.318);
                                                  },
                                        child: Text(
                                          AppStrings.login,
                                          style: AppTextStyle.subText
                                              .copyWith(color: Colors.white),
                                        )),
                                    // })
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 40,
                  color: AppColors.loginFooter,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: AppConstants.data.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              MouseRegion(
                                onHover: (s) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onHover(index);
                                },
                                onExit: (event) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onExit(index);
                                },
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  AppConstants.data[index],
                                  style: AppTextStyle.loginFotterFont.copyWith(
                                      decoration:
                                          ref.watch(hovervalueProvider)[index]
                                              ? TextDecoration.underline
                                              : null,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const DotWidget(),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        }

                        if (index == AppConstants.data.length - 1) {
                          return Row(
                            children: [
                              MouseRegion(
                                onHover: (s) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onHover(index);

                                  // ref
                                  //     .read(hoverProvider.notifier)
                                  //     .update((state) {
                                  //   state[index] = true;
                                  //   return [...state];
                                  // });

                                  // print(ref
                                  //     .read(hoverProvider.notifier)
                                  //     .state);
                                },
                                onExit: (event) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onExit(index);
                                },
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  AppConstants.data[index],
                                  // ref
                                  //     .watch(hoverProvider.notifier)
                                  //     .state[index]
                                  //     .toString(),
                                  style: AppTextStyle.loginFotterFont.copyWith(
                                      decoration:
                                          ref.watch(hovervalueProvider)[index]
                                              ? TextDecoration.underline
                                              : null,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              MouseRegion(
                                onHover: (s) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onHover(index);
                                },
                                onExit: (event) {
                                  ref
                                      .read(hovervalueProvider.notifier)
                                      .onExit(index);
                                },
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  AppConstants.data[index],
                                  style: AppTextStyle.loginFotterFont.copyWith(
                                      decoration:
                                          ref.watch(hovervalueProvider)[index]
                                              ? TextDecoration.underline
                                              : null,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const DotWidget(),
                              const SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


         // Builder(builder: (context) {
                //   print('rebuilt');
                //   final List<StateProvider> underlinedProvider = List.generate(
                //     AppConstants.data.length,
                //     (index) => StateProvider((ref) => false),
                //   );
                //   var fir = StateProvider((ref) => false);

                //   return Row(
                //     children: List.generate(AppConstants.data.length, (index) {
                //       return Consumer(builder: (__, reff, _) {
                //         print('bebuilt');
                //         return MouseRegion(
                //           onHover: (s) {
                //             if (index == 0) {
                //               reff.read(fir.notifier).state = true;
                //             }
                //             reff
                //                 .read(underlinedProvider[index].notifier)
                //                 .update((state) => true);
                //           },
                //           onExit: (event) {
                //             if (index == 0) {
                //               reff.read(fir.notifier).state = false;
                //             }
                //             reff
                //                 .read(underlinedProvider[index].notifier)
                //                 .update((state) => false);
                //           },
                //           cursor: SystemMouseCursors.click,
                //           child: Text(
                //             AppConstants.data[index],
                //             style: AppTextStyle.loginFotterFont.copyWith(
                //                 decoration: reff.watch(fir.notifier).state
                //                     ? TextDecoration.underline
                //                     : null,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w500),
                //           ),
                //         );
                //       });
                //     }),
                //   );
                // }),