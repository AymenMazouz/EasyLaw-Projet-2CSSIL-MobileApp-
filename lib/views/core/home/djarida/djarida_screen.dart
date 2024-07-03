import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/djarida_search_provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_result_screen.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_provider.dart';
import 'package:qanoun_sahl/views/core/home/djarida/djarida_result_screen.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class DjaridaScreen extends StatefulWidget {
  const DjaridaScreen({super.key});

  @override
  State<DjaridaScreen> createState() => _DjaridaScreenState();
}

class _DjaridaScreenState extends State<DjaridaScreen> {
  // final TextEditingController searchController = TextEditingController(),
  //     publishBeginDateController = TextEditingController(),
  //     publishEndDateController = TextEditingController(),
  //     signBeginDateContdjaridaSearchProvider.roller = TextEditingController(),
  //     signEndDateController = TextEditingController(),
  //     numberController = TextEditingController();
  // String type = "", field = "", ministry = "";

  // Future<void> getPublishBeginDate(BuildContext context) async {
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
  //     publishBeginDateController.text = formatQadaaDate(picked);
  //   }
  // }

  // Future<void> getPublishEndDate(BuildContext context) async {
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
  //     publishEndDateController.text = formatQadaaDate(picked);
  //   }
  // }

  // Future<void> getSignBeginDate(BuildContext context) async {
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
  //     signBeginDateController.text = formatQadaaDate(picked);
  //   }
  // }

  // Future<void> getSignEndDate(BuildContext context) async {
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
  //     signEndDateController.text = formatQadaaDate(picked);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<DjaridaSearchProvider>(
        builder: (context, djaridaSearchProvider, child) {
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
                    controller: djaridaSearchProvider.searchController,
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
                            controller: djaridaSearchProvider
                                .publishBeginDateController,
                            onTap: () {
                              djaridaSearchProvider
                                  .getPublishBeginDate(context);
                            },
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
                            controller:
                                djaridaSearchProvider.publishEndDateController,
                            onTap: () {
                              djaridaSearchProvider.getPublishEndDate(context);
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
                        "حسب تاريخ الإمضاء",
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
                              djaridaSearchProvider.getSignBeginDate(context);
                            },
                            controller:
                                djaridaSearchProvider.signBeginDateController,
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
                            controller:
                                djaridaSearchProvider.signEndDateController,
                            onTap: () {
                              djaridaSearchProvider.getSignEndDate(context);
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
                        "حسب الجريدة",
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
                              "رقم:",
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
                            controller: djaridaSearchProvider.numberController,
                            decoration: InputDecoration(
                              labelText: "12345",
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset(
                                    AssetsManager.iconify("semi-arrow-down"),
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
                              "نوع:",
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
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            hint: const Text(
                              "نوع المنشور",
                              style: TextStyle(fontSize: 14),
                            ),
                            items: [
                              "",
                              'أمر',
                              'منشور',
                              'منشور وزاري مشترك',
                              'لائحة',
                              'مداولة',
                              'مداولة م-أ-للدولة',
                              'مرسوم',
                              'مرسوم تنفيذي',
                              'مرسوم تشريعي',
                              'مرسوم رئاسي',
                              'مقرر',
                              'مقرر وزاري مشترك',
                              'إعلان',
                              'نظام',
                              'اتفاقية',
                              'تصريح',
                              'تقرير',
                              'تعليمة',
                              'تعليمة وزارية مشتركة',
                              'جدول',
                              'رأي',
                              'قانون',
                              'قانون عضوي',
                              'قرار',
                              'قرار ولائي',
                              'قرار وزاري مشترك'
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
                              djaridaSearchProvider.changeType(value);
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "حسب المؤسسة",
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
                              "القطاع:",
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
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            hint: const Text(
                              "القطاع",
                              style: TextStyle(fontSize: 14),
                            ),
                            items: [
                              '',
                              'الأمن العمومي',
                              'المناجم',
                              'المالية',
                              'الإتصال',
                              'المجاهدين',
                              'الإصلاح الإداري',
                              'الأشغال العمومية',
                              'النقل',
                              'الإقتصاد',
                              'الإعلام',
                              'البناء',
                              'التهيئة العمرانية',
                              'البيئة',
                              'التجهيز',
                              'التجارة',
                              'البحث العلمي',
                              'التخطيط',
                              'البرلمان',
                              'التربية والتعليم العالي',
                              'البريد',
                              'التضامن',
                              'التكوين المهني',
                              'الثقافة',
                              'الداخلية والجماعات المحلية',
                              'الدفاع الوطني',
                              'الري',
                              'الشؤون الإجتماعية',
                              'الشؤون الخارجية',
                              'الشؤون الدينية',
                              'الصناعة',
                              'الطاقة',
                              'الشباب والرياضة',
                              'السياحة',
                              'الصحة',
                              'الصيد',
                              'السكن',
                              'العمل',
                              'الغابات',
                              'العدل',
                              'الفلاحة',
                              'حقوق الإنسان',
                              'رئاسة الجمهورية',
                              'رئاسة الحكومة'
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
                              setState(() {
                                djaridaSearchProvider.changeField(value);
                              });
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
                              "الوزارة:",
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
                            isExpanded: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            hint: const Text(
                              "الوزارة",
                              style: TextStyle(fontSize: 14),
                            ),
                            items: [
                              "",
                              "وزارة المجاهدين وذوي الحقوق",
                              "وزارة الداخلية والجماعات المحلية والتهيئة العمرانية",
                              "وزارة الشؤون الخارجية والجالية الوطنية بالخارج",
                              "وزارة التجارة",
                              "وزارة المالية",
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
                              setState(() {
                                djaridaSearchProvider.changeMinistry(value);
                              });
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
                  onPressed: () {
                    naviagtionProvider.saveAndGoto(
                      ChangeNotifierProvider(
                        create: (context) => DjaridaProvider(
                          searchQuery:
                              djaridaSearchProvider.searchController.text,
                          ministry: djaridaSearchProvider.ministry,
                          textNumber:
                              djaridaSearchProvider.numberController.text,
                          textType: djaridaSearchProvider.type,
                          journalStartDate: djaridaSearchProvider
                              .publishBeginDateController.text,
                          journalEndDate: djaridaSearchProvider
                              .publishEndDateController.text,
                          signatureStartDate: djaridaSearchProvider
                              .signBeginDateController.text,
                          signatureEndDate:
                              djaridaSearchProvider.signEndDateController.text,
                          field: djaridaSearchProvider.field,
                        ),
                        child: const DjaridaResultScreen(),
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
      });
    });
  }
}
