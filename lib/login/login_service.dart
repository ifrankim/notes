import 'package:google_sign_in/google_sign_in.dart';
import 'model/user_model.dart';

abstract class LoginService {
  Future<UserModel> googleSignIn();
}

class LoginServiceImplementation implements LoginService {
  @override
  Future<UserModel> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final account = await _googleSignIn.signIn();
    return UserModel.googleParse(account!);
  }
}
