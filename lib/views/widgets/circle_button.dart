import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class CircleButton extends StatelessWidget {
  final String icon;
  final double size;
  final Color bgColor, iconColor;
  final Function()? onTap;
  const CircleButton({
    super.key,
    required this.icon,
    this.size = 50.0,
    this.iconColor = QColors.whiteColor,
    this.bgColor = QColors.primaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          AssetsManager.iconify(
            icon,
          ),
          color: iconColor,
        ),
      ),
    );
  }
}
