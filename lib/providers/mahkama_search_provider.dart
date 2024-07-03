import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qanoun_sahl/views/core/home/mahakma/mahkama_screen.dart';

class MahkamaSearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController(),
      beginDateController = TextEditingController(),
      endDateController = TextEditingController(),
      decisionNumberController = TextEditingController(),
      decisionSubjectController = TextEditingController();

  Future<void> getBeginDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1962),
      lastDate: DateTime.now(),
      cancelText: "إلغاء",
      confirmText: "تأكيد",
      helpText: "اختر تاريخ بداية",
      textDirection: TextDirection.rtl,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null) {
      beginDateController.text = formatMahkamaDate(picked);
      notifyListeners();
    } else {
      beginDateController.text = "";
      notifyListeners();
    }
  }

  Future<void> getEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1962),
      lastDate: DateTime.now(),
      cancelText: "إلغاء",
      confirmText: "تأكيد",
      helpText: "اختر تاريخ نهاية",
      textDirection: TextDirection.rtl,
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (picked != null) {
      endDateController.text = formatMahkamaDate(picked);
      notifyListeners();
    } else {
      endDateController.text = "";
      notifyListeners();
    }
  }
}
