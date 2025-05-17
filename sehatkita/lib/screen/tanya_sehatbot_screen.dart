import 'package:flutter/material.dart';
import 'package:sehatkita/color.dart'; // Menggunakan warna dari AppColors

class TanyaSehatBotScreen extends StatefulWidget {
  @override
  _TanyaSehatBotScreenState createState() => _TanyaSehatBotScreenState();
}

class _TanyaSehatBotScreenState extends State<TanyaSehatBotScreen> {
  final _messageController = TextEditingController();
  final List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Tanya SehatBoT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_messages[index]));
              },
            ),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(labelText: 'Tanya SehatBoT'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _messages.add(_messageController.text);
              });
            },
            child: Text('Kirim'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
