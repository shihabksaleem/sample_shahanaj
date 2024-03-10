import 'package:flutter/material.dart';

import '../model/airport_model.dart';

class AirportData with ChangeNotifier {
  List<Airports> _airportData = [];
  final bool _isLoading = true;

  List<Airports> get airportData => _airportData;
  bool get isLoading => _isLoading;

  void setAirportData(List<Airports> data) {
    _airportData = data;
    notifyListeners();
  }

  // Method to filter all airports
  List<Airports> filterAllAirports() {
    return List<Airports>.from(_airportData);
  }

  void sortData({required SortType sortType}) {
    if (sortType == SortType.AtoZ) {
      // _airportData.sort((a, b) => a.source.countryname.compareTo(b.source.countryname));
    } else {
      // _airportData.sort((a, b) => b.source.countryname.compareTo(a.source.countryname));
    }
    notifyListeners();
  }
}

// ignore: constant_identifier_names
enum SortType { AtoZ, ZtoA }
