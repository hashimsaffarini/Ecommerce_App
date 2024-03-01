import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final double height;
  final Widget? child;
  final String? title;
  final Color bgColor;
  final Color frColor;
  final VoidCallback? onPressed;
  final double cercular;

  const MainButton({
    super.key,
    this.cercular = 8,
    this.height = 50,
    this.title,
    this.child,
    this.bgColor = AppColors.primary,
    this.frColor = AppColors.white,
    this.onPressed,
  }) : assert(title != null || child != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: frColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cercular),
          ),
        ),
        onPressed: onPressed,
        child: child ?? Text(title!),
      ),
    );
  }
}
