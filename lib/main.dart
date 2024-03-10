import 'package:flutter/material.dart';
import 'package:my_airport/controller/airport_controller.dart';
import 'package:my_airport/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AirportData(),
      child: MaterialApp(
        title: 'Airport Data App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home:   const AirportDataScreen(),
      ),
    );
  }
}





