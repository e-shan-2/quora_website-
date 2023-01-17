import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_fonts.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/post.dart';
import 'package:social_app/widgets/screen_template.dart';
import 'package:social_app/widgets/textButton.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final ScrollController controller2 = ScrollController();
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.pinkishColor,
      body: ScreenTemplate(
          columnFirst: Column(children: [
            Container(
              color: Colors.red,
            ),
            Container(
              // height: 80,
              color: Colors.orange,
            ),
            Container(
              // height: 80,
              color: Colors.red,
            ),
            Container(
              // height: 80,
              color: Colors.orange,
            ),
            Container(
              // height: 20,
              color: Colors.red,
            ),
            Container(
              height: 20,
              color: Colors.orange,
            ),
          ]),
          columnSecond: SizedBox(
            // height: 600,
            // width: ,
            child: ListView.builder(
                itemCount: 108,
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 92,
                            width: 568,
                            child: Card(
                              // decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     border: Border.all(
                              //       color: AppColors.loginpagePhoneColour,
                              //     )),
                              child: FittedBox(
                                child: Column(children: [
                                  Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const CircleAvatar(
                                          radius: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        FittedBox(
                                          child: SizedBox(
                                              width: 504,
                                              height: 32,
                                              child: TextFormField(
                                                controller:
                                                    TextEditingController(),
                                                decoration:
                                                    const InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      AppColors.pinkishColor,
                                                  hintText: AppStrings
                                                      .whatdoyouwanttoAsk,
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          bottom: 5, left: 10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                ),
                                              )),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 172.34,
                                          child: TextButtonClass(
                                            text: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  EditQuoraIcon.ask,
                                                  color: AppColors
                                                      .loginFooterStringColor,
                                                  size: 24,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  AppStrings.ask,
                                                  style: AppTextStyle.subText
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .loginFooterStringColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {},
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        SizedBox(
                                          width: 172.34,
                                          child: TextButtonClass(
                                            text: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  EditQuoraIcon.edit,
                                                  size: 24,
                                                  color: AppColors
                                                      .loginFooterStringColor,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  AppStrings.answer,
                                                  style: AppTextStyle.subText
                                                      .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .loginFooterStringColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {},
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        SizedBox(
                                          width: 172.34,
                                          child: TextButtonClass(
                                            text: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  EditQuoraIcon.post,
                                                  size: 24,
                                                  color: AppColors
                                                      .loginFooterStringColor,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  AppStrings.post,
                                                  style: AppTextStyle.subText
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .loginFooterStringColor),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {},
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.transparent),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ]);
                  } else {
                    return PostCard();
                  }
                })),
          )),
    );
  }
}
//  width: 536,
// height: 38.2,
