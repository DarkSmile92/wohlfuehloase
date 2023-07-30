import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class GuideService {
  final String apiPath = "/api/guides/local";

  // Create a new guide
  Future<http.Response> createGuide(Map<String, dynamic> guide) async {
    final response = await http.post(
      Uri.parse('$ApiUrl$apiPath'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(guide),
    );
    return response;
  }

  // Retrieve all guides
  Future<List<dynamic>> getGuides() async {
    final response = await http.get(
      Uri.parse('$ApiUrl$apiPath'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*'
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> guides = jsonResponse['data']
          ['guides']; // Accessing the 'data' and 'guides' fields
      return guides;
      // Assuming GuideObj has a fromJson method to parse individual guide objects
      // return guides.map((guide) => GuideObj.fromJson(guide)).toList();
    } else {
      throw Exception('Failed to load guides. Body: $response.body');
    }
  }

  // Retrieve a guide by ID
  Future<Map<String, dynamic>> getGuideById(String id) async {
    final response = await http.get(Uri.parse('$ApiUrl$apiPath/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load guide');
    }
  }

  // Update a guide by ID
  Future<http.Response> updateGuide(
      String id, Map<String, dynamic> guide) async {
    final response = await http.put(
      Uri.parse('$ApiUrl$apiPath/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(guide),
    );
    return response;
  }

  // Delete a guide by ID
  Future<http.Response> deleteGuide(String id) async {
    final response = await http.delete(Uri.parse('$ApiUrl$apiPath/$id'));
    return response;
  }
}

class GuideEntryService {
  final String apiPath = "/api/guides/local";

  // Create a new guide entry
  Future<http.Response> createGuideEntry(
      Map<String, dynamic> guideEntry) async {
    final response = await http.post(
      Uri.parse('$ApiUrl$apiPath'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(guideEntry),
    );
    return response;
  }

  // Retrieve all entries for a specific guide by guide ID
  Future<List<dynamic>> getEntriesToGuide(String guideId) async {
    final response =
        await http.get(Uri.parse('$ApiUrl$apiPath?guideId=$guideId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load guide entries');
    }
  }

  // Retrieve a guide entry by ID
  Future<Map<String, dynamic>> getGuideEntryById(
      String guideId, String entryId) async {
    final response =
        await http.get(Uri.parse('$ApiUrl$apiPath/$guideId/entries/$entryId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load guide entry');
    }
  }

  // Update a guide entry by ID
  Future<http.Response> updateGuideEntry(
      String guideId, String entryId, Map<String, dynamic> guideEntry) async {
    final response = await http.put(
      Uri.parse('$ApiUrl$apiPath/$guideId/entries/$entryId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(guideEntry),
    );
    return response;
  }

  // Delete a guide entry by ID
  Future<http.Response> deleteGuideEntry(String guideId, String entryId) async {
    final response = await http
        .delete(Uri.parse('$ApiUrl$apiPath/$guideId/entries/$entryId'));
    return response;
  }
}
