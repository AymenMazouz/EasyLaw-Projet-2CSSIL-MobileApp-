import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/providers/dostor_search_provider.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/views/core/home/dostor/dostor_provider.dart';
import 'package:qanoun_sahl/views/core/home/dostor/dostor_result_screen.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class DostorScreen extends StatefulWidget {
  const DostorScreen({super.key});

  @override
  State<DostorScreen> createState() => _DostorScreenState();
}

class _DostorScreenState extends State<DostorScreen> {
  // TextEditingController searchController = TextEditingController(),
  //     sectionNumberController = TextEditingController(),
  //     sectionNameController = TextEditingController(),
  //     chapterNumberController = TextEditingController(),
  //     chapterNameController = TextEditingController(),
  //     articleNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DostorSearchProvider>(
        builder: (context, dostorSearchProvider, child) {
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
                    controller: dostorSearchProvider.searchController,
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
                        "حسب القسم",
                        style: TextStyle(
                          fontSize: 18,
                          color: QColors.blackColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "رقم القسم",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 70,
                          child: TextFormField(
                            controller:
                                dostorSearchProvider.sectionNumberController,
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
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "عنوان القسم",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 70,
                          child: TextFormField(
                            controller:
                                dostorSearchProvider.sectionNameController,
                            decoration: const InputDecoration(
                              labelText: "قسم كذا كذا",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                        "حسب الفصل",
                        style: TextStyle(
                          fontSize: 18,
                          color: QColors.blackColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "رقم الفصل:",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 70,
                          child: TextFormField(
                            controller:
                                dostorSearchProvider.chapterNumberController,
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
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "عنوان الفصل:",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 70,
                          child: TextFormField(
                            controller:
                                dostorSearchProvider.chapterNameController,
                            decoration: const InputDecoration(
                              labelText: "فصل كذا كذا",
                              labelStyle: TextStyle(
                                color: Colors.grey,
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
                          width: 120,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "رقم المادة:",
                              style: TextStyle(
                                fontSize: 18,
                                color: QColors.blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          height: 70,
                          child: TextFormField(
                            controller:
                                dostorSearchProvider.articleNumberController,
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
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    naviagtionProvider.saveAndGoto(
                      ChangeNotifierProvider(
                        create: (context) => DostorProvider(
                          searchQuery:
                              dostorSearchProvider.searchController.text,
                          sectionNumber:
                              dostorSearchProvider.sectionNumberController.text,
                          sectionName:
                              dostorSearchProvider.sectionNameController.text,
                          chapterNumber:
                              dostorSearchProvider.chapterNumberController.text,
                          chapterName:
                              dostorSearchProvider.chapterNameController.text,
                          articleNumber:
                              dostorSearchProvider.articleNumberController.text,
                        ),
                        child: const DostorResultScreen(),
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
