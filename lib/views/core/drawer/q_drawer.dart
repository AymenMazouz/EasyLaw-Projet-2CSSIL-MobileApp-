import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/services/local_storage_service.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/auth/auth_provider.dart';
import 'package:qanoun_sahl/views/auth/login_screen.dart';
import 'package:qanoun_sahl/views/core/home/home_screen.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class QDrawer extends StatefulWidget {
  final Function() onClick;
  final double width;
  const QDrawer({super.key, required this.onClick, required this.width});

  @override
  State<QDrawer> createState() => _QDrawerState();
}

class _QDrawerState extends State<QDrawer> {
  late double width = widget.width;

  @override
  void didUpdateWidget(covariant QDrawer oldWidget) {
    if (oldWidget.width != widget.width) {
      setState(() {
        width = widget.width;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, naviagtionProvider, child) {
      return Align(
        alignment: Alignment.centerRight,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuint,
          decoration: const BoxDecoration(
            color: QColors.primaryColor,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(15),
          width: width,
          height: 730,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: widget.onClick,
                  child: SvgPicture.asset(
                    AssetsManager.iconify("semi-arrow-right-square"),
                    color: QColors.whiteColor,
                    width: 50,
                  ),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      AssetsManager.imagify("profile"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عبد الرزاق قنيش",
                        style: TextStyle(
                          color: QColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "ka_kenniche@esi.dz",
                        style: TextStyle(
                          color: QColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: QColors.whiteColor,
                thickness: 2,
                height: 30,
                indent: 15,
                endIndent: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    DrawerItem(
                      title: "الرئيسية",
                      icon: "home",
                      onTap: () {
                        widget.onClick;
                        naviagtionProvider.goto(HomeScreen());
                      },
                    ),
                    const Divider(
                      color: QColors.whiteColor,
                      thickness: 1,
                      height: 30,
                    ),
                    DrawerItem(
                      title: "حسابي",
                      icon: "profile",
                      onTap: () {},
                    ),
                    const Divider(
                      color: QColors.whiteColor,
                      thickness: 1,
                      height: 30,
                    ),
                    DrawerItem(
                      title: "فواتيري",
                      icon: "wallet",
                      onTap: () {},
                    ),
                    const Divider(
                      color: QColors.whiteColor,
                      thickness: 1,
                      height: 30,
                    ),
                    const SizedBox(
                      height: 150,
                      child: Center(
                        child: Divider(
                          color: QColors.whiteColor,
                          thickness: 2,
                          height: 30,
                        ),
                      ),
                    ),
                    DrawerItem(
                      title: "الإعدادات",
                      icon: "settings",
                      onTap: () {},
                    ),
                    const Divider(
                      color: QColors.whiteColor,
                      thickness: 1,
                      height: 30,
                    ),
                    DrawerItem(
                      title: "تسجيل الخروج",
                      icon: "logout",
                      onTap: () {
                        LocalStorageService.clearLocalStorage();
                        while (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: QColors.whiteColor,
                      thickness: 1,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class DrawerItem extends StatelessWidget {
  final String title, icon;
  final Function() onTap;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManager.iconify(icon),
            color: QColors.whiteColor,
            width: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              color: QColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
