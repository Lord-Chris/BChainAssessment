import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/_constants.dart';

class AppLoader extends HookWidget {
  final Color? color;
  final double? padding;
  final double? size;
  final bool isFullScreen;
  const AppLoader({
    Key? key,
    this.color = AppColors.white,
    this.padding,
    this.size = 25,
  })  : isFullScreen = false,
        super(key: key);

  const AppLoader.fullScreen({super.key})
      : color = AppColors.white,
        padding = null,
        size = null,
        isFullScreen = true;

  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: const Duration(seconds: 2));
    if (isFullScreen) {
      controller.repeat();
      return Material(
        child: Center(
          child: RotationTransition(
            turns: Tween<double>(begin: 3, end: 0).animate(controller),
            child: Image.asset(AppImgAssets.loader, scale: 2),
          ),
        ),
      );
    }
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding ?? 5.r),
        child: SizedBox(
          height: size,
          width: size,
          child: Platform.isAndroid
              ? CircularProgressIndicator(
                  color: color,
                )
              : CupertinoActivityIndicator(color: color, radius: 13),
        ),
      ),
    );
  }
}
