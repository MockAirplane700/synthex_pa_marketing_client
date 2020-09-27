part of pabackend;
/*  This class will hold registration processing as we need
    to record name, email , password, address , etc
 */
class Register {

  //TODO: Create upload function that upload appropriate information
  static String uploadCredentals (String name, String address , String phoneNumber, String age) {

    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    String string;

    try {
      users.doc().set({
        'full_name' : name,
        'age':age,
        'address':address,
        'phone_number':phoneNumber
      }).then((value) => print("User added")).catchError((error) => print("Failed"));
      string = "";
    }catch (ioe) {
      string = "Unable to upload required information";
      print(ioe.toString());
    }//end try-catch
    return string;

  }//end upload credentials

  //TODO: Create register with google returns null on success
  static String registerWithGoogle() {

    GoogleSignIn _googlesignin = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly'
      ]
    );

    String string;

    try {
      Future <GoogleSignInAccount> account = _googlesignin.signIn();
      account.whenComplete(() =>
        string = ""
      );
    }catch (ioe) {
      string = "Error failed to sign in";
      print(ioe.toString());
    }//end try-catch

    return string;
  }//end register with google

  //TODO: Create register with email return null string on success

  static String registerEmailandPassword(String email , String password) {

    String string;

    try {
      Future<UserCredential> user = FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      user.whenComplete(() =>
          string = null
      );

    }catch (IOE){
      string = "Error";
      print(IOE.toString());
    }//end try-catch

    return string;
  }//end register with email and password

  //TODO: Create method that allows for password reset

  static String resetPassword(String email) {
    String string;
    try{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      string = "";
    }catch (ioe){
      string = "Error reseting password";
      print(ioe.toString());
    }//end try-catch

    return string;
  }//end reset password

}//end class