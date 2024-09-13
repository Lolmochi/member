import 'package:flutter/material.dart';
import 'annual_dividend_screen.dart'; // ตรวจสอบการอ้างอิงนี้ให้ถูกต้อง
import 'member_details_screen.dart';
import 'login_customer.dart';

class HomePage extends StatelessWidget {
  final String phoneNumber;

  HomePage({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green[800],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[800],
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Member Details'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberDetailsScreen(phoneNumber: phoneNumber),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Annual Dividend'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnnualDividendScreen(phoneNumber: phoneNumber),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginCustomer(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(child: Text('Welcome, $phoneNumber')),
    );
  }
}
