import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_auth/models/edit_profilemodel.dart'; // Import your UpdateProfile model

// Import your UpdateProfile models

class UserRemoteService {
  Future<UpdateProfileResponse> updateUserProfile({
    required int userId,
    required String username,
    required String email,
    required String userImage,
    required String address,
    required String contactNum,
  }) async {
    final String apiUrl =
        "http://192.168.1.79:3000/users/$userId"; // Replace with your API endpoint

    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final requestBody = jsonEncode({
      'username': username,
      'email': email,
      'userimage': userImage,
      'address': address,
      'contact_num': contactNum,
    });

    final response = await http.patch(
      Uri.parse(apiUrl),
      headers: headers,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return UpdateProfileResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to update profile: ${response.statusCode}');
    }
  }
}
