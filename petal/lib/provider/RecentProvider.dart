import 'package:flutter/material.dart';
import 'package:petal/models/Recents.dart';

class RecentProvider with ChangeNotifier {
  List<Recent>? _recent;
  String? _q;

  String get q => _q!;

  void setQ(String value) {
    _q = value;
    notifyListeners();
  }

  List<Recent>? getRecent() => _recent!;

  void setRecent(List<Recent> value) {
    _recent = value;
    notifyListeners();
  }
}
