part of pabackend;

class EmailLogin {
  static String loginEmailPassword(
      String enteredEmail, String enteredPassword) {
    var result = "";
    try {
      Future<UserCredential> user = FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: enteredEmail, password: enteredPassword);
      user.whenComplete(() => result = null);
    } catch (IOE) {
      result = "Error";
      print(IOE.toString());
    }
    return result;
  }

  static String emailSignOut() {
    var result = "";
    try {
      Future<UserCredential> user = FirebaseAuth.instance.signOut();
      user.whenComplete(() => result = null);
    } catch (IOE) {
      result = "Error";
      print(IOE.toString());
    }

    return result;
  }
}

class GoogleLogIn {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleLogIn() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

   Future<void> handleSignOut() async 
  {
    _googleSignIn.disconnect();
  }
}
