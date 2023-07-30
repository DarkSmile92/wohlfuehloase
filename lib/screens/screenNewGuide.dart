import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services.dart';

class NewGuideWidget extends StatefulWidget {
  @override
  _NewGuideWidgetState createState() => _NewGuideWidgetState();
}

class _NewGuideWidgetState extends State<NewGuideWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  // Function to handle POST request
  Future<void> _sendData(String name, String description) async {
    final GuideService guideService = GuideService();
    final Map<String, dynamic> guide = {
      'title': name,
      'body': description,
    };

    final response = await guideService.createGuide(guide);

    if (response.statusCode == 200) {
      print('Guide created successfully');
    } else {
      print('Failed to create guide');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) {
              _name = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Bitte gib einen Namen ein';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Beschreibung'),
            onSaved: (value) {
              _description = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Bitte gib eine Beschreibung ein';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _sendData(_name, _description);
              }
            },
            child: Text('Speichern'),
          ),
        ],
      ),
    );
  }
}
