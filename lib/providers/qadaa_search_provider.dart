import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_screen.dart';

class QadaaSearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController(text: ""),
      beginDateController = TextEditingController(),
      endDateController = TextEditingController(),
      numberController = TextEditingController();

  String chamber = "", procedure = "", section = "";

  updateChamber(String? value) {
    chamber = value ?? "";
    notifyListeners();
  }

  updateProcedure(String? value) {
    procedure = value ?? "";
    notifyListeners();
  }

  updateSection(String? value) {
    section = value ?? "";
    notifyListeners();
  }

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
      beginDateController.text = formatQadaaDate(picked);
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
      endDateController.text = formatQadaaDate(picked);
    } else {
      endDateController.text = "";
      notifyListeners();
    }
  }
}
