import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_result_screen.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class GeneralSearchScreen extends StatelessWidget {
  GeneralSearchScreen({super.key});

  TextEditingController searchController = TextEditingController(),
      beginDateController = TextEditingController(),
      endDateController = TextEditingController(),
      domainController = TextEditingController(),
      ministryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
        builder: (context, naviagtionProvider, child) {
      return Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "البحث العام",
                  style: TextStyle(
                    fontSize: 18,
                    color: QColors.blackColor,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 70,
                child: TextFormField(
                  controller: searchController,
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
                          controller: beginDateController,
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
                          controller: endDateController,
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
                        child: TextFormField(
                          controller: domainController,
                          decoration: InputDecoration(
                            labelText: "قطاع كذا كذا",
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
                        child: TextFormField(
                          controller: ministryController,
                          decoration: InputDecoration(
                            labelText: "وزارة كذا كذا",
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
                ],
              ),
              TextButton(
                onPressed: () {
                  naviagtionProvider.saveAndGoto(const MahkamaResultScreen());
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
  }
}
