import 'package:flutter/material.dart';
import '../../../../../../core/base/viewmodel/base_view_model.dart';
import '../model/task_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(this.context);

  final BuildContext context;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }
}
