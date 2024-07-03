import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/providers/qadaa_search_provider.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_result_screen.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_provider.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_result_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

String formatQadaaDate(DateTime date) {
  return "${date.year}-${date.month.toString().padLeft(2, "0")}-${date.day.toString().padLeft(2, "0")}";
}

class QadaaScreen extends StatefulWidget {
  const QadaaScreen({super.key});

  @override
  State<QadaaScreen> createState() => _QadaaScreenState();
}

class _QadaaScreenState extends State<QadaaScreen> {
  // TextEditingController searchController = TextEditingController(text: ""),
  //     beginDateController = TextEditingController(),
  //     endDateController = TextEditingController(),
  //     numberController = TextEditingController();

  // String chamber = "", procedure = "", section = "";

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
  //     beginDateController.text = formatQadaaDate(picked);
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
  //     endDateController.text = formatQadaaDate(picked);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<QadaaSearchProvider>(
        builder: (context, qadaaSearchProvider, child) {
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
                      controller: qadaaSearchProvider.searchController,
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
                              onTap: () {
                                qadaaSearchProvider.getBeginDate(context);
                              },
                              controller:
                                  qadaaSearchProvider.beginDateController,
                              decoration: InputDecoration(
                                labelText: "2000/01/01",
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
                              onTap: () {
                                qadaaSearchProvider.getEndDate(context);
                              },
                              controller: qadaaSearchProvider.endDateController,
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
                                "الرقم:",
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
                              controller: qadaaSearchProvider.numberController,
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
                                "القسم:",
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
                            child: DropdownButtonFormField2<String>(
                              value: qadaaSearchProvider.section.isEmpty
                                  ? null
                                  : qadaaSearchProvider.section,
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              hint: const Text(
                                "القسم",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: [
                                "",
                                "القسم الأول",
                                "القسم الثاني",
                              ]
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                qadaaSearchProvider.updateSection(value);
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                  width: 50,
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
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
                                "الغرفة:",
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
                            child: DropdownButtonFormField2<String>(
                              value: qadaaSearchProvider.chamber.isEmpty
                                  ? null
                                  : qadaaSearchProvider.chamber,
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              hint: const Text(
                                "الغرفة",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: [
                                "",
                                "الغرفة الأولى",
                                "الغرفة الثانية",
                                "الغرفة الثالثة",
                                "الغرفة الرابعة",
                                "الغرفة الخامسة",
                                "الغرف مجتمعة",
                              ]
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                qadaaSearchProvider.updateChamber(value);
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                  width: 50,
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
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
                                "الإجراء:",
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
                            child: DropdownButtonFormField2<String>(
                              value: qadaaSearchProvider.procedure.isEmpty
                                  ? null
                                  : qadaaSearchProvider.procedure,
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              hint: const Text(
                                "الإجراء",
                                style: TextStyle(fontSize: 14),
                              ),
                              items: [
                                "",
                                "إجراءات",
                                "إعتراف بحق",
                                "التعمير",
                                "منظمات مهنية",
                                "تنازع الإختصاص",
                              ]
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                qadaaSearchProvider.updateProcedure(value);
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              iconStyleData: IconStyleData(
                                icon: SvgPicture.asset(
                                  AssetsManager.iconify("semi-arrow-down"),
                                  width: 50,
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () async {
                      naviagtionProvider.saveAndGoto(
                        ChangeNotifierProvider(
                          create: (context) => QadaaProvider(
                            searchQuery:
                                qadaaSearchProvider.searchController.text,
                            startDate:
                                qadaaSearchProvider.beginDateController.text,
                            endDate: qadaaSearchProvider.endDateController.text,
                            chamber: qadaaSearchProvider.chamber,
                            procedure: qadaaSearchProvider.procedure,
                            number: qadaaSearchProvider.numberController.text,
                          ),
                          child: const QadaaResultScreen(),
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
