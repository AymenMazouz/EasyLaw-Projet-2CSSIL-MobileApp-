import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/home_provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_screen.dart';
import 'package:qanoun_sahl/views/core/home/dostor/dostor_screen.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_provider.dart';
import 'package:qanoun_sahl/views/core/qanoun_sahl_screen.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_screen.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_screen.dart';
import 'package:qanoun_sahl/views/core/home/search--canceled/search_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class HomeScreen extends StatelessWidget {
  CarouselController chipsController = CarouselController();
  CarouselController pagesController = CarouselController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Consumer<NavigationProvider>(
          builder: (context, naviagtionProvider, child) {
        return Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CarouselSlider(
                  carouselController: chipsController,
                  options: CarouselOptions(
                    viewportFraction: 0.4,
                    initialPage: SearchCategory.values
                        .indexOf(homeProvider.searchCategory),
                  ),
                  items: [
                    CategoryChip(
                      isSelected:
                          homeProvider.searchCategory == SearchCategory.Mahkama,
                      title: "المحكمة العليا",
                      onClick: () {
                        homeProvider.changeCategory(SearchCategory.Mahkama);
                        chipsController.animateToPage(0);
                        pagesController.animateToPage(0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                    CategoryChip(
                      isSelected:
                          homeProvider.searchCategory == SearchCategory.Dostor,
                      title: "الدستور",
                      onClick: () {
                        homeProvider.changeCategory(SearchCategory.Dostor);
                        chipsController.animateToPage(1);
                        pagesController.animateToPage(1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                    CategoryChip(
                      isSelected:
                          homeProvider.searchCategory == SearchCategory.Qadaa,
                      title: "الاجتهاد القضائي",
                      onClick: () {
                        homeProvider.changeCategory(SearchCategory.Qadaa);
                        chipsController.animateToPage(2);
                        pagesController.animateToPage(2,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                    CategoryChip(
                      isSelected:
                          homeProvider.searchCategory == SearchCategory.Djarida,
                      title: "الجريدة الرسمية",
                      onClick: () {
                        homeProvider.changeCategory(SearchCategory.Djarida);
                        chipsController.animateToPage(3);
                        pagesController.animateToPage(3,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                carouselController: pagesController,
                options: CarouselOptions(
                  initialPage: SearchCategory.values
                      .indexOf(homeProvider.searchCategory),
                  enlargeFactor: 1,
                  padEnds: false,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height - 190,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, context) {
                    chipsController.animateToPage(index);
                    homeProvider.changeCategory(SearchCategory.values[index]);
                  },
                ),
                items: const [
                  MahkamaScreen(),
                  DostorScreen(),
                  QadaaScreen(),
                  DjaridaScreen(),
                ],
              ),
            ],
          ),
        );
      });
    });
  }
}

enum SearchCategory { Mahkama, Dostor, Qadaa, Djarida }

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onClick,
  });
  final bool isSelected;
  final String title;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 2,
          color: QColors.primaryColor,
        ),
        color: isSelected ? QColors.primaryColor : QColors.whiteColor,
      ),
      child: InkWell(
        onTap: onClick,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? QColors.whiteColor : QColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
