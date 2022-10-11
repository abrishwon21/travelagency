import 'package:flutter/material.dart';
import 'package:travel_app/models/activity.dart';
import 'package:travel_app/models/tour_model.dart';
import 'package:travel_app/services/api_services.dart';

class TourProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<List<Tour>> getTour() async {
    const String apiEndPoint = '/tours';
    isLoading = true;
    List<Tour> tours = await getTours(apiEndPoint);
    isLoading = false;
    notifyListeners();
    return tours;
  }
}
