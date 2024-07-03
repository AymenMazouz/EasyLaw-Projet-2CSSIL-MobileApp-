import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/mahkama.dart';
import 'package:qanoun_sahl/models/djarida.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_detail_screen.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_provider.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_detail_screen.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_provider.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class DjaridaResultScreen extends StatefulWidget {
  const DjaridaResultScreen({super.key});

  @override
  State<DjaridaResultScreen> createState() => _DjaridaResultScreenState();
}

class _DjaridaResultScreenState extends State<DjaridaResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Consumer<DjaridaProvider>(
          builder: (context, djaridaProvider, child) {
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
                            controller: djaridaProvider.scrollController,
                            itemCount: djaridaProvider.allDjarida.length + 1,
                            itemBuilder: (context, index) {
                              if (index < djaridaProvider.allDjarida.length) {
                                return InkWell(
                                  onTap: () {
                                    naviagtionProvider.saveAndGoto(
                                      DjaridaDetailScreen(
                                        law: djaridaProvider.allDjarida[index],
                                      ),
                                    );
                                  },
                                  child: DjaridaCard(
                                      djarida:
                                          djaridaProvider.allDjarida[index]),
                                );
                              }
                              if (index == djaridaProvider.allDjarida.length &&
                                  djaridaProvider.keepLoading) {
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
                          djaridaProvider.scrollController.animateTo(
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
    Provider.of<DjaridaProvider>(context).dispose();
    super.dispose();
  }
}

class DjaridaCard extends StatelessWidget {
  final Djarida djarida;
  const DjaridaCard({
    super.key,
    required this.djarida,
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
            "${djarida.textType} ${djarida.textType == "" ? "" : "صادر عن ${djarida.ministry}"}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            "${djarida.content.substring(
              min(djarida.content.indexOf("\n") + 1, 1),
              min(djarida.content.length, 200),
            )}${min(djarida.content.length, 200) < 200 ? "" : "..."}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
