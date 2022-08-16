import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser

  User _userFromFirebaseUser(Firebase user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthSateChanged.map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();

      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      (e.toString());
      return null;
    }
  }
}
