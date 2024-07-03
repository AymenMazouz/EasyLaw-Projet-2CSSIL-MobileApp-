import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qanoun_sahl/models/qadaa.dart';
import 'package:qanoun_sahl/providers/navigation_provider.dart';
import 'package:qanoun_sahl/utils/assets_manager.dart';
import 'package:qanoun_sahl/views/themes/q_colors.dart';

class QadaaDetailScreen extends StatefulWidget {
  final Qadaa qadaa;
  const QadaaDetailScreen({super.key, required this.qadaa});

  @override
  State<QadaaDetailScreen> createState() => _QadaaDetailScreenState();
}

class _QadaaDetailScreenState extends State<QadaaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, naviagtionProvider, child) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10, left: 20),
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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      const Center(
                        child: Text(
                          "الجمهورية الجزائرية الديمقراطية الشعبية",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "الاجتهاد القضائي رقم ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${widget.qadaa.number}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                            const TextSpan(
                              text: " المؤرخ في ",
                            ),
                            TextSpan(
                              text: widget.qadaa.date,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "الموضوع: ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.qadaa.subject,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "الإجراء: ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.qadaa.procedure,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "الغرفة: ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.qadaa.chamber,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "القسم: ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.qadaa.section,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "المبدأ: ",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: QColors.blackColor,
                              fontFamily: "ElMessiri"),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.qadaa.principle,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          maximumSize: const Size(140, 40),
                        ),
                        onPressed: () {},
                        child: const Text("عرض الملف الأصلي"),
                      ),
                      Container(
                        height: 600,
                        width: 300,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: QColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                          color: QColors.primaryColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: const PDF(
                              fitEachPage: false,
                              preventLinkNavigation: false,
                              swipeHorizontal: true,
                            ).fromUrl(
                              widget.qadaa.pdfLink.replaceAll("\n", ""),
                              // "http://math.univ-lyon1.fr/~ducloux/enseignement/maitrise/algebre/chap4.pdf",
                              placeholder: (progress) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (error) =>
                                  Center(child: Text(error.toString())),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String formatDate(DateTime date) {
  return "${date.year} - ${date.month} - ${date.day}";
}
