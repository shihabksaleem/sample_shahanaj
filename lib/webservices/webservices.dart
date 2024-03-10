// import 'dart:convert';
// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:my_airport/model/airport_model.dart';

// class WebServices {
//   static const String apiUrl =
//       'https://flykioskuatelastic.caxita.ca/Data/GetAirport?value=d&culture=1&size=10';
//   Future<List<Airport>?> fetchData() async {
//     try {
//       var response = await http.get(Uri.parse(apiUrl));
//       //log(response.body.toString());

//       if (response.statusCode == 200) {

//         final jsonData = jsonDecode(response.body);

//         log(jsonData.toString());

//         return jsonData
//             .map<Airport>((json) => Airport.fromJson(json))
//             .toList();

//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       print(error);
//     }
//     return null;

//   }

// }

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:my_airport/model/airport_model.dart';

class WebServices {
  static const String apiUrl = 'https://flykioskuatelastic.caxita.ca/Data/GetAirport?value=d&culture=1&size=10';

  Future<dynamic> fetchData() async {
    try {
      var response = await http.get(Uri.parse(apiUrl));
      // log(response.body.toString());

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)["hits"];

        log(jsonData.toString());

        return jsonData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
