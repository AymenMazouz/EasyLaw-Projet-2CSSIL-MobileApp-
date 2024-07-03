import 'package:flutter/material.dart';
import 'package:qanoun_sahl/views/core/home/home_screen.dart';

class NavigationProvider extends ChangeNotifier {
  Widget get selectedScreen => stack.last;
  List<Widget> stack = [
    HomeScreen(),
  ];

  void goto(Widget screen) {
    stack.removeLast();
    stack.add(screen);
    notifyListeners();
  }

  void saveAndGoto(Widget screen) {
    if (selectedScreen.runtimeType != screen.runtimeType) {
      stack.add(screen);
      notifyListeners();
    }
  }

  void pop() {
    stack.removeLast();
    notifyListeners();
  }
}
