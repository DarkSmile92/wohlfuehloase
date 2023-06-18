import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// call widget via NewEntryWidget(guideId: 1)
class NewEntryWidget extends StatefulWidget {
  final int guideId;

  NewEntryWidget({Key? key, required this.guideId}) : super(key: key);

  @override
  _NewEntryWidgetState createState() => _NewEntryWidgetState();
}

class _NewEntryWidgetState extends State<NewEntryWidget> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';

  Future<void> _sendData(String name, String description, int guideId) async {
    var url = Uri.parse('https://example.com/your_api_endpoint');
    var response = await http.post(url, body: {
      'name': name,
      'description': description,
      'guideId': guideId.toString()
    });

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
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
            decoration: const InputDecoration(labelText: 'Beschreibung'),
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
                _sendData(_name, _description, widget.guideId);
              }
            },
            child: const Text('Speichern'),
          ),
        ],
      ),
    );
  }
}
