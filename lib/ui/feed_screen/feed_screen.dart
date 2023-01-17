import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/ui/feed_screen/feed_screen_provider.dart';
import 'package:social_app/ui/home_page_mobile.dart';
import 'package:social_app/ui/home_screen/home_screen.dart';
import 'package:social_app/ui/login_screen/login_screen.dart';
import 'package:social_app/utils/app_assets.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_fonts.dart';
import 'package:social_app/utils/app_strings.dart';
import 'package:social_app/utils/app_textstyle.dart';
import 'package:social_app/widgets/textButton.dart';
import 'package:social_app/widgets/text_form.dart';

class AppBarScreen extends ConsumerStatefulWidget {
  const AppBarScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarState();
}

class _AppBarState extends ConsumerState<AppBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 5, vsync: this, animationDuration: Duration.zero,
      // tabController.addListener(handleTabSelection)
    );
    // print(ref.read(handleState.notifier).state[(tabController.index]);
    tabController.addListener(() {
      // ref.read(handleState.notifier).state[tabController.index] =
      //     !ref.read(handleState.notifier).state[0];
//  ref.read(handleState.notifier).state
      ref.read(buttonStateProvider.notifier).onTap(tabController.index);

      // ref.read(handleStateTwo.notifier).state = true;
    });

    // tabController.index = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: SizedBox(
          height: 55,
          // decoration: BoxDecoration(
          //   border: Border.all(width: 2, color: AppColors.redColor),
          // ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                AppAssets.quoraLogo,
                width: 60,
              ),
              SizedBox(
                width: 300,
                child: TabBar(
                  onTap: (value) {
                    tabController.addListener(() {
                      ref
                          .read(buttonStateProvider.notifier)
                          .onTap(tabController.index);
                    });
                  },
                  isScrollable: true,
                  controller: tabController,
                  indicatorColor: AppColors.redColor,
                  indicatorSize: TabBarIndicatorSize.values[1],
                  labelColor: AppColors.redColor,
                  unselectedLabelColor: AppColors.loginFooterStringColor,
                  tabs: [
                    ref.watch(buttonStateProvider)[0]
                        //  ==
                        //         tabController.index
                        ? const Icon(
                            EditQuoraIcon.homeFilled,
                          )
                        : const Icon(
                            EditQuoraIcon.home,
                            size: 24,
                          ),
                    ref.watch(buttonStateProvider)[1]
                        ? const Icon(
                            EditQuoraIcon.followingList,
                            size: 24,
                          )
                        : const Icon(
                            EditQuoraIcon.folllowListFilled,
                            size: 24,
                          ),
                    ref.watch(buttonStateProvider)[2]
                        ? const Icon(
                            EditQuoraIcon.editFilled,
                            size: 24,
                          )
                        : const Icon(
                            EditQuoraIcon.edit,
                            size: 24,
                          ),
                    ref.watch(buttonStateProvider)[3]
                        ? const Icon(
                            EditQuoraIcon.group,
                            size: 24,
                          )
                        : const Icon(
                            EditQuoraIcon.group,
                            size: 24,
                          ),
                    ref.watch(buttonStateProvider)[4]
                        ? const Icon(
                            EditQuoraIcon.notificationSelected,
                            size: 24,
                          )
                        : const Icon(
                            EditQuoraIcon.notificationUnselected,
                            size: 24,
                          ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.037),
              SizedBox(
                  width: screenWidth * 0.2478,
                  child: TextFormFieldClass(
                    text: AppStrings.searchQuora,
                    controller: TextEditingController(),
                  )),
              SizedBox(
                width: screenWidth * 0.037,
              ),
              SizedBox(
                width: screenWidth * 0.068,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextButtonClass(
                      text: FittedBox(
                        child: Text(
                          AppStrings.tryQuoraplus.trim(),
                          style: AppTextStyle.subText
                              .copyWith(color: AppColors.blackColor),
                        ),
                      ),
                      onPressed: () {},
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.037,
              ),
              const CircleAvatar(
                maxRadius: 15,
                backgroundColor: AppColors.blackColor,
              ),
              SizedBox(
                width: screenWidth * 0.037,
              ),
              const Icon(
                EditQuoraIcon.globe,
                color: Colors.black,
              ),
              SizedBox(
                width: screenWidth * 0.037,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextButtonClass(
                    text: IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(
                            AppStrings.addquestion,
                            style: AppTextStyle.subText
                                .copyWith(color: Colors.white),
                          ),
                          const VerticalDivider(),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            // EditQuoraIcon.dropDown,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      print(screenWidth * 0.068);
                    },
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.redColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            LoginPage(),
            HomePage(),
            LoginPage(),
            MobileHomePage(),
            LoginPage(),
          ]),
    );
  }
}
