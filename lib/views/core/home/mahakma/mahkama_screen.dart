import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:qanoun_sahl/providers/mahkama_search_provider.dart';

import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_result_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

String formatMahkamaDate(DateTime date) {
  return "${date.year}/${date.month.toString().padLeft(2, "0")}/${date.day.toString().padLeft(2, "0")}";
}

class MahkamaScreen extends StatefulWidget {
  const MahkamaScreen({super.key});

  @override
  State<MahkamaScreen> createState() => _MahkamaScreenState();
}

class _MahkamaScreenState extends State<MahkamaScreen> {
  // TextEditingController searchController = TextEditingController(),
  //     beginDateController = TextEditingController(),
  //     endDateController = TextEditingController(),
  //     decisionNumberController = TextEditingController(),
  //     decisionSubjectController = TextEditingController();

  // Future<void> getBeginDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1962),
  //     lastDate: DateTime.now(),
  //     cancelText: "إلغاء",
  //     confirmText: "تأكيد",
  //     helpText: "اختر تاريخ بداية",
  //     textDirection: TextDirection.rtl,
  //     initialEntryMode: DatePickerEntryMode.calendar,
  //   );
  //   if (picked != null) {
  //     beginDateController.text = formatMahkamaDate(picked);
  //   }
  // }

  // Future<void> getEndDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1962),
  //     lastDate: DateTime.now(),
  //     cancelText: "إلغاء",
  //     confirmText: "تأكيد",
  //     helpText: "اختر تاريخ نهاية",
  //     textDirection: TextDirection.rtl,
  //     initialEntryMode: DatePickerEntryMode.calendar,
  //   );
  //   if (picked != null) {
  //     endDateController.text = formatMahkamaDate(picked);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<MahkamaSearchProvider>(
        builder: (context, mahkamaSearchProvider, child) {
      return Consumer<NavigationProvider>(
        builder: (context, naviagtionProvider, child) {
          return Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 70,
                    child: TextFormField(
                      controller: mahkamaSearchProvider.searchController,
                      decoration: InputDecoration(
                        labelText: "اكتب شيئا ما",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              AssetsManager.iconify("search"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "فرز النتائج",
                            style: TextStyle(
                              fontSize: 18,
                              color: QColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "حسب تاريخ النشر",
                          style: TextStyle(
                            fontSize: 18,
                            color: QColors.blackColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "من",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: QColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 70,
                            child: TextFormField(
                              controller:
                                  mahkamaSearchProvider.beginDateController,
                              onTap: () {
                                mahkamaSearchProvider.getBeginDate(context);
                              },
                              decoration: InputDecoration(
                                labelText: "2000/01/01",
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      AssetsManager.iconify("calendar"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "إلى",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: QColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 70,
                            child: TextFormField(
                              controller:
                                  mahkamaSearchProvider.endDateController,
                              onTap: () {
                                mahkamaSearchProvider.getEndDate(context);
                              },
                              decoration: InputDecoration(
                                labelText:
                                    "${DateTime.now().year}/${DateTime.now().month.toString().padLeft(2, "0")}/${DateTime.now().day.toString().padLeft(2, "0")}",
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      AssetsManager.iconify("calendar"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "إضافات",
                          style: TextStyle(
                            fontSize: 18,
                            color: QColors.blackColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "رقم القرار:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: QColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 70,
                            child: TextFormField(
                              controller: mahkamaSearchProvider
                                  .decisionNumberController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "مثلا 1234",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "موضوع القرار:",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: QColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120,
                            height: 70,
                            child: TextFormField(
                              controller: mahkamaSearchProvider
                                  .decisionSubjectController,
                              decoration: const InputDecoration(
                                labelText: "موضوع كذا كذا",
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      log(mahkamaSearchProvider.searchController.text
                          .toString());
                      naviagtionProvider.saveAndGoto(
                        ChangeNotifierProvider(
                          create: (context) => CourtProvider(
                            searchQuery:
                                mahkamaSearchProvider.searchController.text,
                            startDate:
                                mahkamaSearchProvider.beginDateController.text,
                            endDate:
                                mahkamaSearchProvider.endDateController.text,
                            decisionSubject: mahkamaSearchProvider
                                .decisionSubjectController.text,
                            decisionNumber: mahkamaSearchProvider
                                .decisionNumberController.text,
                          ),
                          child: const MahkamaResultScreen(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("عرض النتائج"),
                        SvgPicture.asset(
                          AssetsManager.iconify("semi-arrow-left"),
                          color: QColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
