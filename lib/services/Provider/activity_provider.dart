import 'package:flutter/material.dart';
import 'package:travel_app/models/activity.dart';
import 'package:travel_app/services/api_services.dart';

class ActivityProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<List<Activity>> getActivity() async {
    const String apiEndPoint = '/activity';
    isLoading = true;
    List<Activity> acts = await getActivities(apiEndPoint);
    isLoading = false;
    notifyListeners();
    return acts;
  }
}
