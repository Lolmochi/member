import 'package:flutter/material.dart';
import 'screens_costumer/login_customer.dart';
import 'screens_costumer/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginCustomer(),
        '/home': (context) => HomePage(phoneNumber: ModalRoute.of(context)!.settings.arguments as String),
      },
    );
  }
}
