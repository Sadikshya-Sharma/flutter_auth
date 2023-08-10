import 'package:get/get.dart';
import 'package:flutter_auth/models/edit_profilemodel.dart'; // Import your UpdateProfile model
import 'package:flutter_auth/services/remoteservices.dart'; // Import your RemoteService

class UserProfileController extends GetxController {
  final UserRemoteService _remoteService = UserRemoteService();
  var isLoading = false.obs;

  Future<void> updateUserProfile({
    required int userId,
    required String username,
    required String email,
    required String userImage,
    required String address,
    required String contactNum,
  }) async {
    try {
      isLoading.value = true;

      // Call the remote service to update the user profile
      UpdateProfileResponse updateProfileResponse =
          await _remoteService.updateUserProfile(
        userId: userId,
        username: username,
        email: email,
        userImage: userImage,
        address: address,
        contactNum: contactNum,
      );

      // Update the user data in the controller
      UserProfile updatedUser = updateProfileResponse.user;

      print('User profile updated: $updatedUser');
      print('Message: ${updateProfileResponse.message}');
    } catch (error) {
      print('Error updating profile: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
