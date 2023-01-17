import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/utils/app_colors.dart';

class DotWidget extends StatefulWidget {
  const DotWidget({super.key});

  @override
  State<DotWidget> createState() => _DotWidgetState();
}

class _DotWidgetState extends State<DotWidget> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 1,
    
    backgroundColor: AppColors.loginFooterStringColor,
    );
  }
}