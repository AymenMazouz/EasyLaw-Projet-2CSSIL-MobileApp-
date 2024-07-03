import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/mahkama.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_detail_screen.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_provider.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class MahkamaResultScreen extends StatefulWidget {
  const MahkamaResultScreen({super.key});

  @override
  State<MahkamaResultScreen> createState() => _MahkamaResultScreenState();
}

class _MahkamaResultScreenState extends State<MahkamaResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Consumer<CourtProvider>(
          builder: (context, courtProvider, child) {
            return Expanded(
              child: Stack(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, top: 10, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  naviagtionProvider.pop();
                                },
                                child: SvgPicture.asset(
                                  AssetsManager.iconify(
                                    "semi-arrow-right-square",
                                  ),
                                  color: QColors.primaryColor,
                                  height: 30,
                                  width: 40,
                                ),
                              ),
                              const Text(
                                "نتائج البحث",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              SvgPicture.asset(
                                AssetsManager.iconify(
                                  "search",
                                ),
                                color: QColors.primaryColor,
                                height: 30,
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 5,
                          color: QColors.primaryColor,
                          height: 30,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: courtProvider.scrollController,
                            itemCount: courtProvider.allMahkama.length + 1,
                            itemBuilder: (context, index) {
                              if (index < courtProvider.allMahkama.length) {
                                return InkWell(
                                  onTap: () {
                                    naviagtionProvider
                                        .saveAndGoto(CourtDetailScreen(
                                      court: courtProvider.allMahkama[index],
                                    ));
                                  },
                                  child: CourtCard(
                                      court: courtProvider.allMahkama[index]),
                                );
                              }
                              if (index == courtProvider.allMahkama.length &&
                                  courtProvider.keepLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: QColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          courtProvider.scrollController.animateTo(
                            0,
                            duration: const Duration(
                              seconds: 2,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: SvgPicture.asset(
                          AssetsManager.iconify("arrow-up"),
                          color: QColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    Provider.of<CourtProvider>(context).dispose();
    super.dispose();
  }
}

class CourtCard extends StatelessWidget {
  final Mahkama court;
  const CourtCard({
    super.key,
    required this.court,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color: QColors.primaryColor.withOpacity(.3),
      ),
      child: Column(
        children: [
          Text(
            "${court.principle.substring(
              0,
              min(court.principle.length, 120),
            )}${min(court.principle.length, 120) < 120 ? "" : "..."}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "${court.groundAppeal.substring(
              0,
              min(court.groundAppeal.length, 200),
            )}${min(court.groundAppeal.length, 200) < 200 ? "" : "..."}",
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
