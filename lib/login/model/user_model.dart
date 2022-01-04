import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String email;
  final String? name;
  final String id;
  final String? photoUrl;

  UserModel({
    required this.email,
    this.name,
    required this.id,
    this.photoUrl,
  });

  factory UserModel.googleParse(GoogleSignInAccount account) {
    return UserModel(
        email: account.email,
        name: account.displayName,
        id: account.id,
        photoUrl: account.photoUrl);
  }
}
