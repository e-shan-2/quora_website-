import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/utils/app_colors.dart';
import 'package:social_app/utils/app_fonts.dart';
import 'package:social_app/widgets/textButton.dart';

class PostCard extends ConsumerStatefulWidget {
  const PostCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
  @override
  Widget build(BuildContext context) {
    final List<bool> _selectedtoggle = <bool>[
      true,
      false,
    ];
    return Card(
      child: Column(
        children: [
          ListTile(
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.all(10),
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
                  Icon(EditQuoraIcon.notInterested),
                ],
              ),
            ),
            subtitle: Row(
              children: const [
                Text("Rupender Singht"),
                CircleAvatar(
                  radius: 1,
                ),
                Text("Follw"),
              ],
            ),
          ),
          Container(
            width: 568,
            height: 705,
            color: AppColors.blueColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              // TextButton(
              //   style: TextButton.styleFrom(
              //       // padding:
              //       //     EdgeInsets.only(left: 10, right: 2),
              //       side: const BorderSide(),
              //       shape: const RoundedRectangleBorder()),
              //   onPressed: () {},
              //   child: const Icon(
              //     EditQuoraIcon.upVote,
              //     size: 24,
              //     color: AppColors.loginFooterStringColor,
              //   ),
              // ),

              SizedBox(
                height: 30,
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(18),
                  children: const [
                    Icon(
                      EditQuoraIcon.upVote,
                      size: 24,
                      color: AppColors.loginFooterStringColor,
                    ),
                    // Text("data"),
                    Icon(
                      EditQuoraIcon.downVote,
                      size: 24,
                      color: AppColors.loginFooterStringColor,
                    ),
                  ],
                  onPressed: (int index) {
                    // The button that is tapped is set to true, and the others to false.
                    _selectedtoggle[1] = true;
                    // for (int i = 0;
                    //     i < _selectedtoggle.length;
                    //     i++) {
                    //   if (i == index) {
                    //     _selectedtoggle[i] = true;
                    //   } else
                    //     _selectedtoggle[i] = false;
                    // }
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
                          color: AppColors.loginFooterStringColor,
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
                      MaterialStateProperty.all<Color>(AppColors.pinkishColor)),
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
                          color: Color.fromARGB(255, 246, 244, 244),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("35")
                      ],
                    ),
                  ),
                  onPressed: () {},
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.pinkishColor)),
            ],
          )
        ],
      ),
    );
    ;
  }
}
