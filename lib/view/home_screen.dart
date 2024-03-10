

import 'package:flutter/material.dart';
import 'package:my_airport/webservices/webservices.dart';
import 'package:provider/provider.dart';

import '../controller/airport_controller.dart';
import '../model/airport_model.dart';

class AirportDataScreen extends StatefulWidget {
  const AirportDataScreen({Key? key}) : super(key: key);

  @override
  _AirportDataScreenState createState() => _AirportDataScreenState();
}

class _AirportDataScreenState extends State<AirportDataScreen> {
  late AirportData _airportController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    //_airportController = Provider.of<AirportData>(context, listen: false);
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      List<Airport>? data = await WebServices().fetchData();
      _airportController.setAirportData(data!);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Sort',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'All Airports',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 5),
                      OutlinedButton(
                        onPressed: () {
                          _airportController.sortData(sortType: SortType.ZtoA);
                        },
                        child: const Text(
                          'Sort A to Z',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          _airportController.sortData(sortType: SortType.AtoZ);
                        },
                        child: const Text(
                          'Sort Z to A',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Expanded(
                  child: Consumer<AirportData>(
                    builder: (context, airportData, _) {
                      return ListView.separated(
                        itemCount: airportData.airportData.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 2,
                          );
                        },
                        itemBuilder: (context, index) {
                          final airport = airportData.airportData[index];
                          //log(airportData.toString());
                          return ListTile(
                            leading: Text(
                              airport.source.code,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            title: Text(
                              '${airport.source.city} - ${airport.source.countryname}',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
