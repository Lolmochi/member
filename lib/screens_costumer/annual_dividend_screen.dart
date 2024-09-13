import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnualDividendScreen extends StatefulWidget {
  final String phoneNumber;

  AnnualDividendScreen({required this.phoneNumber});

  @override
  _AnnualDividendScreenState createState() => _AnnualDividendScreenState();
}

class _AnnualDividendScreenState extends State<AnnualDividendScreen> {
  String annualDividend = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchAnnualDividend();
  }

  Future<void> fetchAnnualDividend() async {
    final response = await http.get(Uri.parse('http://192.168.1.9:3000/member/${widget.phoneNumber}/annual_dividend'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        annualDividend = data['annualDividend'];
      });
    } else {
      setState(() {
        annualDividend = 'Failed to load data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annual Dividend'),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Text('Annual Dividend: \$${annualDividend}'),
      ),
    );
  }
}
