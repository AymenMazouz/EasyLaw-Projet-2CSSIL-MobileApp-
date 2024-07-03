import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DostorSearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController(),
      sectionNumberController = TextEditingController(),
      sectionNameController = TextEditingController(),
      chapterNumberController = TextEditingController(),
      chapterNameController = TextEditingController(),
      articleNumberController = TextEditingController();
}
