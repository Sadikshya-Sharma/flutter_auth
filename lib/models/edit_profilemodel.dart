class UpdateProfileResponse {
  bool status;
  String message;
  UserProfile user;

  UpdateProfileResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse(
        status: json["status"],
        message: json["message"],
        user: UserProfile.fromJson(json["user"]),
      );
}

class UserProfile {
  int id;
  String username;
  String email;
  String userImage;
  String address;
  String contactNum;

  UserProfile({
    required this.id,
    required this.username,
    required this.email,
    required this.userImage,
    required this.address,
    required this.contactNum,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        userImage: json["userimage"],
        address: json["address"],
        contactNum: json["contact_num"],
      );
}
