import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MemberDetailsScreen extends StatefulWidget {
  final String phoneNumber;

  MemberDetailsScreen({required this.phoneNumber});

  @override
  _MemberDetailsScreenState createState() => _MemberDetailsScreenState();
}

class _MemberDetailsScreenState extends State<MemberDetailsScreen> {
  Map<String, dynamic> memberData = {};
  List<dynamic> transactions = [];

  @override
  void initState() {
    super.initState();
    fetchMemberData();
  }

  Future<void> fetchMemberData() async {
    final response = await http.get(Uri.parse('http://192.168.1.9:3000/member/${widget.phoneNumber}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        memberData = data['member'];
        transactions = data['transactions'];
      });
    } else {
      setState(() {
        memberData = {};
        transactions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Details'),
        backgroundColor: Colors.green[800],
      ),
      body: memberData.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone Number: ${memberData['phone_number']}', style: TextStyle(fontSize: 18)),
                Text('Points: ${memberData['points']}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text('Transactions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        title: Text('Transaction ID: ${transaction['transaction_id']}'),
                        subtitle: Text('Fuel Type: ${transaction['fuel_type']}\nPrice: ${transaction['price']}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
