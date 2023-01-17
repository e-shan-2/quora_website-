import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_fonts.dart';
import 'package:social_app/widgets/textButton.dart';

class ScreenTemplate extends ConsumerStatefulWidget {
  Widget columnFirst;
  Widget columnSecond;
  ScreenTemplate(
      {required this.columnFirst, required this.columnSecond, Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends ConsumerState<ScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    final ScrollController controller2 = ScrollController();
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final List<bool> _selectedtoggle = <bool>[
      true,
      false,
    ];
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: screenWidth <= 800 ? 0 : screenWidth * 0.3,
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 300,
                    color: AppColors.blueColor,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    color: AppColors.blackColor,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    color: AppColors.blueColor,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    color: AppColors.blackColor,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    color: AppColors.blueColor,
                  ),
                ],
              ),
            ),
            FittedBox(
              child: SizedBox(
                width: screenWidth <= 850 ? 500 : 580,
                height: 900,
                // screenWidth - screenWidth * 0.25,
                child: screenWidth <= 800
                    ? Scrollbar(
                        controller: controller2,
                        child: SingleChildScrollView(
                          controller: controller2,
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                              controller: controller,
                              child: FittedBox(
                                child: SizedBox(
                                  height: _screenHeight,
                                  width: screenWidth,
                                  child: Card(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            leading: const CircleAvatar(
                                              radius: 16,
                                            ),
                                            title: FittedBox(
                                              child: Row(
                                                children: const [
                                                  Text("Rupender Singht"),
                                                  CircleAvatar(
                                                    radius: 1,
                                                  ),
                                                  Text("Follw"),
                                                  SizedBox(
                                                    width: 290,
                                                  ),
                                                  Icon(EditQuoraIcon.more),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(EditQuoraIcon
                                                      .notInterested),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: screenWidth * 0.98,
                                            height: 700,
                                            color: AppColors.blueColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 30,
                                              child: ToggleButtons(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                children: [
                                                  Icon(
                                                    EditQuoraIcon.upVote,
                                                    size: 24,
                                                    color: AppColors
                                                        .loginFooterStringColor,
                                                  ),
                                                  // Text("data"),
                                                  Icon(
                                                    EditQuoraIcon.downVote,
                                                    size: 24,
                                                    color: AppColors
                                                        .loginFooterStringColor,
                                                  ),
                                                ],
                                                onPressed: (int index) {
                                                  _selectedtoggle[1] = true;
                                                },
                                                isSelected: _selectedtoggle,
                                              ),
                                            ),
                                            TextButtonClass(
                                                text: IntrinsicHeight(
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        EditQuoraIcon.upVote,
                                                        size: 24,
                                                        color: AppColors
                                                            .loginFooterStringColor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("35"),
                                                      VerticalDivider(),
                                                      Icon(
                                                        EditQuoraIcon.downVote,
                                                        size: 24,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onPressed: () {},
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(AppColors
                                                            .pinkishColor)),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Text("dfg"),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            TextButtonClass(
                                                text: IntrinsicHeight(
                                                  child: Row(
                                                    children: const [
                                                      Icon(
                                                        EditQuoraIcon.comment,
                                                        size: 24,
                                                        color: Color.fromARGB(
                                                            255, 246, 244, 244),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("35")
                                                    ],
                                                  ),
                                                ),
                                                onPressed: () {
                                                  print(screenWidth * 0.98);
                                                },
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(AppColors
                                                            .pinkishColor)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )

                              //

                              ),
                        ),
                      )
                    : widget.columnSecond,
              ),
            ),
          ],
        ),
      ]),
    );

    // Stack(
    //   alignment: Alignment.topLeft,
    //   // fit: StackFit.expand,
    //   children: [
    //     Positioned(
    //       left: 100,
    //       height: _screenHeight,
    //       width: screenWidth <= 800 ? screenWidth * 0 : 150,
    //       child: Container(
    //         child: widget.columnFirst,
    //       ),
    //     ),
    //     // Positioned(
    //     // left: 150,
    //     // //  screenWidth * 0.1,
    //     // //  screenWidth <= 800 ? screenWidth * 0 : screenWidth * 0.,
    //     // height: _screenHeight,
    //     // width: screenWidth <= 800 ? screenWidth * 0 : 150,
    //     // //  screenWidth * 0.36,
    //     // //  180,
    //     // // color: Colors.purple,
    //     // child: widget.columnFirst,
    //     // ),
    //     Positioned(
    //         // left: screenWidth * 0.001,
    //         // screenWidth <= 800 ? screenWidth * 0.015 : screenWidth * 0.015,
    //         // left: screenWidth - (screenWidth * 1),

    //         // 180,
    //         height: _screenHeight,
    //         width: screenWidth,
    //         child: widget.columnSecond
    //         //  ListView(
    //         //   children: [
    //         //     Container(
    //         //       height: 100,
    //         //       color: Colors.amber,
    //         //     ),
    //         //     Container(
    //         //       height: 100,
    //         //       color: Colors.amber,
    //         //     ),

    //         //     //         ],
    //         //     //       ),
    //         //     //     ],
    //         //     //   ),
    //         //     // ),
    //         //   ],
    //         // ),
    //         ),
    //   ],
    // );
  }
}
