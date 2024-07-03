import 'package:flutter/material.dart';
import 'package:qanoun_sahl/views/core/home/qadaa/qadaa_screen.dart';

class DjaridaSearchProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController(),
      publishBeginDateController = TextEditingController(),
      publishEndDateController = TextEditingController(),
      signBeginDateController = TextEditingController(),
      signEndDateController = TextEditingController(),
      numberController = TextEditingController();
  String type = "", field = "", ministry = "";

  void changeType(String? value) {
    type = value ?? "";
  }

  void changeField(String? value) {
    field = value ?? "";
  }

  void changeMinistry(String? value) {
    ministry = value ?? "";
  }

  Future<void> getPublishBeginDate(BuildContext context) async {
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
      publishBeginDateController.text = formatQadaaDate(picked);
    } else {
      publishBeginDateController.text = "";
    }
    notifyListeners();
  }

  Future<void> getPublishEndDate(BuildContext context) async {
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
      publishEndDateController.text = formatQadaaDate(picked);
    } else {
      publishEndDateController.text = "";
    }
    notifyListeners();
  }

  Future<void> getSignBeginDate(BuildContext context) async {
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
      signBeginDateController.text = formatQadaaDate(picked);
    } else {
      signBeginDateController.text = "";
    }
    notifyListeners();
  }

  Future<void> getSignEndDate(BuildContext context) async {
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
      signEndDateController.text = formatQadaaDate(picked);
    } else {
      signEndDateController.text = "";
    }
    notifyListeners();
  }
}
